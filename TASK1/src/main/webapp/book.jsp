<%@page import="project.entities.trains"%>
<%@page import="project.dao.trainDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.helper.connectionProvider"%>
<%@page import="java.io.File"%>
<%@page import="project.entities.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Compiled and minified CSS -->


</head>
<body style="background-image: linear-gradient(to right, #8078782b, #ffffff, #c1c1c1b0)">

	<%
	user use = (user) session.getAttribute("currentUser");
	if (use == null) {
	%>
	<%@ include file="navbar.jsp"%>
	<%
	} else {
	%>
	<%@ include file="userNavbar.jsp"%>
	<%
	}
	%>
	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	trainDao pda = new trainDao(connectionProvider.getConnection());
	trains p = pda.gettrainsById(pid);
	%>
	<main class="container my-2">
		<div class="row">
			<div class=" col-md-8 col-12 offset-md-2">
				<div class="card shadow-lg">
					<div class="card-image text-center">

						<i class="material-icons display-2">train</i>
						<h4>Booking</h4>
					</div>
					<div class="card-content">
						<div class="container">
							<form class="form" id="reg-form" action="bookServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Train Name</label> <input
										type="text" class="form-control" name="tname" value=<%=p.getPtitle()%>
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Your name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Train number</label> <input
										type="text" class="form-control" name="tid" value=<%=p.getPid() %>
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Departure date</label> <input
										type="text" name="date" class="form-control" 
										id="exampleInputPassword1" placeholder="day/month/year">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Train class</label> <input
										type="text" name="class" class="form-control" 
										id="exampleInputPassword1" placeholder="enter the class of your train">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Departure place</label> <input
										type="text" name="depart" class="form-control" 
										id="exampleInputPassword1" placeholder="enter from where you want to depart here">
								
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Destination</label> <input
										type="text" name="destiny" class="form-control" 
										id="exampleInputPassword1" placeholder="enter your destination here">
								
								</div>
								<div class="form-group">
									<input
										type="text" name="user" class="form-control invisible" 
										id="exampleInputPassword1" value=<%=use.getId()%>>
								
								</div>
								
								<div class="form-check">
									<input id="check" type="checkbox" class="filled-in" /> <label
										class="form-check-label" for="exampleCheck1">agree
										Terms and Conditions</label>
								</div>
								<div class="form-check m-3">
									<button type=submit
										class="btn bg-warning btn-outline-light">Book now!!</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
</body>
</html>