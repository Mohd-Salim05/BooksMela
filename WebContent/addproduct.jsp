<%@page import="com.bookmela.entites.Products"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="com.bookmela.entites.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    User user1=(User)session.getAttribute("user");
    
    ProductDao pdao=new ProductDao(ConnectionProvider.getConnection());
    Products prd=(Products)session.getAttribute("cart");
      
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart</title>
<!-- css -->
     <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body class="bg-light">

        
    <%
    if(user1!=null){
    	
    	%>
    	<%@include file="profileNavBar.jsp" %>
    	<%
    }else{
    %>
    
    <%@include file="homeNavBar.jsp" %>
    
    <%
    }
    
    if(prd==null){
    %>
    
    <div class="container text-center" style="margin-top:140px;">
    <h3 class="display-3">No Carts to show..<br>Sign in For best experience</h3>
    
    <a class="btn btn-primary" href="index.jsp"> Home</a>
    </div>
    <%
    return;
    } %>

<div class="container-fluid" style="margin-top:140px;">

<div class="row">

<!--1st column  -->
<div class="col-md-8 ">
  
   
<div class="container-fluid ml-3 bg-white" >
  
  <div class="row">
 <div class="col-md-10">
           <h4>Shopping cart</h4>
 </div>
 
   </div>
   <pre style="text-align:right; padding:0px">Price</pre>
  <hr>
  
  
  
  <div class="row">
    <div class="col-md-2 ">
    <div class="container text-center my-3">
     <img class="card-img-top shadow" src="products_pics/<%=prd.getPpic() %>" style="max-height: 500px;max-width: 100%;width: auto;" alt="cart">
    </div>
    
  </div>
  
  <div class="col-md-8">
   <div class="container p-0">
       <h3 class="fi" style="font-weight:400;"><%=prd.getPname() %></h3>
       <p>In Stock</p>
       <small>Eligible for FREE Shipping</small><br>
       <span class="fa fa-truck fa-2x"></span><br>
       <b>Qty : </b><input type="number" value="1" style="width:60px" min="1" max="100"><br>
       <a href="card-remove.jsp">  Delete</a>
   </div>
    
    </div>
    
     <div class="col-md-2 ">
    <h4 style="text-align:right;"> &#8377; <%=prd.getPprice() %> </h4>
    </div>
    
    
    
  </div>
  <hr>
 <div class="row">
 <div class="col-md-12">
           <h5 style="text-align:right;"> Subtotal(1 item):<b> &#8377; <%=prd.getPprice() %></b></h5>
 </div>
 


</div>

</div>
</div>

<!-- 2nd column -->
<div class="col-md-3 mx-3">
  <div class="container-fluid bg-white ">
    
    <div class="row mt-3">
    <p style="font-weight:400;"><i class="fa fa-exclamation-circle " style="color:blue"></i> Pay via GooglePay and get 20&#37; discount on your order</p>
    
    </div>

       <div class="row mt-3">
        <p style="font-weight:400; font-size:25px">Subtotal(1 items): <b> &#8377; <%=prd.getPprice() %></b></p>   
   </div>
   <div class="row mt-3">
   
   <a class="btn btn-warning text-dark form-control" href="buyproduct.jsp?id=<%= prd.getPid()%>"><i class="fa fa-credit-card"></i> Proceed to Buy</a>
   
   </div>

  </div>

</div>



</div>

   </div> 













 <!-- Java script -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
</body>
</html>