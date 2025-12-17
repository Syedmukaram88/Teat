<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Smith Number Checker</title>
</head>
<body>

    <h2>Smith Number Checker</h2>
    <p>Enter a number to check if it's a Smith number.</p>

    <form action="" method="post">
        Enter Number: <input type="number" name="numberInput" required>
        <input type="submit" value="Check">
    </form>

    <%!
     
        public int sumDigits(int n) {
            int sum = 0;
            String s = Integer.toString(n);
            for (int i = 0; i < s.length(); i++) {
                sum += Character.getNumericValue(s.charAt(i));
            }
            return sum;
        }

    
        public int sumPrimeFactorsDigits(int n) {
            int originalNumber = n;
            int sumPrimeFactors = 0;
            
       
            while (n % 2 == 0) {
                sumPrimeFactors += sumDigits(2);
                n /= 2;
            }

         
            for (int i = 3; i <= Math.sqrt(n); i += 2) {
                while (n % i == 0) {
                    sumPrimeFactors += sumDigits(i);
                    n /= i;
                }
            }
            
     
            if (n > 2) {
                sumPrimeFactors += sumDigits(n);
            }
            return sumPrimeFactors;
        }
    %>

    <%
        String numberStr = request.getParameter("numberInput");
        if (numberStr != null && !numberStr.isEmpty()) {
            try {
                int number = Integer.parseInt(numberStr);
                
         
                if (number < 4) {
                    out.println("<p>Please enter a composite number (e.g., a number &ge; 4).</p>");
                } else {
                    int sumOfDigits = sumDigits(number);
                    int sumOfPrimeFactorsDigits = sumPrimeFactorsDigits(number);
                    
                    out.println("<h3>Result for " + number + "</h3>");
                    out.println("<p>Sum of digits: " + sumOfDigits + "</p>");
                    out.println("<p>Sum of prime factors' digits: " + sumOfPrimeFactorsDigits + "</p>");

                    if (sumOfDigits == sumOfPrimeFactorsDigits) {
                        out.println("<p><strong>" + number + " is a Smith Number.</strong></p>");
                    } else {
                        out.println("<p><strong>" + number + " is not a Smith Number.</strong></p>");
                    }
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter a valid number.</p>");
            }
        }
    %>

</body>
</html>