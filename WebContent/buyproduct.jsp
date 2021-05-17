<%@page import="com.booksmela.helper.Message"%>
<%@page import="com.bookmela.entites.Products"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.CategoriesDao"%>
<%@page import="com.bookmela.entites.User"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error_page.jsp" %>
     
    
<%    int pid=Integer.parseInt(request.getParameter("id"));
      CategoriesDao dao=new CategoriesDao(ConnectionProvider.getConnection());

        User user1=(User)session.getAttribute("user");
        
        ProductDao pdao=new ProductDao(ConnectionProvider.getConnection());
        Products p=pdao.getProductsByPid(pid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Processing</title>
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
    	Message msg=new Message("Please Login First..", "alert-warning");
		session.setAttribute("msg", msg);
    	response.sendRedirect("index.jsp");
   
    %>
    
    <%@include file="homeNavBar.jsp" %>
   
    <%
    }
    %>
    <div class="container bg-white p-3" style="margin-top:100px;">
       <div class="row">
       
       <h3 style="font-weight:400;"> To place the order Please Fill the card details to Pay online</h3>
       </div>
    
    </div>
    
    
    <div class="container mt-3">
    <hr>
    <div class="row">
<div class="col-md-3 mt-2 ">
<div class="container-fluid my-2 text-center">
     <a href="viewproduct.jsp?id=<%= p.getPid()%>"><img class="card-img-top shadow rounded float-left shadow" src="products_pics/<%=p.getPpic() %>" style="max-height: 300px;max-width: 60%;width: auto;" alt="cart">
    
    </a>
    </div>

</div>

<div class="col-md-9 mt-2 ">
<h5 class=" text-info mt-2"style="font-weight:400;"><%=p.getPname() %></h5>
<small> by kathy sierra and Bert bates</small><br>
 <strong>&#8377; <%=p.getPprice() %></strong><br>
  <i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star-half-empty"></i><br>
<small>Eligible for FREE Shipping</small><br>
<p><%=p.getPdescription() %>...more</p>

</div>
</div>
<hr>
    
    
    
    </div>
    
    
    
    
    <div class="container bg-white p-5 shadow" >
    
    
    <form id="card-form" action="cardprocess.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter card number</label>
    <input required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="eg:-2345 6756 3425 5654">
    <small id="emailHelp" class="form-text text-muted">We'll never share your card details with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Expired date</label>
    <input required type="text" class="form-control" id="exampleInputPassword1" placeholder="MM/YY">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">CV number</label>
    <input required  type="text" class="form-control" id="exampleInputPassword1" placeholder="CV">
  </div>
  <div  id="loader"class="container mt-4 text-center" style="display:none">
   <span class="fa fa-circle-o-notch fa-3x fa-spin"></span><br>
   <h4>Please wait...</h4>
  </div>
  <div  id="bt"class="container mt-4 text-center">
   <button type="submit" class="btn btn-lg btn-outline-primary">Proceed</button>
  </div>

</form>
    
   
    </div>
    
    
    
    
    
    
    
    
  
 <!-- Java script -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>  
    
    <script >
    
    $(document).ready(function (){
    	$('#card-form').on('submit',function(){
    		$('#loader').show();
    		$('#bt').hide();
             event.preventDefault();
    		 
    		 let form=new FormData(this);
    		 
    		 $.ajax({
    			
    			 url:"cardprocess.jsp",
    			 type:'post',
    			 data: form,
    			 success:function(data,textStatus,jqXHR){
    				 swal("Your order is confirmed..Thank you for choosing BooksMela ")
    				  .then((value)=>{
					 window.location.replace("index.jsp"); 
				 });
   				  $('#loader').hide();
   		    		$('#bt').show();  		 
    			 },
    			 error:function(jqXHR,textStatus,errorThrown){
    				 swal(jqXHR);
    			 },
    			 processData:false,
    			 contentType:false
    			 
    		 })
    	 }) 
    })
    
    
    
    </script>
    
</body>
</html>




