<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="mvo" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Babe-베이브</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	
<link rel="stylesheet" href="css/progress.css">
<link rel="stylesheet" href="scss/next.scss">

<style>
body {
	margin-top: 20px;
	color: #e2e8f0;
	text-align: left;
	background-color: #ffffff;
}

.mt-3 {
	text-align: center;
}

.main-body {
	padding: 15px;
}

.cards-list {
	z-index: 0;
	width: 100%;
	height: 70%;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	display: flex;
}

.card {
	margin: 30px auto;
	width: 300px;
	height: 300px;
	border-radius: 40px;
	box-shadow: 1px 1px 5px 1px rgba(0, 0, 0, 0.25), -1px -1px 7px 1px
		rgba(0, 0, 0, 0.22);
	cursor: pointer;
	transition: 0.4s;
}

.card .card_image {
	width: inherit;
	height: inherit;
	border-radius: 40px;
}

.card .card_image img {
	width: inherit;
	height: inherit;
	border-radius: 40px;
	object-fit: cover;
}

.card .card_title {
	text-align: center;
	border-radius: 0px 0px 40px 40px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 30px;
	margin-top: -80px;
	height: 40px;
}

.card:hover {
	transform: scale(0.9, 0.9);
	box-shadow: 5px 5px 30px 15px rgba(237, 218, 225, 0.25), -5px -5px 30px
		15px rgba(237, 225, 225, 0.22);
}

.title-white {
	color: white;
}

.title-black {
	color: black;
}

@media all and (max-width: 500px) {
	.card-list {
		/* On small screens, we are no longer using row direction but column */
		flex-direction: column;
	}
}

#move {
	color: graytext;
	text-align: right;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<jsp:include page="header.jsp"></jsp:include>

		<br> <br> 
		<!-- 사진 업로드  -->
		

		<div class="container">
		
		<div class="progress-container">
	        <div class="dot-container" style="padding:0px;">
	            <ul style="padding-left:0px;">
	            <a href="/photoUpload"><li class="small-circle active"></li></a>
	            <a href="/update"><li class="small-circle"></li></a>
	            </ul>
	        </div>
	    </div>

		<!-- <div class="row">
			<div class="col-12 text-center">
				<h2 class="upload-text">
					<i class="material-icons">file_upload</i> 프로필 사진을 등록해주세요
				</h2>
			</div>
		</div> -->
		
			<div class="main-body">
				<div class="cards-list">
					<c:forEach items="${imageDatas}" var="imageData" varStatus="i">
						<div class="card ${i.count}">
							<div class="card_image">
								<img src="data:image/jpeg;base64,${imageData}"
									style="cursor: pointer;" onclick="openFileInput(${i.count})">
								<form action="${cpath}/fileUpload" method="post"
									enctype="multipart/form-data" id="imageForm${i.count}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="file"
										id="photo${i.count}" name="file" accept="image/*"
										class="custom-input" onchange="uploadOnChange(this)">
									<input type="hidden" id="photoNum" name="photoNum"
										value="${i.count}">
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
				<br> <br> <br>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 text-right">
						<div class="d-flex justify-content-end align-items-center">
							<h4 id="move" style="margin: 0; margin-right: 20px;">정보 입력
								페이지로 이동</h4>
							<a href="/update" class="btn btn-lg"
								style="background-color: pink; width: 40px; height: 40px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
								<i class="bi bi-chevron-right" style="color: white;"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>


	</div>
	</div>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<script>
    function uploadOnChange(input) {
          if (input.files && input.files[0]) {
              // 파일이 선택되면 자동으로 form submit
             input.parentNode.submit();
          }
      }
        
       function openFileInput(count) {
           document.getElementById('photo' + count).click();
       }

       function displayFileName(input) {
           var fileName = input.files[0].name;
           // 여기에서 파일 이름을 표시하거나 추가적인 작업을 수행할 수 있습니다.
           console.log(fileName);
       }
   </script>
</body>
</html>