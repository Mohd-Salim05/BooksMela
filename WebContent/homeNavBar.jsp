
     <!--Nav Bar starts  -->
    <%@page import="com.booksmela.dao.CategoriesDao"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="com.bookmela.entites.Categories"%>
<%@page import="java.util.ArrayList"%>
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
              <a class="nav-link" href="#"><span class="fa fa-child"></span> About us</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-mobile"></span> Contact us</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="categories.jsp"> Categories..</a>
              </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fa fa-search"></i> Search</button>
            <a class="btn btn-outline-light my-2 my-sm-0 ml-3" href="addproduct.jsp"><span class="fa fa-shopping-cart"></span></a>
          </form>
        </div>
        
          </nav>
 <!--nav bar ends  -->
 
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
 
 
 
 
 