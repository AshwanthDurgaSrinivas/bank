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

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accNo = request.getParameter("account-number");
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
            pst.setString(2,password);
            rs = pst.executeQuery();

            long currentBalance = 0;
            if (rs.next()) {
                currentBalance = rs.getLong("balance");
            }

            // Check if the balance is sufficient for the withdrawal
            if (currentBalance >= amount) {
                // Update the balance
                long newBalance = currentBalance - amount;
                String sqlUpdate = "UPDATE account SET balance = ? WHERE accno = ?";
                pst = conn.prepareStatement(sqlUpdate);
                pst.setLong(1, newBalance);
                pst.setString(2, accNo);

                int rowsAffected = pst.executeUpdate();

                // Response back to the client
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                if (rowsAffected > 0) {
                    out.println("<script>alert('Withdrawal successful!');window.location.href='home.jsp';</script>");
                } else {
                    out.println("<script>alert('Withdrawal failed. Account not found.');window.location.href='withdraw.jsp';</script>");
                }
            } else {
                // Insufficient funds
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Insufficient funds.');window.location.href='withdraw.jsp';</script>");
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

