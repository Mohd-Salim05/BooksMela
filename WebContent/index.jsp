<%@page import="com.bookmela.entites.User"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%@page import="com.bookmela.entites.Products"%>
<%@page import="com.booksmela.helper.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bookmela.entites.Categories"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.CategoriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp"%>

<%
	CategoriesDao dao = new CategoriesDao(ConnectionProvider.getConnection());

User user1 = (User) session.getAttribute("user");

ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
ArrayList<Products> list = pdao.getAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BooksMela.com</title>
<!-- css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>


	<%
		if (user1 != null) {
	%>
	
	<%@include file="profileNavBar.jsp"%>

	<%
		} else {
	%>

	<%@include file="homeNavBar.jsp"%>

	<%
		}
	%>


	<%
		Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" role="alert"
		style="margin-top: 60px;">
		<%=msg.getMsg()%>
	</div>
	<%
		session.removeAttribute("msg");
	}
	%>

	<br>
	<br>



	<!--slider start  -->

	<div id="carouselExampleIndicators1" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators1" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators1" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators1" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators1" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators1" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">

			<%
				String cssclass = "active";
			for (int i = 0; i < 4; i++) {
				Products p = list.get(new Random().nextInt(list.size()));
			%>


			<div class="carousel-item <%=cssclass%>">
				<div class="container my-5 ">
					<div class="row">
						<div class="col-md-3 offset-md-2 my-5">
							<img src="products_pics/<%=p.getPpic()%>"
								style="max-height: 200px; max-width: 100%; width: auto;"
								class="shadow">
						</div>
						<div class="col-md-6 mt-4 px-4">
							<h3 class="  fi"><%=p.getPname()%>
							</h3>
							<p><%=Message.getMaxString(p.getPdescription(), 200)%>....more
							</p>
						</div>
					</div>
				</div>
			</div>

			<%
				cssclass = "";
			}
			%>

		</div>

		<a class="carousel-control-prev" href="#carouselExampleIndicators1"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators1"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span></a>
	</div>



	<!--slider ends  -->
	<!-- 2nd slider starts -->
	<div id="carouselExampleIndicators2" class="carousel slide"
		data-ride="carousel">

		<div class="carousel-inner">
			<div class="container-fluid grd pb-3">
				<h3 class="p-3">
					<a class="text-dark" href="showproduct_page.jsp?cid=0">Top
						picks for you :</a>
				</h3>

				<div class="carousel-item active ">

					<div class="row">
						<!-- first col -->

						<%
							for (int i = 1; i <= 4; i++) {
							Products p = list.get(new Random().nextInt(37));
						%>

						<div class="col-md-3 py-3 py-sm-0">
							<div class="card chr shadow ">
								<div class="container text-center">
									<a href="viewproduct.jsp?id=<%=p.getPid()%>"><img
										src="products_pics/<%=p.getPpic()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top my-2"> </a>
								</div>
								<div class="card-body py-0">
									<h5 class="card-title"><%=Message.getMaxName(p.getPname())%>....
									</h5>
									<p><%=Message.getMaxName(p.getPdescription())%>...more
									</p>
									<h4>
										&#8377;
										<%=p.getPprice()%></h4>
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star-half-empty"></i>
								</div>

								<div class="card-footer">
									<a class="btn primary-background text-white"
										onclick="addcart(<%=p.getPid()%>)" href="#"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										class="btn primary-background text-white"
										href="buyproduct.jsp?id=<%=p.getPid()%>">Buy <i
										class="fa fa-angle-double-right"></i></a>


								</div>

							</div>

						</div>
						<%
							}
						%>
					</div>


				</div>
				<!--item end  -->


			</div>

		</div>
	</div>




	<!--Programming languages  -->

	<div class="container-fluid grd pb-3">
		<hr>
		<h3 class="p-3 ">
			<a class="text-dark" href="showproduct_page.jsp?cid=1">Programming
				Languages :</a>
		</h3>
		<div class="row">
			<!-- first col -->

			<%
				ArrayList<Products> prg = pdao.getProductsByCatId(1);
			for (int i = 1; i <= 4; i++) {
				Products p = prg.get(new Random().nextInt(prg.size()));
			%>
			<div class="col-md-3 py-3 py-sm-0">
				<div class="card chr shadow">
					<div class="container text-center">

						<a href="viewproduct.jsp?id=<%=p.getPid()%>"><img
							src="products_pics/<%=p.getPpic()%>"
							style="max-height: 200px; max-width: 100%; width: auto;"
							class="card-img-top my-2"> </a>
					</div>
					<div class="card-body py-0">
						<h5 class="card-title"><%=Message.getMaxName(p.getPname())%>...
						</h5>
						<p><%=Message.getMaxName(p.getPdescription())%>...more
						</p>
						<h4>
							&#8377;
							<%=p.getPprice()%></h4>
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star-half-empty"></i>
					</div>
					<div class="card-footer">
						<a class="btn primary-background text-white"
							onclick="addcart(<%=p.getPid()%>)" href="#"><i
							class="fa fa-shopping-cart"></i> Add to cart</a> <a
							class="btn primary-background text-white"
							href="buyproduct.jsp?id=<%=p.getPid()%>">Buy <i
							class="fa fa-angle-double-right"></i></a>


					</div>

				</div>

			</div>

			<%
				}
			%>
		</div>
	</div>
	<!--programming languages ends  -->


	<!-- image carousel 2 -->
	<div class="container-fluid mt-2 mb-2 text-center">
		<div id="carouselExampleIndicators2" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators2" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators2" data-slide-to="3"></li>
				<li data-target="#carouselExampleIndicators2" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">

				<%
					String csclass = "active";
				for (int i = 0; i < 4; i++) {
					Products p = list.get(new Random().nextInt(list.size()));
				%>


				<div class="carousel-item <%=csclass%>">
					<div class="container my-5 ">
						<div class="row">
							<div class="col-md-3 offset-md-2 my-5">
								<img src="products_pics/<%=p.getPpic()%>"
									style="max-height: 200px; max-width: 100%; width: auto;"
									class="shadow">
							</div>
							<div class="col-md-6 mt-4 px-4">
								<h3 class=" fi"><%=p.getPname()%>...
								</h3>
								<p><%=Message.getMaxString(p.getPdescription(), 200)%>...more
								</p>
							</div>
						</div>
					</div>
				</div>

				<%
					csclass = "";
				}
				%>


			</div>

		</div>
	</div>

	<!--slider ends  -->
	<!--  image 2 ends -->

	<!-- third row starts self development  -->

	<div class="container-fluid grd pb-3">
		<hr>
		<h3 class="p-3 ">
			<a class="text-dark" href="showproduct_page.jsp?cid=4">Self-Development
				:</a>
		</h3>
		<div class="row">
			<!-- first col -->

			<%
				ArrayList<Products> sd = pdao.getProductsByCatId(4);
			for (int i = 1; i <= 4; i++) {
				Products p = sd.get(new Random().nextInt(sd.size()));
			%>
			<div class="col-md-3 py-3 py-sm-0">
				<div class="card chr shadow">
					<div class="container text-center">
						<a href="viewproduct.jsp?id=<%=p.getPid()%>"> <img
							src="products_pics/<%=p.getPpic()%>"
							style="max-height: 200px; max-width: 100%; width: auto;"
							class="card-img-top my-2">
						</a>
					</div>
					<div class="card-body py-0">
						<h5 class="card-title"><%=Message.getMaxName(p.getPname())%>...
						</h5>
						<p><%=Message.getMaxName(p.getPdescription())%>...
						</p>
						<h4>
							&#8377;
							<%=p.getPprice()%></h4>
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star-half-empty"></i>
					</div>
					<div class="card-footer">
						<a class="btn primary-background text-white"
							onclick="addcart(<%=p.getPid()%>)"><i
							class="fa fa-shopping-cart"></i> Add to cart</a> <a
							class="btn primary-background text-white"
							href="buyproduct.jsp?id=<%=p.getPid()%>">Buy <i
							class="fa fa-angle-double-right"></i></a>


					</div>

				</div>

			</div>

			<%
				}
			%>
		</div>
	</div>

	<!-- third row self development ends -->




	<!-- fourth row starts data structure  -->

	<div class="container-fluid grd pb-3">
		<hr>
		<h3 class="p-3 ">
			<a class="text-dark" href="showproduct_page.jsp?cid=3">Data
				Structure :</a>
		</h3>
		<div class="row">
			<!-- first col -->

			<%
				ArrayList<Products> ds = pdao.getProductsByCatId(3);
			for (int i = 1; i <= 4; i++) {
				Products p = ds.get(new Random().nextInt(ds.size()));
			%>
			<div class="col-md-3 py-3 py-sm-0">
				<div class="card chr shadow">
					<div class="container text-center">
						<a href="viewproduct.jsp?id=<%=p.getPid()%>"> <img
							src="products_pics/<%=p.getPpic()%>"
							style="max-height: 200px; max-width: 100%; width: auto;"
							class="card-img-top my-2">
						</a>
					</div>
					<div class="card-body py-0">
						<h5 class="card-title"><%=Message.getMaxName(p.getPname())%>...
						</h5>
						<p><%=Message.getMaxName(p.getPdescription())%>...more
						</p>
						<h4>
							&#8377;
							<%=p.getPprice()%></h4>
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star-half-empty"></i>
					</div>
					<div class="card-footer">
						<a class="btn primary-background text-white"
							onclick="addcart(<%=p.getPid()%>)" href="#"><i
							class="fa fa-shopping-cart"></i> Add to cart</a> <a
							class="btn primary-background text-white"
							href="buyproduct.jsp?id=<%=p.getPid()%>">Buy <i
							class="fa fa-angle-double-right"></i></a>


					</div>

				</div>

			</div>

			<%
				}
			%>
		</div>
	</div>

	<!-- fourth row data structure ends -->



	<!--5th row fictional starts  -->


	<div class="container-fluid grd pb-3">
		<hr>
		<h3 class="p-3 ">
			<a class="text-dark" href="showproduct_page.jsp?cid=2">Fictional
				&#38; Non-Fictional :</a>
		</h3>
		<div class="row">
			<!-- first col -->

			<%
				ArrayList<Products> fnf = pdao.getProductsByCatId(2);
			for (int i = 1; i <= 4; i++) {
				Products p = fnf.get(new Random().nextInt(fnf.size()));
			%>
			<div class="col-md-3 py-3 py-sm-0">
				<div class="card chr shadow">
					<div class="container text-center">
						<a href="viewproduct.jsp?id=<%=p.getPid()%>"> <img
							src="products_pics/<%=p.getPpic()%>"
							style="max-height: 200px; max-width: 100%; width: auto;"
							class="card-img-top my-2">
						</a>
					</div>
					<div class="card-body py-0">
						<h5 class="card-title"><%=Message.getMaxName(p.getPname())%>...
						</h5>
						<p><%=Message.getMaxName(p.getPdescription())%>...more
						</p>
						<h4>
							&#8377;
							<%=p.getPprice()%></h4>
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star-half-empty"></i>
					</div>
					<div class="card-footer">
						<a class="btn primary-background text-white"
							onclick="addcart(<%=p.getPid()%>)" href="#"><i
							class="fa fa-shopping-cart"></i> Add to cart</a> <a
							class="btn primary-background text-white"
							href="buyproduct.jsp?id=<%=p.getPid()%>">Buy <i
							class="fa fa-angle-double-right"></i></a>


					</div>

				</div>

			</div>

			<%
				}
			%>
		</div>
	</div>

	<br>



	<!-- 5th row fictional ends -->
	<footer>


		<div class="container-fluid p-0 m-0 ">
			<a href="index.jsp"
				class="btn btn-outline-secondary form-control text-white">Back
				to top</a>
			<div class="container text-white py-5">
				<div class="row">
					<div class="col-md-4 my-2">
						<h5>Get to know us</h5>
						<p>
							About Us<br> Careers<br> Press Releases<br>
							BooksMela Cares<br> Gift a Smile
						</p>


					</div>

					<div class="col-md-4 my-2">
						<h5>Connect with us</h5>
						<p class="mb-3">
							<span class="fa fa-facebook-f"></span> Facebook<br> <span
								class="fa fa-twitter"> Twitter</span><br> <span
								class="fa fa-instagram"> Instagram</span><br>
						</p>


					</div>


					<div class="col-md-4 my-2">
						<h5>Make Money with Us</h5>
						<p>
							Sell on BookMela<br> Become an Affiliate<br> Fulfilment
							by BookMela<br> Advertise Your Products<br>

						</p>


					</div>

				</div>


			</div>

			<div class="container text-white text-center">
				<div class="row">
					<div class="col-md-5 offset-md-3">
						<h2>
							<span class="fa fa-book"></span>BooksMela
						</h2>
						<button class="btn btn-outline-primary fa fa-world">
							<i></i> English
						</button>
					</div>
				</div>

			</div>
			<hr>
		</div>



	</footer>

	<!-- Java script -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

	<script>
 
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
			 swal(" Added to cart successfully");
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
