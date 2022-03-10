<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CourseWork.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
   
</head>
<body>
    <div class="wrapper">
        <h1 class="page-title">Home Page</h1> 
        <div class="image-bg">
            <img src="assets/berkeley-logo.png" />
        </div>
        <h3 class="form-header">Basic Forms</h3>
        <form class="container" id="form1" runat="server">            
                <div class="item first-item">
                  <a class="clickable" href="Student%20Form.aspx">
                      <img class="form-img" src="assets/student.png" /><br />
                      Student Form and Details
                  </a>
                </div>
                <div class="item">
                  <a href="Teacher Form.aspx">
                      <img class="form-img" src="assets/teacher.png" /><br />
                      Teacher Form and Details</a><br />
                </div>
                <div class="item">
                  <a href="Module Form.aspx">
                      <img class="form-img" src="assets/module.png" /><br />
                      Module Form and Details</a><br />
                </div>
                <div class="item last-item">
                  <a href="Address Form.aspx">
                      <img class="form-img" src="assets/address.png" /><br />
                      Address Form and Details</a><br />
                </div>    
            
             
        </form>
        <h3 class="form-header">Complex Forms</h3>
        <div class="container">                
            <div class="item first-item">
                  <a href="Teacher-Module.aspx">
                      <img class="form-img" src="assets/Teacher-Module.png" /><br />
                      Teacher-Module Details
                  </a>
            </div>
            <div class="item">
                <a href="Student-Fee.aspx">
                      <img class="form-img" src="assets/Student-Fee.png" /><br />
                      Student Fee Details</a><br />
            </div>
            <div class="item last-item">
                <a href="Student-Result.aspx">
                    <img class="form-img" src="assets/Student-Result.png" /><br />
                      Student Result Details</a><br />
            </div>   
        </div>
    </div>
    
</body>
</html>
