<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Flight</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f4f8;
            padding: 30px;
        }
        h2 {
            color: #444;
        }
        form {
            background-color: #fff;
            padding: 20px;
            max-width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input, button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Add New Flight</h2>
    <form action="AddFlightServlet" method="post">
        <input type="text" name="flight_no" placeholder="Flight Number" required>
        <input type="text" name="source" placeholder="Source" required>
        <input type="text" name="destination" placeholder="Destination" required>
        <input type="text" name="departure_time" placeholder="Departure Time" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <button type="submit">Add Flight</button>
    </form>
</body>
</html>
