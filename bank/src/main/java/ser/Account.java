package ser;

public class Account {
    private String accno;
    private String acc_type;
    private String name;
    private Long balance;
    private String password;

    // Getters and Setters
    public String getAccno() { return accno; }
    public void setAccno(String accno) { this.accno = accno; }

    public String getAcc_type() { return acc_type; }
    public void setAcc_type(String acc_type) { this.acc_type = acc_type; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Long getBalance() { return balance; }
    public void setBalance(Long balance) { this.balance = balance; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
