<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
<head>
    <title>Fibonacci Series</title>
</head>
<body>
    <center>
    <h2>Enter the number of terms for the Fibonacci series</h2>
    <form action="" method="post">
        <label for="terms">Number of terms:</label>
        <input type="number" id="terms" name="terms" required min="1">
        <br><br>
        <input type="submit" value="Generate Series">
    </form>

    <%
       
        String termsString = request.getParameter("terms");
        int terms = 0;
        String errorMessage = "";

       
        if (termsString != null && !termsString.isEmpty()) {
            try {
                terms = Integer.parseInt(termsString);
                if (terms <= 0) {
                    errorMessage = "Please enter a positive integer.";
                }
            } catch (NumberFormatException e) {
                errorMessage = "Invalid input. Please enter a number.";
            }
        
        }

        if (errorMessage.isEmpty()) {
            long first = 0, second = 1;

           
    %>
            <p>Fibonacci series up to <%= terms %> terms:</p>
            <p>
    <%
         
            if (terms >= 1) {
    %>
                <%= first %>
    <%
            }
            if (terms >= 2) {
    %>
                , <%= second %>
    <%
            }

           
            for (int i = 3; i <= terms; i++) {
                long next = first + second;
    %>
                , <%= next %>
    <%
                first = second;
                second = next;
            }
    %>
            </p>
    <%
        } else {
           
    %>
            <p style="color:red;"><%= errorMessage %></p>
    <%
        }
    %>
    
</center>
    
</body>
</html>
