<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Powers of 2</title>
</head>
<body>
    <center>
    <h2>Powers of 2 (for 0 to 10)</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Number (n)</th>
                <th>2^n</th>
            </tr>
        </thead>
        <tbody>
            <%
             
                for (int i = 0; i <= 10; i++) {
                  
                    long result = (long) Math.pow(2, i);
            %>
            <tr>
                <td><%= i %></td>
                <td><%= result %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</center>
</body>
</html>