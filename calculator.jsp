<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>calculator</title>
</head>
<body>
    <center>
        <h1>Basic Calculator</h1>
        <form action="" method="post">
            <label for="num1"><b>Number 1</b></label>
            <input type="text" name="num1"><br><br>
            
            <label for="num2"><b>Number 2</b></label>
            <input type="text" name="num2"><br><br>
            
            <input type="radio" name="r1" value="Add">+
            <input type="radio" name="r1" value="Sub">-<br>
            <input type="radio" name="r1" value="mul">*
            <input type="radio" name="r1" value="div">/<br><br>
            
            <input type="submit" value="submit" name="btnSubmit">
        </form>

        <%
            // 1. Check if the form was actually submitted
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operation = request.getParameter("r1");

            if (num1Str != null && num2Str != null && operation != null) {
                try {
                    int num1 = Integer.parseInt(num1Str);
                    int num2 = Integer.parseInt(num2Str);

                    if (operation.equals("Add")) {
                        int add = num1 + num2;
                        out.println("<h3>Addition is: " + add + "</h3>");
                    } else if (operation.equals("Sub")) {
                        int sub = num1 - num2;
                        out.println("<h3>Subtraction is: " + sub + "</h3>");
                    } else if (operation.equals("mul")) {
                        int mul = num1 * num2;
                        out.println("<h3>Multiplication is: " + mul + "</h3>");
                    } else if (operation.equals("div")) {
                        if (num2 != 0) { // Check for division by zero
                            int div = num1 / num2;
                            out.println("<h3>Division is: " + div + "</h3>");
                        } else {
                            out.println("<h3 style='color:red;'>Cannot divide by zero!</h3>");
                        }
                    }
                } catch (NumberFormatException e) {
                    out.println("<h3 style='color:red;'>Please enter valid numbers.</h3>");
                }
            }
        %>
    </center>
</body>
</html>