<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

<%@page import="model.Admindetails"%>
<%@page import="imageloader.Loader"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>
<%@page import="model.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">

    <title>ViewRequest</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
  function dp(){
  var tc=document.getElementById("c");
  var dc=document.getElementById("d");
  var ec=document.getElementById("e");
  tc.style.display="inline-block";
  dc.style.display="block";

 tc.style.fontSize="20px";
 ec.style.display="none";
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
          history.pushState(null, null, 'viewrequest.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'viewrequest.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

    <%!String name="",position="",email="",pic1="",pic2="";%>
    <%
    ArrayList<Admindetails> us=(ArrayList<Admindetails>)session.getAttribute("admin");
    
    pic1=(String)session.getAttribute("pic1");
    pic2=(String)session.getAttribute("pic2");
    if((pic1!=" " && pic2!="")&&(pic1!=null && pic2!=null) ){
        Loader.loadIddelete(pic1, pic2);
    }
    
    if(us==null){
     response.sendRedirect("index.jsp");
   }else{
      for(Admindetails s:us){
      name=s.getName();
      position=s.getPositon();
      email=s.getUsername();
      }  
   
    
    if((position.equals("Admin") || position.equals("Admin")) && (!email.equals("") || email!=null)){
    
        
    }else{
    response.sendRedirect("index.jsp");
    }   
    }
    %> 
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=position%>
		  
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
              Hello,<%=name %>
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
        <a class="nav-link " aria-current="page" href="Adminhome.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="viewrequest.jsp">
          <i class="fa-solid fa-landmark mx-2"></i>
          <span class="ml-2">View Request</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="history.html">
          <i class="fa-solid fa-clock-rotate-left mx-2"></i>
          <span class="ml-2">History</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="accountinfo.html">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Account Info</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="bio.html">
          <i class="fa-solid fa-file-pen mx-2"></i>
          <span class="ml-2">Update Bio</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="loan-status.jsp">
          <i class="fa-solid fa-sack-dollar mx-2"></i>
          <span class="ml-2">Loan Status</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Advertisement.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Advertise Loan</span>
        </a>
      </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>
<h1 class="h2">View Request</h1>
<p>This is the homepage of a simple admin interface</p>
    
<div class="card">
  <h5 class="card-header">Approved Loan</h5>
  <div class="card-body">
    <h5 class="card-title">25 Nos</h5>
    <p class="card-text">Total worth: N550,000.00</p>
    <p class="card-text text-success">At 8.2% rate daily</p>
  </div>
</div>
  


    
<div class="row">
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Pending loan requests</h5>
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-primary  table-bordered text-center">
                      <thead>
                        <tr>
                          <th >Tran.ID</th>
                          <th >Col.Name</th>
                          <th >Col.ID</th>
                          <th >Trans.Date</th>
                          <th >Trans.Time</th>
                          <th ></th>
                         </tr>
                         <%
                           List<LoanRequest> lr=data.Database.getviewRequest("pending");
                           for(LoanRequest l:lr){
                          out.println("<tr><td>"+l.getTrid()+"</td><td>"+l.getColname()+"</td><td>"+l.getColid()+"</td><td>"+l.getDate()+"</td><td>"+l.getTime()+"</td><td><form action='View.jsp' method='post'><input type='hidden' name='v' value='"+l.getTrid()+"'><button class='btn btn-primary' onclick='dp();'><small id='e'>View</small><small id='d' style='display:none;'><span class='spinner-border spinner-border-sm' id='c' style='display:none;'></span>loading</small></button></form></td></tr>");     
                           }
                         
                         %>  
                  </table>
              </div>
                <a href="#" class="btn btn-block btn-light">View all</a>
          </div>
      </div>
  </div>


</div>
</div>
</div>
    
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
</div>
</div>
  



  
</body>
</html>
  
