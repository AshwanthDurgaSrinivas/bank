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

@WebServlet("/transferservelet")

public class transferservelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderAccNo = (String) request.getSession().getAttribute("accno");
        String password = request.getParameter("password");
        String receiverAccNo = request.getParameter("account-number");
        long transferAmount = Long.parseLong(request.getParameter("amount"));

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.getConnection();

            // Validate sender's account and password
            String query = "SELECT * FROM account WHERE accno = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, senderAccNo);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            PrintWriter out = response.getWriter();

            if (resultSet.next()) {
                long senderBalance = resultSet.getLong("balance");

                // Check if sender has enough balance
                if (senderBalance >= transferAmount) {
                    // Deduct amount from sender's account
                    String deductQuery = "UPDATE account SET balance = balance - ? WHERE accno = ?";
                    preparedStatement = connection.prepareStatement(deductQuery);
                    preparedStatement.setLong(1, transferAmount);
                    preparedStatement.setString(2, senderAccNo);
                    preparedStatement.executeUpdate();

                    // Add amount to receiver's account
                    String addQuery = "UPDATE account SET balance = balance + ? WHERE accno = ?";
                    preparedStatement = connection.prepareStatement(addQuery);
                    preparedStatement.setLong(1, transferAmount);
                    preparedStatement.setString(2, receiverAccNo);
                    int rowsUpdated = preparedStatement.executeUpdate();
                    
                    if (rowsUpdated > 0) {
                        // Redirect to success page or dashboard
                    	out.println("<script>alert('Transfer successful!');window.location.href='dashboard.jsp';</script>");
                    	
                    } else {
                        // Handle case where receiver's account does not exist
                    	out.println("<script>alert('Transfer failed!');window.location.href='transfer.jsp';</script>");

                    }
                } else {
                    // Insufficient balance
                    out.println("<script>alert('Insufficient balance!');window.location.href='transfer.jsp';</script>");
                }
            } else {
                // Invalid password
                out.println("<script>alert('Invalid password!');window.location.href='transfer.jsp';</script>");

            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing the transaction.");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
