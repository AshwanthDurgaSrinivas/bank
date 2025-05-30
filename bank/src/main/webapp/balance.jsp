<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Page</title>
    <style>
    @import url('https://fonts.googleapis.com/css?family=Roboto:300');

    body {
        margin: 0;
        padding: 0;
        background-image: url('./back.jpg'); /* Background image for the page */
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center; /* Center horizontally */
        align-items: center; /* Center vertically */
        height: 100vh;
    }

    .deposit-container {
        width: 360px;
        background: rgba(71, 70, 70, 0.3); /* Transparent background */
        backdrop-filter: blur(10px);
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .deposit-container h3 {
        color: #ffffff;
        font-family: "Roboto", sans-serif;
        font-weight: 300;
        margin-bottom: 30px;
    }

    .deposit-container input {
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

    .deposit-container button {
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

    .deposit-container button:hover,
    .deposit-container button:active,
    .deposit-container button:focus {
        background: #283365;
    }

    .deposit-container .home-button {
        background: #555;
        margin-top: 10px;
    }
    .balance-info{
    font-size:18px;
    }

    </style>
</head>
<body>
   <body>
   <form action="balance" method="post">
    <div class="deposit-container">
        <h3>BALANCE</h3>
        <input type="text" id="account-number" name="account-number" placeholder="Enter your Account number" required>
        <button type="submit" id="deposit-btn">CHECK</button>
        <button id="home-btn" class="home-button" onclick="window.location.href='home.jsp';">Home</button>
        
        <div class="balance-info">
            <c:if test="${balance != null}">
                Your balance is: <span class="balance-value">${balance}</span>
            </c:if>
            <c:if test="${message != null}">
                <span class="error-message">${message}</span>
            </c:if>
        </div>
    </div>
</form>
</body>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
</html>
