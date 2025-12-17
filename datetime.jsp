<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <title>System Date and Time</title>
</head>
<body>
    <h2>Current System Date and Time</h2>
    <%
      
        Date currentDate = new Date();

      
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy");
        String formattedDate = dateFormat.format(currentDate);

      
        SimpleDateFormat timeFormat = new SimpleDateFormat("h:mm:ss a z");
        String formattedTime = timeFormat.format(currentDate);
    %>

    <p>
        The current date is: <%= formattedDate %>
    </p>

    <p>
        The current time is: <%= formattedTime %>
    </p>
</body>
</html>