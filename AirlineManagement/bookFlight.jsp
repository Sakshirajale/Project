<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Flight</title>
    <style>
        body {
            font-family: Arial;
            background-color: #fff3cd;
            padding: 30px;
        }
        h2 {
            color: #333;
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
            background-color: #17a2b8;
            color: white;
            border: none;
        }
        button:hover {
            background-color: #138496;
        }
    </style>
</head>
<body>
    <h2>Book Your Flight</h2>
    <form action="BookFlightServlet" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="number" name="flight_id" placeholder="Flight ID" required>
        <button type="submit">Book Flight</button>
    </form>
</body>
</html>
