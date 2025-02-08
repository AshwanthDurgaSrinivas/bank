<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
    @import url('https://fonts.googleapis.com/css?family=Roboto:300');

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

    .main-box {
        width: 360px;
        background: rgba(71, 70, 70, 0.3); /* Transparent background */
        backdrop-filter: blur(10px);
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .main-box h3 {
        color: #ffffff;
        font-size: 30px;
        font-family: Tahoma,verdana,sans-serif;

        margin-bottom: 30px;
    }

    .btn-box {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Two columns for buttons */
        gap: 10px; /* Spacing between buttons */
        margin-bottom: 20px; /* Space between button grid and exit button */
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 10px;
        background-color: #1f4c76; /* Default button background color */
        border-color: rgb(90, 126, 126);
        color: #FFFFFF;
        cursor: pointer; /* Change cursor to pointer on hover */
        transition: background-color 0.3s; /* Smooth background color transition */
    }

    button:hover {
        background-color: #1c5abf; /* Darker background on hover */
    }

    .exit {
        display: flex;
        justify-content: center;
        width: 100%;
    }

    .exit button {
        width: 150px;
        background-color: #41474e; /* Background color for Exit button */
    }

    .exit button:hover {
        background-color: #2a3741; /* Darker background on hover */
    }

</style>
</head>
<body>
<div>
    <div class="main-box">
    <center><h3>Logo Banking</h3></center>
        <div class="btn-box">
            <button id="check-balance-btn" onclick="window.location.href='balance.jsp';"> Balance </button>
            <button id="Deposit-btn" onclick="window.location.href='deposit.jsp';"> Deposit </button>
            <button id="Withdraw-btn" onclick="window.location.href='withdraw.jsp';"> Withdraw </button>
            <button id="Changepass-btn" onclick="window.location.href='Changepass.jsp';"> Changepass </button>
        </div>

        <div class="exit">
        <button id="btn-Exit" onclick="window.location.href='index.jsp';"> Exit </button>
    </div>
<div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script  src="js/index.js"></script>

</body>
</html>