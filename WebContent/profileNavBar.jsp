<%@page import="com.booksmela.helper.Message"%>
<%@page import="com.bookmela.entites.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.CategoriesDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.bookmela.entites.User"%>

   <%
   User user=(User)session.getAttribute("user");
   %>
   
  <!--Nav Bar starts  -->
	<nav
		class="navbar navbar-expand-lg navbar-dark primary-background fixed-top">
		<a class="navbar-brand txt-weight" href="#"><span
			class="fa fa-book"></span> BooksMela</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto ">
				<li class="nav-item active"></li>
				<li class="nav-item active"></li>

				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-child"></span> About us</a></li>
				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile"><span
						class="fa fa-user"></span> Hello, <%=user.getUname()%></a></li>
				<li class="nav-item active"><a class="nav-link" href="categories.jsp"><span
						class="fa fa-archive"></span> Categories..</a></li>
				<li class="nav-item active"><a class="nav-link"><span
						class="fa fa-map-marker"></span> Delivering to- <%=user.getUaddress()%></a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="logout"><span
						class="fa fa-lock"></span> Logout</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">
					<i class="fa fa-search"></i> Search
				</button>
				<a class="btn btn-outline-light my-2 my-sm-0 ml-3"
					href="addproduct.jsp"><span class="fa fa-shopping-cart"></span></a>
			</form>
		</div>
	</nav>
	<!--nav bae ends  -->

	<!-- profile modal starts -->

	<!-- Modal -->
	<div class="modal fade" id="profile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background ">
					<div class=" text-center text-white">
						<h5 class="modal-title txt-weight" id="exampleModalLabel">
							<span class="fa fa-user-circle fa-2x"></span> Profile
						</h5>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="container text-center mt-3">
					<img src="pics/<%=user.getUpic()%>" style="width: 20%">
					<h4 class="mt-3"><%=user.getUname()%></h4>
				</div>

				<div class="modal-body">

					<!-- profile table starts -->
					<div id="profile-details">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID :</th>
									<th scope="col"><%=user.getUid()%></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getUemail()%></td>
								</tr>
								<tr>
									<th scope="row">Address</th>
									<td><%=user.getUaddress()%></td>
								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getUgender()%></td>
								</tr>
								<tr>
									<th scope="row">Registration Date :</th>
									<td><%=DateFormat.getDateInstance().format(user.getReg_date())%></td>
								</tr>
								<tr>
									<th scope="row">Mobile Number :</th>
									<td><%=user.getUm_number()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- profile table ends -->


					<!-- profile edit table starts -->

					<div id="profile-edit" style="display: none">

						<form action="profile-edit" id="edit-profile" method="post">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row"></th>
										<td><input type="hidden" name="user_id"
											value="<%=user.getUid()%>"></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getUemail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Address</th>
										<td><input type="text" class="form-control"
											name="user_address" value="<%=user.getUaddress()%>"></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getUgender()%></td>
									</tr>
									<tr>
										<th scope="row">Registration Date :</th>
										<td><%=DateFormat.getDateInstance().format(user.getReg_date())%></td>
									</tr>
									<tr>
										<th scope="row">Mobile Number :</th>
										<td><input type="text" class="form-control"
											name="user_number" value="<%=user.getUm_number()%>"></td>
									</tr>
								</tbody>
							</table>

							<button type="submit"
								class="btn btn-outline-success form-control">Save</button>
						</form>



					</div>



					<!-- profile table ends -->

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- profile modal ends -->
