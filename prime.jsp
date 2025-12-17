<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Prime Number Check</title></head>
    <body>
        <center>
        <h2>Prime Number Checker</h2>
        <form method="post">
            Enter a number: <input type="number" name="num" required>
            <input type="submit" value="Check">
        </form>
   
        <%
            String numStr = request.getParameter("num");
            if (numStr != null) {
                int num = Integer.parseInt(numStr);
                boolean isPrime = true;
                
                if (num <= 1) {
                    isPrime = false;
                } else {
                    for (int i = 2; i <= Math.sqrt(num); i++) {
                        if (num % i == 0) {
                            isPrime = false;
                            break;
                        }
                    }
                }
                
                if (isPrime) {
                    out.println("<p>" + num + " is a Prime Number.</p>");
                } else {
                    out.println("<p>" + num + " is NOT a Prime Number.</p>");
                }
            }
        %>
         </center>
    </body>
</html>