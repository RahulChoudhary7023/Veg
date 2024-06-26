<%@ Page Language="C#" AutoEventWireup="true" CodeFile="texting.aspx.cs" Inherits="texting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="styles.css"/>
    <style>


body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}

.animated-border {
    padding: 20px 40px;
    font-size: 24px;
    color: #333;
    border: 2px solid transparent;
    transition: border 0.5s ease-in-out;
}

.animated-border:hover {
    border-image: linear-gradient(45deg, #f06, #4a90e2) 1;
    animation: borderAnimation 5s linear infinite;
}

@keyframes borderAnimation {
    0% {
        border-image-source: linear-gradient(45deg, #f06, #4a90e2);
    }
    50% {
        border-image-source: linear-gradient(45deg, #4a90e2, #f06);
    }
    100% {
        border-image-source: linear-gradient(45deg, #f06, #4a90e2);
    }
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
 
   
    <div class="animated-border">
        Animated Border Example
    </div>
        </form>
</body>
</html>

