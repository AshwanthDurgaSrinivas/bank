package ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DepositingServlet")
public class DepositingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	String accNo = (String) session.getAttribute("accno");
        String password = request.getParameter("password");
        String amountStr = request.getParameter("amount");
        long amount = Long.parseLong(amountStr);

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
        	conn = DBConnection.getConnection();
            String sqlSelect = "SELECT balance FROM account WHERE accno = ? and password = ?";
            pst = conn.prepareStatement(sqlSelect);
            pst.setString(1, accNo);
            pst.setString(2, password);
            rs = pst.executeQuery();

            long currentBalance = 0;
            if (rs.next()) {
                currentBalance = rs.getLong("balance");
            }

            // Update the balance
            long newBalance = currentBalance + amount;
            String sqlUpdate = "UPDATE account SET balance = ? WHERE accno = ? and password = ?";
            pst = conn.prepareStatement(sqlUpdate);
            pst.setLong(1, newBalance);
            pst.setString(2, accNo);
            pst.setString(3, password);

            int rowsAffected = pst.executeUpdate();

            // Response back to the client
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (rowsAffected > 0) {
                out.println("<script>alert('Deposit successful!');window.location.href='dashboard.jsp';</script>");
            } else {
                out.println("<script>alert('Deposit failed. Account not found.');window.location.href='deposting.jsp';</script>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
