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
            background-image: url('https://i.postimg.cc/5tFkFQF0/login.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: flex-end; /* Align to the right */
            align-items: flex-start; /* Align to the top */
            height: 100vh;
        }

        .login-page {
            width: 360px;
            margin-right: 175px; /* Space between container and right edge */
            margin-top: 200px; /* Space between container and top of the screen */
        }

        .form {
            position: relative;
            z-index: 1;
            background: rgba(71, 70, 70, 0.3); /* Transparent background */
            backdrop-filter: blur(10px);
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
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
            background: #156ab9;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #283365;
        }

        .form .message {
            margin: 25px 0 0;
            color: #b3b3b3;
            font-size: 15px;
        }

        .form .message a {
            color: #156ab9;
            text-decoration: none;
        }

        .form .register-form {
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="login-form" action="LoginServlet" method="post">
		    <input type="text" name="username" placeholder="username" required/>
		    <input type="password" name="password" placeholder="password" required/>
		    <button type="submit">SIGN IN</button>
		    <p class="message">Not registered? <a href="create.jsp">Create an account</a></p>
		    <p class="message">Not registered? <a href="home.jsp">With-Out Login(As a guest)</a></p>
			</form>

        </div>
    </div>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>