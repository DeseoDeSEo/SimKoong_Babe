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

<!-- 채팅관련 모듈 불러오기 -->
<link href="css/interaction.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@7.0.0/bundles/stomp.umd.min.js"></script>


</head>

<body style="background: #FFFFFF;">
	<div class="container-xxl bg-white p-0">
		<jsp:include page="../header.jsp"></jsp:include>
		<!-- 매칭 정보 확인 -->
		<section id="team" class="pb-5">
			<div class="container">
				<h5 class="section-title h1">You've Matched!</h5>
				<div class="row">
					<!-- Team member -->

					<c:forEach var="matchedUser" items="${matchedUsers}"
						varStatus="status">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="image-flip"
								ontouchstart="this.classList.toggle('hover');">
								<div class="mainflip">
									<div class="frontside" style="overflow: hidden;">
										<div class="card">
											<img class="img-fluid"
												src="data:image/jpeg;base64,${matchedUser.photo_base64}"
												alt="card image">
										</div>
									</div>
									<div class="backside">
										<div class="card">
											<div class="card-body text-center mt-4"
												style="text-align: left; overflow-y: auto;">
												<h4 class="card-title">${matchedUser.nickname}</h4>
												<p class="card-text">${matchedUser.aboutme}</p>


												<c:if test="${not empty matchedUser.address}">
													<div style="background-color: #007bff;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-home"></i> 
														&nbsp;&nbsp;${matchedUser.address[0]}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.age}">
													<div style="background-color: #6610f2;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-birthday-cake"></i> 
														&nbsp;&nbsp;${matchedUser.age}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.drinking}">
													<div style="background-color: #6f42c1;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-beer"></i> 
														&nbsp;&nbsp;${matchedUser.drinking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.interest}">
													<div style="background-color: #e83e8c;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-book"></i> 
														&nbsp;&nbsp;${matchedUser.interest}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.job}">
													<div style="background-color: #dc3545;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-laptop-code"></i> 
														&nbsp;&nbsp;${matchedUser.job}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.mbti}">
													<div style="background-color: #fd7e14;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-chess"></i> 
														&nbsp;&nbsp;${matchedUser.mbti}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.school}">
													<div style="background-color: #28a745;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-school"></i> 
														&nbsp;&nbsp;${matchedUser.school}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.sex}">
													<div style="background-color: #20c997;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-male"></i> 
														&nbsp;&nbsp;${matchedUser.sex}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.smoking}">
													<div style="background-color: #17a2b8;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-smoking"></i> 
														&nbsp;&nbsp;${matchedUser.smoking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty matchedUser.sport}">
													<div style="background-color: #6c757d;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-futbol"></i> 
														&nbsp;&nbsp;${matchedUser.sport}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</section>
		<!-- 받은 좋아요 확인 -->
		<section id="team" class="pb-5">
			<div class="container">
				<h5 class="section-title h1">Received likes</h5>
				<div class="row">
					<!-- Team member -->

					<c:forEach var="likedUser" items="${likedUsers}" varStatus="status">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="image-flip"
								ontouchstart="this.classList.toggle('hover');">
								<div class="mainflip">
									<div class="frontside" style="overflow: hidden;">
										<div class="card">
											<img class="img-fluid"
												src="data:image/jpeg;base64,${likedUser.photo_base64}"
												alt="card image">
										</div>
									</div>
									<div class="backside">
										<div class="card">
											<div class="card-body text-center mt-4"
												style="text-align: left; overflow-y: auto;">
												<h4 class="card-title">${likedUser.nickname}</h4>
												<p class="card-text">${likedUser.aboutme}</p>


												<c:if test="${not empty likedUser.address}">
													<div style="background-color: #007bff;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-home"></i> 
														&nbsp;&nbsp;${likedUser.address[0]}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.age}">
													<div style="background-color: #6610f2;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-birthday-cake"></i> 
														&nbsp;&nbsp;${likedUser.age}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.drinking}">
													<div style="background-color: #6f42c1;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-beer"></i> 
														&nbsp;&nbsp;${likedUser.drinking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.interest}">
													<div style="background-color: #e83e8c;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-book"></i> 
														&nbsp;&nbsp;${likedUser.interest}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.job}">
													<div style="background-color: #dc3545;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-laptop-code"></i> 
														&nbsp;&nbsp;${likedUser.job}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.mbti}">
													<div style="background-color: #fd7e14;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-chess"></i> 
														&nbsp;&nbsp;${likedUser.mbti}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.school}">
													<div style="background-color: #28a745;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-school"></i> 
														&nbsp;&nbsp;${likedUser.school}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.sex}">
													<div style="background-color: #20c997;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-male"></i> 
														&nbsp;&nbsp;${likedUser.sex}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.smoking}">
													<div style="background-color: #17a2b8;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-smoking"></i> 
														&nbsp;&nbsp;${likeUser.smoking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likedUser.sport}">
													<div style="background-color: #6c757d;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-futbol"></i> 
														&nbsp;&nbsp;${likedUser.sport}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</section>


		<!-- 보낸 좋아요 확인 -->
		<section id="team" class="pb-5">
			<div class="container">
				<h5 class="section-title h1">sent likes</h5>
				<div class="row">
					<!-- Team member -->

					<c:forEach var="likeUser" items="${likeUsers}" varStatus="status">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="image-flip"
								ontouchstart="this.classList.toggle('hover');">
								<div class="mainflip">
									<div class="frontside" style="overflow: hidden;">
										<div class="card">
											<img class="img-fluid"
												src="data:image/jpeg;base64,${likeUser.photo_base64}"
												alt="card image">
										</div>
									</div>
									<div class="backside">
										<div class="card">
											<div class="card-body text-center mt-4"
												style="text-align: left; overflow-y: auto;">
												<h4 class="card-title">${likeUser.nickname}</h4>
												<p class="card-text">${likeUser.aboutme}</p>


												<c:if test="${not empty likeUser.address}">
													<div style="background-color: #007bff;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-home"></i> 
														&nbsp;&nbsp;${likeUser.address[0]}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.age}">
													<div style="background-color: #6610f2;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-birthday-cake"></i> 
														&nbsp;&nbsp;${likeUser.age}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.drinking}">
													<div style="background-color: #6f42c1;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-beer"></i> 
														&nbsp;&nbsp;${likeUser.drinking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.interest}">
													<div style="background-color: #e83e8c;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-book"></i> 
														&nbsp;&nbsp;${likeUser.interest}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.job}">
													<div style="background-color: #dc3545;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-laptop-code"></i> 
														&nbsp;&nbsp;${likeUser.job}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.mbti}">
													<div style="background-color: #fd7e14;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-chess"></i> 
														&nbsp;&nbsp;${likeUser.mbti}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.school}">
													<div style="background-color: #28a745;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-school"></i> 
														&nbsp;&nbsp;${likeUser.school}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.sex}">
													<div style="background-color: #20c997;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-male"></i> 
														&nbsp;&nbsp;${likeUser.sex}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.smoking}">
													<div style="background-color: #17a2b8;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-smoking"></i> 
														&nbsp;&nbsp;${likeUser.smoking}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												<c:if test="${not empty likeUser.sport}">
													<div style="background-color: #6c757d;"
														class="chip chip-md success-color white-text  example z-depth-2 mr-0">
														<i class="fas fa-futbol"></i> 
														&nbsp;&nbsp;${likeUser.sport}
													</div>
													<div style="width: 5px; display: inline;">&nbsp;</div>
												</c:if>
												

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</section>


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>

		
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

	<script type="text/javascript">
		//스크롤 이벤트 핸들러
		window.onscroll = function() {
			// 페이지 끝에 도달했는지 확인
			if (window.innerHeight + window.pageYOffset >= document.body.offsetHeight) {
				// AJAX 호출을 통해 새로운 콘텐츠 로드 (여기서는 예시로 setTimeout을 사용합니다)
				setTimeout(
						function() {
							// 새로운 콘텐츠 블록 추가
							$('#additional-content')
									.append(
											'<div class="row">'
													+ '<div class="col-md-4"><div class="content-block">추가 내용</div></div>'
													+ '<div class="col-md-4"><div class="content-block">추가 내용</div></div>'
													+ '<div class="col-md-4"><div class="content-block">추가 내용</div></div>'
													+ '</div>');
						}, 500); // 0.5초 딜레이 후 콘텐츠 추가
			}
		};
		
		document.addEventListener("DOMContentLoaded", function(){
		    var flipContainers = document.querySelectorAll('.image-flip');

		    flipContainers.forEach(function(container) {
		        container.addEventListener('click', function() {
		            if (container.classList.contains('click')) {
		                container.classList.remove('click');
		            } else {
		                container.classList.add('click');
		            }
		        });
		    });
		});
		
	</script>


</body>

</html>

