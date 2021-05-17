<%@page import="com.booksmela.helper.Message"%>
<%@page import="java.util.Random"%>
<%@page import="com.bookmela.entites.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.bookmela.entites.User"%>
<%@page import="com.booksmela.dao.CategoriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page errorPage="error_page.jsp" %>
    
    
    <%
    
      int pid =Integer.parseInt(request.getParameter("id"));

    CategoriesDao dao=new CategoriesDao(ConnectionProvider.getConnection());

      User user1=(User)session.getAttribute("user");
      
      ProductDao pdao=new ProductDao(ConnectionProvider.getConnection());
       Products pd=pdao.getProductsByPid(pid);
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>

  <!-- css -->
     <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
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
    %>
    
    <br>
    <br>
    <br>
<div class="container-fluid m-3">

   <div class="row">
   
   <div class="col-md-4 offset-md-1 " >
    
  <img class="card-img-top my-3 shadow" src="products_pics/<%=pd.getPpic() %>"style="max-height: 500px;max-width: 100%;width: auto;" alt="Card image cap">
  <br>
 <a class="btn btn-lg primary-background text-white"onclick="addcart(<%=pd.getPid() %>)" ><i class="fa fa-shopping-cart"></i> Add to cart</a><br>
<a class="btn primary-background btn-lg text-white px-3 mt-3" href="buyproduct.jsp?id=<%= pid%>">Buy <i class="fa fa-angle-double-right"></i></a>
  
  
   
   </div>
   
   <div class="col-md-6 " >
   <div class="container  mt-4">
   <h3 class="fi"><%=pd.getPname() %></h3>
    by kathy sierra and Bert bates<br>  
     <i class="fa fa-star" style="font-size:20px;color:#ebd534;"></i>
    <i class="fa fa-star" style="font-size:20px;color:#ebd534;"></i>
    <i class="fa fa-star" style="font-size:20px;color:#ebd534;"></i>
    <i class="fa fa-star-half-empty" style="font-size:20px;color:#ebd534;"></i> 2,131 rating
    <hr>
    
    <button class="px-4 mb-2"><b>Price<br>&#8377; <%=pd.getPprice() %></b></button><br>
    Price Change Daily
    <br>
    <br>
    <br>
    <p>Delivery by: <b>Thursday, Jan 14</b>Details<br>
Fastest delivery: <b>Tomorrow</b></p>
    <b>Order Today to get Special offers</b>
    <br><br>
    
    
    <div class="container">
    <div class="row">
       <div class="col-sm-2">
       <span class="fa fa-archive fa-2x"></span><br>
    <small class="text-muted">10 Days<br>Replacement<br>only</small>
       </div>
     <div class="col-sm-2">
       <span class="fa fa-truck fa-2x"></span><br>
    <small class="text-muted">BooksMela<br>Delivery</small>
       </div>
     <div class="col-sm-2">
       <span class="fa fa-phone fa-2x"></span><br>
    <small class="text-muted">No-contact<br>Delivery</small>
       </div>
    
    </div>
    
    </div>
    <br>
    <hr>
    <h4>Description :</h4>
    <p><%=pd.getPdescription() %></p>
    
   </div>
   
  
   </div>
   
   </div>

</div>
<hr>
<div class="container-fluid pb-4 grd">
      <h3 class="p-3">Related Books :</h3>
        <div class="row">
     <!-- first col -->
 
  <%  
  ArrayList<Products> list=pdao.getProductsByCatId(pd.getCid());
  
    for(int i=1;i<=4;i++){
    	Products p=list.get(new Random().nextInt(list.size()));
    	
  
 %>
    <div class="col-md-3 py-3 py-sm-0">
   <div class="card shadow">
    <div class="container text-center">
      <img src="products_pics/<%=p.getPpic() %>" style="max-height: 200px;max-width: 100%;width: auto;" class="card-img-top my-2 ">

    </div>
  <div class="card-body py-0">
      <h5 class="card-title"><%=Message.getMaxName(p.getPname()) %>....</h5>
    <i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star-half-empty"></i>
  </div>
   </div>

 </div>

  <%
      
    }
  %>
</div>
</div>


 <!-- Java script -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<script>

function addcart(pid){
	 
	 $.ajax({
	
		 url:"cart.jsp",
		 data:{pid:pid},
		 success:function(data ,textStatus,jqXHR){
			 swal("cart add successfully");
		 },
		 error:function(jqXHR,textStatus,errorThrown){
			 console.log(jqXHR)
		 }
		 
	 })
	 
	 
	
	 
	 
}


</script>

</body>
</html>