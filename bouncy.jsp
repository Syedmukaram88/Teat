<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bouncy Number Checker</title>
</head>
<body>
    <h2>Bouncy Number Checker</h2>
    <p>Enter a number to check if it's a Bouncy number.</p>

    <form action="" method="post">
        Enter a number: <input type="number" name="numberInput" required>
        <input type="submit" value="Check">
    </form>

    <%
        String numberStr = request.getParameter("numberInput");
        if (numberStr != null && !numberStr.isEmpty()) {
            try {
                int number = Integer.parseInt(numberStr);

                if (number < 100) {
                    out.println("<p>Numbers less than 100 cannot be Bouncy numbers.</p>");
                } else {
                    boolean isIncreasing = true;
                    boolean isDecreasing = true;

                   
                    String s = Integer.toString(number);
                    
                  
                    for (int i = 0; i < s.length() - 1; i++) {
                        if (s.charAt(i) > s.charAt(i+1)) {
                            isIncreasing = false;
                            break;
                        }
                    }

                  
                    for (int i = 0; i < s.length() - 1; i++) {
                        if (s.charAt(i) < s.charAt(i+1)) {
                            isDecreasing = false;
                            break;
                        }
                    }

                    out.println("<h3>Result:</h3>");
                    out.println("<p>Number: " + number + "</p>");

                    if (!isIncreasing && !isDecreasing) {
                        out.println("<p><strong>" + number + " is a Bouncy number.</strong></p>");
                    } else {
                        out.println("<p><strong>" + number + " is not a Bouncy number.</strong></p>");
                    }
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter a valid number.</p>");
            }
        }
    %>
</body>
</html>