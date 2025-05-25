package ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accno = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
        	conn = DBConnection.getConnection();
            String query = "SELECT accno, password FROM account WHERE accno = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, accno);
            ps.setString(2, password);
            rs = ps.executeQuery();

            // Validate user credentials
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("accno", accno);// Redirect to success page
                AccountDAO accountDAO = new AccountDAO();
                Account account = accountDAO.getAccountByAccNoAndPassword(accno);

                if (account != null) {
                    session.setAttribute("account", account);
                    response.sendRedirect("dashboard.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid credentials");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid username or password"); // Redirect back to login with error
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

