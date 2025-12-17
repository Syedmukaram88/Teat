<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sine Table</title>
    <style>
        table, th, td {
            border-collapse: collapse;
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            font-weight: bold;
        }
        
    </style>
</head>
<body>
    <center>
        <h1>Sine Table </h1>
        <table>
            <thead>
                <tr>
                    <th>Angle (Degrees)</th>
                    <th>Sine Value</th>
                </tr>
            </thead>
            <tbody>
                
                <% for (int angle = 0; angle <= 90; angle += 15) { %>
                  
                    <% double radians = Math.toRadians(angle); %>
                 
                    <% double sineValue = Math.sin(radians); %>
                    <tr>
                  
                        <td><%= angle %>&deg;</td>
                     
                        <td><%= String.format("%.4f", sineValue) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </center>
</body>
</html>