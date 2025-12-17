<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>A Sample Order Form</title>
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            display: flex;
            justify-content: center;
            padding-top: 4rem;
            background-color: #fce4ec; /* Light pink background to match the image's window bar */
        }
        .container {
            width: 80%;
            max-width: 600px;
        }
        h1 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        table {
            border: 2px solid #a0a0a0;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #a0a0a0;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #e0e0e0;
            font-weight: bold;
        }
        td {
            background-color: #f9f9f9;
        }
        /* Align numbers to the right for better readability */
        td:nth-child(2),
        td:nth-child(3),
        td:nth-child(4) {
            text-align: right;
        }
    </style>
</head>
<body>
    
    <%
        String[] items = {"DVD", "CD", "Diskette"};
        double[] prices = {19.99, 12.99, 1.99};
        int[] quantities = {2, 9, 24};
    %>

    <div class="container">
        <h1>A Sample Order Form</h1>
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <%-- Loop through the items and display them in the table --%>
                <% for (int i = 0; i < items.length; i++) { %>
                    <%-- Calculate the total price for the current item --%>
                    <% double totalPrice = prices[i] * quantities[i]; %>
                    <tr>
                        <td><%= items[i] %></td>
                        <%-- Format numbers to two decimal places --%>
                        <td><%= String.format("%.2f", prices[i]) %></td>
                        <td><%= quantities[i] %></td>
                        <td><%= String.format("%.2f", totalPrice) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>