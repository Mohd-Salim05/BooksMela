<%@page import="java.util.ArrayList"%>
<%@page import="com.bookmela.entites.Categories"%>
<%@page import="com.booksmela.helper.ConnectionProvider"%>
<%@page import="com.booksmela.dao.CategoriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    CategoriesDao dao=new CategoriesDao(ConnectionProvider.getConnection());

    ArrayList<Categories> cat=dao.getAllCategories();
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<div class="container mt-3">
<form action="add" method="post" enctype="multipart/form-data">
     <select name="cid" class="form-control form-control-lg">
          <option >Categories</option>
          <%
          for(Categories c:cat){
          %>
           <option   value="<%=c.getCid() %>" ><%=c.getCname() %></option>
          <%
          }
          %>
      </select>

  <div class="form-group">
    <label for="exampleInputEmail1">product name</label>
    <input type="text" class="form-control"name="pname" aria-describedby="emailHelp" placeholder="product name">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">product description</label>
    <input type="text" class="form-control" name="pdesc"id="exampleInputPassword1" placeholder="product description">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">product price</label>
    <input type="text" class="form-control" name="pprice"id="exampleInputPassword1" placeholder="product price">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">product discount</label>
    <input type="text" class="form-control" name="pdis"id="exampleInputPassword1" placeholder="product discount">
  </div>
   <div class="form-group">
    <label for="exampleFormControlFile1">image</label>
    <input type="file" class="form-control-file" name="pimg"id="exampleFormControlFile1">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

</body>
</html>