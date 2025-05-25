package ser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	public Account getAccountByAccNoAndPassword(String accno) {
        Account account = null;
        String sql = "SELECT * FROM account WHERE accno = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, accno);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    account = new Account();
                    account.setAccno(resultSet.getString("accno"));
                    account.setAcc_type(resultSet.getString("acc_type"));
                    account.setName(resultSet.getString("name"));
                    account.setBalance(resultSet.getLong("balance"));
                    account.setPassword(resultSet.getString("password"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle SQL exceptions appropriately
        }
        
        return account;
    }

}
