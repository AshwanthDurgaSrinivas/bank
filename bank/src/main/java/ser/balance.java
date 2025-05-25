package ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class balance
 */
@WebServlet("/balance")
public class balance extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accNo = request.getParameter("account-number");

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
        	conn = DBConnection.getConnection();
            String sqlSelect = "SELECT balance FROM account WHERE accno = ?";
            pst = conn.prepareStatement(sqlSelect);
            pst.setString(1, accNo);
            rs = pst.executeQuery();

            long balance = 0;
            if (rs.next()) {
                balance = rs.getLong("balance");
            } else {
                request.setAttribute("message", "Account not found.");
            }

            // Set the balance in the request
            request.setAttribute("balance", balance);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error retrieving balance.");
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

        // Forward the request back to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("balance.jsp");
        dispatcher.forward(request, response);
    }
}
