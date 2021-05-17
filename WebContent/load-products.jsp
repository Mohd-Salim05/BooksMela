

<%@page import="com.booksmela.helper.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bookmela.entites.Products"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.ProductDao"%>
<%
  Thread.sleep(1000);
  int cid=Integer.parseInt(request.getParameter("cid"));
  ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
  ArrayList<Products> plist=null;
  if(cid==0){
	  plist=dao.getAllProducts();
  }else{
	  plist=dao.getProductsByCatId(cid);
  }
  
  for(Products p:plist){
%>


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
<p><%=Message.getMaxName(p.getPdescription()) %>...more</p>

</div>
</div>
<hr>
<%
  }
%>