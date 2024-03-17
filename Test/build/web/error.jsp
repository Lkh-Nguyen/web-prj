<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #dc3545; /* Red */
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 40px;
        }
        .icon-triangle {
            color: #ffc107; /* Yellow */
            font-size: 80px;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            background-color: #007bff; /* Blue */
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3; /* Darker Blue */
        }
    </style>
</head>
<body>
    <div class="icon-triangle">
        <i class="fas fa-exclamation-triangle"></i> <!-- Triangle icon -->
    </div>
    <h1>Oops! Something went wrong.</h1>
    <p>We apologize for the inconvenience. Please try again later.</p>
    <a href="full_home.jsp" class="btn"><i class="fas fa-home"></i> Go to Home</a> <!-- Home button with home icon -->
</body>
</html>