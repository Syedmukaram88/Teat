<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Background Color Changer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            transition: background-color 0.5s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: white;
        }
        button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>JSP Color Changer</h2>
        <p>Click the button below to change the background!</p>
        <button onclick="changeColor()">Change Background Color</button>
    </div>

    <script>
     
        const colors = ["#FF5733", "#33FF57", "#3357FF", "#F333FF", "#F3FF33", "#FFFFFF"];
        let currentIndex = 0;

        function changeColor() {
      
            document.body.style.backgroundColor = colors[currentIndex];
            
   
            currentIndex = (currentIndex + 1) % colors.length;
        }
    </script>

</body>
</html>