<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fascinating Number Checker</title>
</head>
<body>

    <h2>Fascinating Number Checker</h2>
    <p>Enter a number (3 or more digits) to check if it's a Fascinating Number.</p>

    <form action="" method="post">
        Enter Number: <input type="number" name="numberInput" required>
        <input type="submit" value="Check">
    </form>

    <%
        String numberStr = request.getParameter("numberInput");
        if (numberStr != null && !numberStr.isEmpty()) {
            try {
                int number = Integer.parseInt(numberStr);

                if (number < 100) {
                    out.println("<p style='color:red;'>Please enter a number with at least 3 digits.</p>");
                } else {
                    String concatenatedStr = numberStr + (number * 2) + (number * 3);

                    boolean isFascinating = true;
                    if (concatenatedStr.length() != 9 || concatenatedStr.contains("0")) {
                        isFascinating = false;
                    } else {
                    
                        boolean[] digits = new boolean[10]; 
                        for (char c : concatenatedStr.toCharArray()) {
                            int digit = Character.getNumericValue(c);
                            if (digit < 1 || digit > 9 || digits[digit]) {
                                isFascinating = false;
                                break;
                            }
                            digits[digit] = true;
                        }
                    }

                    out.println("<h3>Result for " + number + "</h3>");
                    out.println("<p>Concatenated String: " + concatenatedStr + "</p>");
                    if (isFascinating) {
                        out.println("<p><strong>" + number + " is a Fascinating Number.</strong></p>");
                    } else {
                        out.println("<p><strong>" + number + " is not a Fascinating Number.</strong></p>");
                    }
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter a valid number.</p>");
            }
        }
    %>

</body>
</html>