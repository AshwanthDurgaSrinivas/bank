package ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/create")
public class create extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String accountNo = request.getParameter("accno");
	        String accountType = request.getParameter("accType");
	        String name = request.getParameter("name");
	        double balance = Double.parseDouble(request.getParameter("balance"));
	        String password = request.getParameter("password");

	        try {
	        	Connection connection = DBConnection.getConnection();
	            String sql = "INSERT INTO account (accno, acc_type, name, balance,password) VALUES (?, ?, ?, ?,?)";
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, accountNo);
	            statement.setString(2, accountType);
	            statement.setString(3, name);
	            statement.setDouble(4, balance);
	            statement.setString(5, password);
	            int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {
	                response.sendRedirect("home.jsp"); // Redirect to a success page
	            } else {
	                response.sendRedirect("error.jsp"); // Redirect to an error page
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp"); // Redirect to an error page
	        }
		}

}
