<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>

         body {
                margin: 0;
                padding: 0;
                background-image: url('https://i.postimg.cc/nzB5N9H5/Dashboard.jpg'); /* Background image for the page */
                background-size: cover;
                background-position: center;
                display: flex;
                justify-content: center; /* Center horizontally */
                align-items: center; /* Center vertically */
                height: 100vh;
            }
        .account-container {
            background: rgba(71, 70, 70, 0.3);
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .account-detail {
            margin-bottom: 10px;
            font-size: 16px;
            color: #fff;
        }
        .account-detail strong {
            color: #cfcfcf;
        }
        .form{
         position: relative;
            z-index: 1;
            background: rgba(71, 70, 70, 0.3); /* Transparent background */
            backdrop-filter: blur(10px);
            max-width: 360px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            .header {
            display: flex;
            justify-content: space-around; /* Space buttons evenly */
            align-items: center; /* Center buttons vertically */
            background: rgba(71, 70, 70, 0.5); /* Semi-transparent background */
            padding: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Shadow effect */
            width: 100%; /* Full width */
            position: fixed; /* Fix the header at the top */
            top: 0;
            left: 0;
            z-index: 1000; /* Ensure header is above other content */
        }

        .header button {
            font-family: "Roboto", sans-serif;
            background: #07336b;
            color: #FFFFFF;
            
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .header button:hover, .header button:active, .header button:focus {
            background: #071041;
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #07336b;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #071041;
        }

        .form .message {
            margin: 15px 0 0;
            color: #999191;
            font-size: 15px;
        }

        .form .message a {
            color: #77a5e6;
            text-decoration: none;
        }
        .login-page {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            flex: 1; /* Take up remaining space below the header */
            margin-top: 60px; /* Adjust for the height of the fixed header */
            height: calc(100vh - 60px); /* Ensure full height minus header height */
        }
    </style>
      <script>
        // Reload the page every 30 seconds
        setTimeout(function(){
            window.location.reload(1);
        }, 30000);

        function performOperationAndReload() {
            // Execute your operation here

            // After operation completes, reload the page
            window.location.reload();
        }
    </script>
</head>
<body>
    <header class="header">
        <button id="transactionButton" onclick="window.location.href='transfer.jsp';" onclick="performOperationAndReload()">Transaction</button>
        <button id="Withdrawal" onclick="window.location.href='withdrawal.jsp';">Withdraw</button>
        <button id="Deposit" onclick="window.location.href='depositing.jsp';">Deposit</button>
        <button id="Logout" onclick="window.location.href='index.jsp';">Logout</button>
    </header>
    <div class="login-page">
        <div class="form">
            <h2>Your Account Details</h2>
            <c:forEach var="account" items="${accounts}">
                <div class="account-container">
                    <div class="account-detail"><strong>Account Number:</strong> ${account.accno}</div>
                    <div class="account-detail"><strong>Account Type:</strong> ${account.acc_type}</div>
                    <div class="account-detail"><strong>Name:</strong> ${account.name}</div>
                    <div class="account-detail"><strong>Balance:</strong> ${account.balance}</div>
                    
            </c:forEach>
        </div>
    </div>
    
</body>


</html>
