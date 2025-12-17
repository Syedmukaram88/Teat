<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Composite Magic Number Checker</title>
</head>
<body>

    <h2>Composite Magic Number Checker</h2>
    <p>Enter a range (m and n, where m < n) to find composite magic numbers.</p>

    <form action="" method="post">
        Start (m): <input type="number" name="m" required><br><br>
        End (n): <input type="number" name="n" required><br><br>
        <input type="submit" value="Find Numbers">
    </form>

    <%!
       
        public boolean isMagic(int num) {
            int sum = 0;
            while (num > 9) {
                sum = 0;
                String s = Integer.toString(num);
                for (int i = 0; i < s.length(); i++) {
                    sum += Character.getNumericValue(s.charAt(i));
                }
                num = sum;
            }
            return num == 1;
        }

      
        public boolean isComposite(int num) {
            if (num <= 3) {
                return false;
            }
            int count = 0;
            for (int i = 1; i <= num; i++) {
                if (num % i == 0) {
                    count++;
                }
            }
            return count > 2;
        }
    %>

    <%
        String mStr = request.getParameter("m");
        String nStr = request.getParameter("n");

        if (mStr != null && nStr != null && !mStr.isEmpty() && !nStr.isEmpty()) {
            try {
                int m = Integer.parseInt(mStr);
                int n = Integer.parseInt(nStr);
                
                if (m >= n || m < 0) {
                    out.println("<p style='color:red;'>Invalid input. Please ensure m < n and both are positive.</p>");
                } else {
                    StringBuilder resultNumbers = new StringBuilder();
                    int frequency = 0;

                    for (int i = m; i <= n; i++) {
                        if (isComposite(i) && isMagic(i)) {
                            resultNumbers.append(i).append(", ");
                            frequency++;
                        }
                    }

                    if (resultNumbers.length() > 0) {
                   
                        resultNumbers.setLength(resultNumbers.length() - 2);
                    }
                    
                    out.println("<hr>");
                    out.println("<p>The composite magic numbers are " + resultNumbers.toString() + "</p>");
                    out.println("<p>Frequency of composite magic numbers: " + frequency + "</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter valid integer values.</p>");
            }
        }
    %>
</body>
</html>