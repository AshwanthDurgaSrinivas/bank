<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

    .login-page {
        width: 360px;
        margin-right: 175px; /* Space between container and right edge */
        margin-top: 150px; /* Space between container and top of the screen */

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
      background: #07336b;
      width: 100%;
      border: 0;
      padding: 15px;
      color: #FFFFFF;
      font-size: 14px;
      -webkit-transition: all 0.3 ease;
      transition: all 0.3 ease;
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

    body {
            margin: 0;
            padding: 0;
            background-image: url('./create.png');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: flex-end; /* Align to the right */
            align-items: flex-start; /* Align to the top */
            height: 100vh;
    }

    </style>
</head>
<body>
    <div class="login-page">
      <div class="form">
       <form class="register-form" action="create" method="post">
           <input type="text" placeholder="account no" name="accno" id ="accno"/>
           <input type="text" placeholder="type" name="accType" id ="accType"/>
           <input type="text" placeholder="name" name="name" id ="name"/>
           <input type="text" placeholder="amount" name="balance" id="balance"/>
           <input type="text" placeholder="password" name="password" id="password"/>
           <button type="submit">Create</button>
           <p class="message">Already registered? <a href="./index.jsp">Sign In</a></p>
       </form>
      </div>
    </div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script  src="js/index.js"></script>

</body>
</html>