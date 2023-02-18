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
	bookDao ud=new bookDao(connectionProvider.getConnection());
	book bd=ud.getbookingbyuser(use.getId());
	%>
	
	<main class="container my-2">
		<div class="row">
			<div class=" col-md-8 col-12 offset-md-2">
				<div class="card shadow-lg">
					<div class="card-image text-center">

						<i class="material-icons display-2">train</i>
						<h4>Cancel Booking</h4>
					</div>
					<div class="card-content">
						<div class="container">
							<form class="form" id="reg-form" action="" method="">
								<div class="form-group">
									<label for="exampleInputEmail1">PNR number</label> <input
										type="text" class="form-control" name="tname"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter PNR number to cancel">
								</div>
								
								<div class="form-check">
								
									<a class="btn bg-danger btn-outline-light m-4"
					data-toggle="modal" data-target="#cancelModal" href="#">Cancel!!</a>
</div>								
							</form>
								</div>
						</div>
					</div>
				</div>
			</div>
						
						
						<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header primary-background">
						<h5 class="modal-title text-dark" id="exampleModalLabel">TRAINS</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form class="form" id="reg-form" action="cancelServlet" method="post">
								<div class="form-group">
									<label for="exampleid">Train name</label> <input type="text"
										class="form-control" name="tname" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Your name"
										value="<%=bd.getTname()%>" >
								</div>
								<div class="form-group">
									<label for="exampleid">Train number</label> <input type="text"
										class="form-control" name="tid" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Your name"
										value="<%=bd.getTid()%>" >
								</div>
								<div class="form-group">
									<label for="exampleInputName1">Train date</label> <input
										type="text" class="form-control" name="uname"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Your name" value="<%=bd.getDate()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Departure place</label> <input
										type="text" class="form-control" name="email"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email" value="<%=bd.getDepart()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Destination place</label> <input
										type="text" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password"
										value="<%=bd.getDestiny()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputgender">Class</label> <input
										type="text" name="gender" class="form-control"
										id="exampleInputgender" placeholder="gender"
										value="<%=bd.getClasss()%>">
								</div>

								
								<div class="form-check">
									<button type=submit
										class="btn btn-danger btn-outline-light bg-dark">Cancel</button>

								</div>
							</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
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