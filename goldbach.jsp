<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Goldbach Number Checker</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .error { color: red; font-weight: bold; }
        .result { font-weight: bold; }
        pre { background-color: #f4f4f4; padding: 10px; border: 1px solid #ddd; }
    </style>
</head>
<body>

    <h2>Goldbach Number Checker</h2>
    <p>Enter an even integer 'N' where N > 9 and N < 50.</p>

    <form action="" method="post">
        Enter N: <input type="number" name="n_input" required>
        <input type="submit" value="Find Prime Pairs">
    </form>

    <%!
      
        public boolean isPrime(int num) {
            if (num <= 1) return false;
            for (int i = 2; i <= Math.sqrt(num); i++) {
                if (num % i == 0) return false;
            }
            return true;
        }
    %>

    <%
        String nStr = request.getParameter("n_input");
        if (nStr != null && !nStr.isEmpty()) {
            try {
                int N = Integer.parseInt(nStr);
                
              
                if (N % 2 != 0) {
                    out.println("<p class='error'>INVALID INPUT. NUMBER IS ODD.</p>");
                } else if (N <= 9 || N >= 50) {
                    out.println("<p class='error'>INVALID INPUT. NUMBER OUT OF RANGE.</p>");
                } else {
                    out.println("<p class='result'>PRIME PAIRS ARE:</p>");
                    out.println("<pre>");
            
                    for (int i = 3; i <= N / 2; i++) {
                        if (isPrime(i) && isPrime(N - i)) {
                    
                            if (i % 2 != 0 && (N - i) % 2 != 0) {
                                out.println(i + ", " + (N - i));
                            }
                        }
                    }
                    out.println("</pre>");
                }
            } catch (NumberFormatException e) {
                out.println("<p class='error'>Invalid input. Please enter an integer.</p>");
            }
        }
    %>

</body>
</html>