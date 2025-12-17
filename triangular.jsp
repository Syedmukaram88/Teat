<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Triangular Numbers</title>
</head>
<body>

    <h2>Triangular Numbers</h2>
    <p>Enter a positive integer 'n' to display all triangular numbers from 3 to 'n'.</p>

    <form action="" method="post">
        Enter n: <input type="number" name="n_input" required>
        <input type="submit" value="Display">
    </form>

    <%
        String nStr = request.getParameter("n_input");
        if (nStr != null && !nStr.isEmpty()) {
            try {
                int n = Integer.parseInt(nStr);
                
                if (n < 3) {
                    out.println("<p style='color:red;'>Please enter a number greater than or equal to 3.</p>");
                } else {
                    out.println("<h3>Triangular Numbers up to " + n + ":</h3>");
                    out.println("<ul>");
                    
                    int triangularNumber = 0;
                    for (int i = 1; ; i++) {
                        triangularNumber += i;
                        if (triangularNumber >= 3 && triangularNumber <= n) {
                            out.println("<li>" + triangularNumber + "</li>");
                        }
                        if (triangularNumber > n) {
                            break;
                        }
                    }
                    out.println("</ul>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter a valid integer.</p>");
            }
        }
    %>
</body>
</html>