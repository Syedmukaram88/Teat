<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
<head>
    <title>Factorial Calculator</title>
</head>
<body>
    <center>
    <h2>Enter a number to calculate its factorial</h2>
    <form action="" method="post">
        <label for="number">Enter a non-negative integer:</label>
        <input type="number" id="number" name="number" required>
        <br><br>
        <input type="submit" value="Calculate">
    </form>
    

    <%
       
        String numberString = request.getParameter("number");

        long factorial = 1;
        String errorMessage = "";

      
        if (numberString != null && !numberString.isEmpty()) {
            try {
                int number = Integer.parseInt(numberString);

                if (number < 0) {
                    errorMessage = "Error: Please enter a non-negative integer.";
                } else {
                 
                    for (int i = 1; i <= number; i++) {
                        factorial *= i;
                    }
    %>
                <p>The factorial of <%= number %> is <%= factorial %>.</p>
    <%
                }
            } catch (NumberFormatException e) {
                errorMessage = "Error: Invalid input. Please enter a valid integer.";
            }
        
        }

      
        if (!errorMessage.isEmpty()) {
    %>
            <p style="color:red;"><%= errorMessage %></p>
    <%
        }
    %>
    
</center>
    
</body>
</html>
