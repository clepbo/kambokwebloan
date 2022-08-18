<%-- 
    Document   : TransactionRecord
    Created on : Jul 21, 2022, 6:01:36 AM
    Author     : Depittaz
--%>

<%@page import="model.AdminUser"%>
<%@page import="model.DataSupply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page errorPage="errorpage.jsp" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">

    <title>Transaction Records</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
 <link rel="icon" type="image/x-icon" href="kam.png">
  <style>
  
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100;
  padding: 90px 0 0;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
  z-index: 99;
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 11.5rem;
    padding: 0;
  }
}

.navbar {
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
}

@media (min-width: 767.98px) {
  .navbar {
    top: 0;
    position: sticky;
    z-index: 999;
  }
}

.sidebar .nav-link {
  color: #333;
}

.sidebar .nav-link.active {
  color: #0d6efd;
}

i{
  font-size: 1.3rem;
  text-align: left;
}

.nav-item a{
  transition: .5s ease;
  text-align: left;
}

.nav-item a:hover{
  color: #0d6efd;
}
  
  
  </style>
   <script>  
var request;

function sendInfo()  
{  
var email=document.myform.email.value;

var url="TransactionRecord?email="+email;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}
}
  
  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('report').innerHTML=val; 

} 
}

</script> 
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
 
 </head>
<body>
     <script type = "text/javascript" >
          history.pushState(null, null, 'transactionRecords.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'transactionRecords.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

 
 <%
    DataSupply us=(DataSupply)session.getAttribute("user");
    AdminUser s = (AdminUser)session.getAttribute("staff");
    if(s.getEmail()!=null && s.getPosition().equals("Customer Care")){
        
    }else{
        response.sendRedirect("index.html");
    }
    %> 
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=us.getPosition() %>
		  
      </a>
      <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
  </div>
  <div class="col-12 col-md-4 col-lg-2">
  <form action="kambok.jsp">
      <div class="input-group">
  <input type="text" class="form-control" placeholder="Search">
  <button class="btn btn-dark" type="submit">Search</button>
  </form>
</div>
  </div>
  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
              Hello, <%=us.getFirstname()%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link" aria-current="page" href="ccReagisterUser.jsp">
          <i class="fa-solid fa-user"></i>
          <span class="ml-2">Register user</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="printLoanAgreement.jsp">
          <i class="fa-solid fa-print"></i>
          <span class="ml-2">Print Loan Agreement</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="uploadLoanAgreement.jsp">
          <i class="fa-regular fa-folder-arrow-up"></i>
          <span class="ml-2">Upload Loan Agreement</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link  active" href="transactionRecords.jsp">
          <i class="fa-solid fa-rectangle-history-circle-user"></i>
          <span class="ml-2">View Transaction Records</span>
        </a>
      </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<section class="vh-100">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl- col-xs-12 col-sm-12">
              <div class="card form-container" style="border-radius: 1rem;">
                <div class="card-body p-5 text-center">
                    <form action="TransactionRecord" method="post" name="myform">
                        
                        <div class="row mt-3">
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="Email" aria-label="email" name="email" id="email" required>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-primary btn-block mb-4 submitBtn" onclick="sendInfo();">Search</button>
                            </div>
                            <p id="report" class="text-danger"></p>
                        </div>

                    </form>   
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>   
    
<!--    <div class="row">
        <div class="col-12 col-xl-8 mb-4 mb-lg-0">
            <div class="card">
                <div class="card-body" id="report">
                </div>
            </div>
        </div>
    </div>-->
        
<footer class="pt-5 d-flex justify-content-between">
  <span>Copyright &copy; 2022-2024 <a href="https://kambokinfotech.com">Kambok Infotech Limited</a></span>
  <ul class="nav m-0">
      <li class="nav-item">
        <a class="nav-link text-secondary" aria-current="page" href="#">Privacy Policy</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Terms and conditions</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Contact</a>
      </li>
    </ul>
</footer>
  


      </main>
  </div>
</body>
</html>
  

