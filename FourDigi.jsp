<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Four-Digit Tech Numbers</title>
</head>
<body>
    <h2>Four-Digit Tech Numbers</h2>

    <p>A tech number is a number with an even number of digits. If the number is split into <br>two equal halves, the square of the sum of these halves is equal to the number itself.</p>
    
    <h3>Example:</h3>
    <p>
        Consider the number 3025<br>
        Square of sum of the halves of 3025 = (30 + 25)<sup>2</sup><br>
        = (55)<sup>2</sup><br>
        = 3025 is a tech number.
    </p>

    <h3>All Four-Digit Tech Numbers:</h3>
    <ul>
    <%
       
        for (int num = 1000; num < 10000; num++) {
           
            int firstHalf = num / 100;
            int secondHalf = num % 100;

          
            int sumOfHalves = firstHalf + secondHalf;
            
           
            if (Math.pow(sumOfHalves, 2) == num) {
            
                out.println("<li>" + num + "</li>");
            }
        }
    %>
    </ul>

</body>
</html>