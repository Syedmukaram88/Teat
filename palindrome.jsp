<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Palindrome Checker</title>
</head>
<body>
    <h2>Check if a Word is a Palindrome</h2>
   
    <form action="" method="post">
        <label for="word">Enter a word or phrase:</label>
        <!-- The input value retains the submitted word using a JSP expression -->
        <input type="text" id="word" name="word" required 
               value="<%= request.getParameter("word") != null ? request.getParameter("word") : "" %>">
        <br><br>
        <input type="submit" value="Check Palindrome">
    </form>
    
    <%
      
        String inputWord = request.getParameter("word");
        
      
        if ("POST".equalsIgnoreCase(request.getMethod()) && inputWord != null) {
            
         
            if (inputWord.trim().isEmpty()) {
                out.println("<hr>");
                out.println("<p style='color:red;'>Error: Please enter a word or phrase.</p>");
            } else {
           
                String normalizedString = inputWord.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
                
          
                StringBuilder sb = new StringBuilder(normalizedString);
                String reversedString = sb.reverse().toString();

                String resultStyle;
                String resultText;

      
                if (normalizedString.equals(reversedString)) {
                    resultStyle = "color:green;";
                    resultText = "The input **\"" + inputWord + "\"** **IS** a palindrome.";
                } else {
                    resultStyle = "color:red;";
                    resultText = "The input **\"" + inputWord + "\"** **IS NOT** a palindrome.";
                }
                
              
                out.println("<hr>");
                out.println("<h3>Result</h3>");
                out.println("<p style='" + resultStyle + "'>" + resultText + "</p>");
            }
        }
    %>
</body>
</html>