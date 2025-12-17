<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Evil Number Checker</title>
</head>
<body>
    <h2>Evil Number Checker</h2>

    <form action="" method="post">
        Enter a positive whole number: <input type="number" name="numberInput" required>
        <input type="submit" value="Check">
    </form>

    <%
       
        String numberStr = request.getParameter("numberInput");
        if (numberStr != null && !numberStr.isEmpty()) {
            try {
       
                int number = Integer.parseInt(numberStr);

      
                if (number > 0) {
           
                    String binaryEquivalent = Integer.toBinaryString(number);

         
                    int countOnes = 0;
                    for (char bit : binaryEquivalent.toCharArray()) {
                        if (bit == '1') {
                            countOnes++;
                        }
                    }

            
                    String resultMessage;
                    if (countOnes % 2 == 0) {
                        resultMessage = "Evil Number";
                    } else {
                        resultMessage = "Not an Evil Number";
                    }
    %>
                    <h3>Result</h3>
                    <p>Input: <%= number %></p>
                    <p>Binary Equivalent: <%= binaryEquivalent %></p>
                    <p>No. of 1's: <%= countOnes %></p>
                    <p>Output: <strong><%= resultMessage %></strong></p>
    <%
                } else {
                    out.println("<p style='color:red;'>Please enter a positive whole number.</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter a valid number.</p>");
            }
        }
    %>
</body>
</html>