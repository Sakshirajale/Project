<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Flights</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #0069d9;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin: 20px 0;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <header>
        <h1>Available Flights</h1>
    </header>

    <h2 style="text-align: center;">Choose your desired flight below:</h2>

    <table>
        <tr>
            <th>Flight ID</th>
            <th>Flight No</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Departure Time</th>
            <th>Price</th>
        </tr>
        
        <%-- The data will be fetched from the database and displayed here --%>
        <%
            try {
                Connection con = DBUtil.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM flights");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("flight_no") %></td>
                        <td><%= rs.getString("source") %></td>
                        <td><%= rs.getString("destination") %></td>
                        <td><%= rs.getString("departure_time") %></td>
                        <td><%= rs.getDouble("price") %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <div style="text-align: center;">
        <a href="index.html" class="btn">Back to Home</a>
    </div>
</body>
</html>
