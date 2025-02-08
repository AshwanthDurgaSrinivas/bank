    <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Funds</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto:300');

        body {
            margin: 0;
            padding: 0;
            background-image: url('https://i.postimg.cc/2yTHf4gH/transcation.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh;
        }

        .withdraw-container {
            width: 360px;
            background: rgba(71, 70, 70, 0.3); /* Transparent background */
            backdrop-filter: blur(10px);
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .withdraw-container h3 {
            color: #ffffff;
            font-family: "Roboto", sans-serif;
            font-weight: 300;
            margin-bottom: 30px;
        }

        .withdraw-container input {
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

        .withdraw-container button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #156ab9;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            transition: all 0.3s ease;
            cursor: pointer;
            margin-top: 15px;
        }

        .withdraw-container button:hover,
        .withdraw-container button:active,
        .withdraw-container button:focus {
            background: #283365;
        }

        .withdraw-container .home-button {
            background: #555;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="WithdrawalServlet" method="post">
    <div class="withdraw-container">
        <h3>Withdraw</h3>
        <input type="number" id="amount" name="amount" placeholder="Enter Amount" required>
        <input type="text" id="password" name="password" placeholder="Enter your password" required>
        <button type="submit" id="withdraw-btn">Withdraw</button>
        <button id="home-btn" class="home-button" onclick="window.location.href='dashboard.jsp';">Dashboard</button>
    </div>
</form>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>
