<%@page import="java.text.DateFormat"%>
<%@page import="com.bookmela.entites.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%
    User user=(User)session.getAttribute("user");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BooksMela.com</title>


<!-- css -->
     <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>


    <%
    if(user!=null){
    	
    	%>
    	 <!--Nav Bar starts  -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background fixed-top">
        <a class="navbar-brand txt-weight" href="#"><span class="fa fa-book"></span> BooksMela</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto ">
            <li class="nav-item active">
           
            </li>
            <li class="nav-item active">
           
            </li>
            
            <li class="nav-item active">
              <a class="nav-link" href="#"><span class="fa fa-child"></span> About us</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link"  href="#"data-toggle="modal" data-target="#profile"><span class="fa fa-user"></span> Hello, <%=user.getUname() %></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-archive"></span> Orders</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" ><span class="fa fa-map-marker"></span> Delivering to- <%=user.getUaddress() %></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="categories.jsp"> Categories..</a>
              </li>
              <li class="nav-item active">
                 <a class="nav-link" href="logout"><span class="fa fa-lock"></span> Logout</a>
              </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fa fa-search"></i> Search</button>
             <a class="btn btn-outline-light my-2 my-sm-0 ml-3" href="addproduct.jsp"><span class="fa fa-shopping-cart"></span></a>
        </form>
        </div>
      </nav>
 <!--nav bae ends  -->
 
<!-- profile modal starts -->

<!-- Modal -->
<div class="modal fade" id="profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background ">
      <div class=" text-center text-white">
      <h5 class="modal-title txt-weight" id="exampleModalLabel"><span class="fa fa-user-circle fa-2x"></span> Profile</h5>
      </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="container text-center mt-3">
      <img src="pics/<%= user.getUpic()%>" style="width:20%">
      <h4 class="mt-3"><%=user.getUname() %></h4>
      </div>
      
      <div class="modal-body">
        
        <!-- profile table starts -->
<div id="profile-details">
<table class="table">
  <thead>
    <tr>
      <th scope="col">ID :</th>
      <th scope="col"> <%=user.getUid() %></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Email :</th>
      <td><%=user.getUemail() %></td>
    </tr>
    <tr>
      <th scope="row">Address</th>
      <td><%=user.getUaddress() %></td>     
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getUgender() %></td>   
    </tr>
    <tr>
      <th scope="row">Registration Date :</th>
      <td><%=DateFormat.getDateInstance().format(user.getReg_date()) %></td>   
    </tr>
    <tr>
      <th scope="row">Mobile Number :</th>
      <td><%=user.getUm_number() %></td>   
    </tr>
  </tbody>
</table>
</div>
<!-- profile table ends -->


<!-- profile edit table starts -->

<div id="profile-edit" style="display:none">

<form action="profile-edit" id="edit-profile" method="post">
<table class="table">
 
  <tbody>
   <tr>
    <th scope="row"></th>
      <td><input type="hidden" name="user_id" value="<%=user.getUid() %>">
      </td>
    </tr>
    <tr>
      <th scope="row">Email :</th>   
      <td><input type="email" class="form-control" name="user_email" value="<%=user.getUemail() %>" ></td>
    </tr>
    <tr>
      <th scope="row">Address</th>
      <td><input type="text" class="form-control" name="user_address" value="<%=user.getUaddress() %>"></td>     
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getUgender() %></td>   
    </tr>
    <tr>
      <th scope="row">Registration Date :</th>
      <td><%=DateFormat.getDateInstance().format(user.getReg_date()) %></td>   
    </tr>
    <tr>
      <th scope="row">Mobile Number :</th>
      <td><input type="text" class="form-control" name="user_number" value="<%=user.getUm_number() %>"></td>   
    </tr>
  </tbody>
</table>

 <button type="submit"  class="btn btn-outline-success form-control"> Save</button>
</form>



</div>



<!-- profile table ends -->

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-btn"class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>



<!-- profile modal ends -->

    	
    	<%
    }else{
    %>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top primary-background ">
        <a class="navbar-brand txt-weight" href="#"><span class="fa fa-book"></span>BooksMela</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto ">
            <li class="nav-item active">
              <a class="nav-link" href="#"data-toggle="modal" data-target="#reg-modal"> <span class="fa fa-users"> SignUp</span></a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#"data-toggle="modal" data-target="#login-modal"><span class="fa fa-user-circle fa-spin"></span> Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="categories.jsp"> Categories..</a>
              </li>
            
            <li class="nav-item active">
              <a class="nav-link" href="#"><span class="fa fa-child"></span> About us</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-mobile"></span> Contact us</a>
              </li> 
              
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fa fa-search"></i> Search</button>
            <a class="btn btn-outline-light my-2 my-sm-0 ml-3" href="addproduct.jsp"><span class="fa fa-shopping-cart"></span></a>
          </form>
        </div>
        
          </nav>
          
          <!--login  modal starts -->


<!-- Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-center">
      <div class="container-fluid text-center text-white">
       <span class="fa fa-user-circle fa-2x"></span>
        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
      </div>
     
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <form action="login" id="login-form" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input required type="email" class="form-control" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input required type="password" class="form-control" name="user_password" placeholder="Password">
  </div>
  <div class=" text-center">
  <button type="submit" class="btn btn-outline-primary "><i class="fa fa-lock"></i> Login</button>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-remove"></i> Close</button>
       
      </div>
    </div>
  </div>
</div>
<!-- login modal ends -->


<!-- register modal starts -->


<!-- Modal -->
<div class="modal fade" id="reg-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background">
      <div class="container text-center text-white">
            <span class="fa fa-users fa-2x"></span>
            <h5 class="modal-title"id="exampleModalLabel"> SignUp</h5>
      </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body">
        
        <form action="register"  id="reg-form" method="post" >
  <div class="form-group">
    <input required type="text" class="form-control" name="uname" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  
  <div class="form-group">
    <input required type="email" name="email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <input required type="password" name="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter password">
  </div>
  
  <div class="form-group">
    <input required type="text" name="address" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address">
    <small id="emailHelp" class="form-text text-muted">Current address for delivering products.</small>
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Select Gender </label><br>
   <input type="radio" id="male" name="gender" value="male">Male<br>
   <input type="radio" id="male" name="gender" value="female">Female
  </div>
  
  <div class="form-group">
    <input required type="text" name="mobile" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Mobile number">
  </div>
  
  <div class="form-check">
    <input required type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Terms and Condition </label>
  </div>
  <br>
  <button type="submit" class="btn btn-success form-control">Signup</button>
</form>
        
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>


<!-- register modal ends -->
          
    <%
    }
     %>
 <!--nav bar ends  -->
 
 
 <div class="container-fluid " style="margin-top:80px;">
 
 <div id="loader"class="container text-center mb-4" style="margin-top:40px;">

     <span class="fa fa-circle-o-notch fa-2x fa-spin"></span><br>
      <h4 class="fi">Please wait....</h4>
       </div>
 
 <div id="show-products" class="container">
 
 </div>
 
 </div>
 

 <!-- Java script -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!--show product script  -->
<script>
function getcat(catid){
	$('#loader').show();
	$('#show-products').hide();

	 $.ajax({
	     
		 url:"load-products.jsp",
		 data:{cid:catid},
		 success:function(data,textStatus,jqXHR){
			$('#loader').hide();
			$('#show-products').show();
			$('#show-products').html(data);		
		 }
		 
	 }) 
	 
 }
 
 $(document).ready(function(){
	 var cid = location.search.split('cid=')[1];
	 getcat(cid);
	 
 })
 
 
 
 </script>


<!--show product script end  -->

<script>
 
 $(document).ready(function(){
	 
	
	 $('#reg-form').on('submit',function(event){
		
		 event.preventDefault();
		 
		 let form=new FormData(this);
		 
		 $.ajax({
			
			 url:"register",
			 type:'POST',
			 data: form,
			 success:function(data,textStatus,jqXHR){
				console.log(data);
		       swal("Good job!","Successfully Registered..","success")
		       .then((value)=>{
		    	   window.location.replace("index.jsp");  
		       });
			 },
			 error:function(jqXHR,textStatus,errorThrown){
				 swal("Error!","something went wrong..","error");
			 },
			 processData:false,
			 contentType:false
			 
		 })
	 })
	
	  $('#login-form').on('submit',function(event){
		
		 event.preventDefault();
		 
		 let form=new FormData(this);
		 
		 $.ajax({
			
			 url:"login",
			 type:'post',
			 data: form,
			 success:function(data,textStatus,jqXHR){
				 console.log(data);
				 window.location.replace("index.jsp");
			 },
			 error:function(jqXHR,textStatus,errorThrown){
				 swal("user not present");
				 console.log(data);
			 },
			 processData:false,
			 contentType:false
			 
		 })
	 }) 
	  
 })
 
 
 
 </script>
 
 <!-- profile edit script starts-->
 
 <script >
 
 $(document).ready(function(){

	 let editStatus=false;
	 
	$('#edit-btn').click(function(){
	
		if(editStatus==false){
		
	    $('#profile-details').hide(); 
	    $('#profile-edit').show();
		$(this).text("Back");
		editStatus=true;
		}else{
			
	     $('#profile-details').show(); 
		$('#profile-edit').hide();	
		$(this).text("Edit");
		editStatus=false;
			
		}
		
		
	});
	
	
	$('#edit-profile').on('submit',function(){
		
         event.preventDefault();
		 
		 let form=new FormData(this);
		 
		 $.ajax({
			
			 url:"profile-edit",
			 type:'post',
			 data: form,
			 success:function(data,textStatus,jqXHR){
				 console.log(data);
				 swal("profile edit successful..")
				 .then((value)=>{
					 window.location.replace("index.jsp"); 
				 });
			 },
			 error:function(jqXHR,textStatus,errorThrown){
				 swal("something went wrong..");
				 console.log(data);
			 },
			 processData:false,
			 contentType:false
			 
		 })
	 }) 
	 
 })
 
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
 
 <!-- profile edit script ends -->

</body>
</html>