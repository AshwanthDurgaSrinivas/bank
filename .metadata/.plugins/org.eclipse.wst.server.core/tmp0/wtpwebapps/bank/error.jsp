<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
       <!DOCTYPE html>
       <html lang="en">
       <head>
           <meta charset="UTF-8">
           <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <title>Failed to Create</title>
           <style>
               @import url('https://fonts.googleapis.com/css?family=Roboto:300');

               body {
                   margin: 0;
                   padding: 0;
                   background-image: url('https://i.postimg.cc/5tFkFQF0/login.jpg');
                   background-size: cover;
                   background-position: center;
                   display: flex;
                   justify-content: flex-end;
                   align-items: flex-start;
                   height: 100vh;
               }

               .message-page {
                   width: 360px;
                   margin-right: 175px;
                   margin-top: 200px;
               }

               .form {
                   position: relative;
                   z-index: 1;
                   background: rgba(71, 70, 70, 0.3);
                   backdrop-filter: blur(10px);
                   max-width: 360px;
                   margin: 0 auto 100px;
                   padding: 45px;
                   text-align: center;
                   box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
               }

               h1 {
                   color: white;
                   font-size: 2.5em;
                   opacity: 0;
                   animation: fadeIn 2s ease-in-out forwards, shake 0.5s ease-in-out 2.5s;
               }

               @keyframes fadeIn {
                   0% {
                       opacity: 0;
                       transform: translateY(-20px);
                   }
                   100% {
                       opacity: 1;
                       transform: translateY(0);
                   }
               }

               @keyframes shake {
                   0%, 100% { transform: translateX(0); }
                   25% { transform: translateX(-5px); }
                   50% { transform: translateX(5px); }
                   75% { transform: translateX(-5px); }
               }

               .back-button {
                   font-family: "Roboto", sans-serif;
                   text-transform: uppercase;
                   outline: 0;
                   background: #156ab9;
                   width: 100%;
                   border: 0;
                   padding: 15px;
                   color: #FFFFFF;
                   font-size: 14px;
                   margin-top: 20px;
                   cursor: pointer;
                   -webkit-transition: all 0.3s ease;
                   transition: all 0.3s ease;
               }

               .back-button:hover, .back-button:active, .back-button:focus {
                   background: #283365;
               }
           </style>
       </head>
       <body>
           <div class="message-page">
               <div class="form">
                   <h1>Failed to Create</h1>
                   <button class="back-button" onclick="window.location.href='index.jsp';">Back to Home</button>
               </div>
           </div>
       </body>
       </html>

</html>