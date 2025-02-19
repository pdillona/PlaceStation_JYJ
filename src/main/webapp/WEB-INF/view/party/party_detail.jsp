<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
/* Add padding to product boxes */
img {
	border-radius: 10px;
}

* {
	padding: 0;
	margin: 0;
}

/* 버튼 */
div.btn-after-login {
	float: right;
}

button.btn {
	padding: 7px 11px;
}

button.btn-success {
	background-color: #5bc0de;
	border-color: #00b4d8;
}

#btn-update {
	margin-left: 7px;
}

#btn-delete {
	margin-left: 7px;
}

/* Hover Effects */
.post-thumbnail img {
	transition: transform 0.3s ease;
}

.post-thumbnail:hover img {
	transform: scale(1.05); /* Enlarge image on hover */
}

.main {
	margin-top: 100px;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: bold;
}
</style>

<div class="main">
	<section class="module-small">
		<div class="container">
			<div class="row">
				<!-- 사이드바 시작 -->
				<div class="col-sm-4 col-md-3 sidebar wow slideInLeft">
					<div class="widget">
						<form role="form" action="/party/main" method="get">
							<h6>다른 모임 둘러보기</h6>
							<div class="search-box">

								<input class="form-control" type="text" placeholder="Search..."
									name="partyTitle" />
								<button class="search-btn" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="widget">
						<h5 class="widget-title font-alt">공지 사항</h5>
						<ul class="icon-list">
							<c:forEach items="${partyAnnouncement}" var="anno">
								<li><a
									href="/party/announcement/${anno.partyAnnouncementNo}">${anno.partyAnnouncementTitle}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 사이드바 종료 -->

				<!-- 본문 시작 -->
				<div class="col-sm-8 col-sm-offset-1">
					<div class="post">
						<div class="post-thumbnail  wow pulse">
							<img src="${party.filePath}" alt="Blog Featured Image"
								style="width: 100%" />

						</div>
						<div class="post-header font-alt wow pulse">
							<div style="text-align: right;">
								<!-- 참가하기 -->

								<c:choose>
									<c:when test="${party.cancelYn == 'Y'}">
										<button class="btn btn-secondary btn-round" disabled>환불이
											완료된 모임입니다.</button>
									</c:when>
									<c:when test="${validDate}">
										<button class="btn btn-secondary btn-round" disabled>이미
											시간이 지난 모임입니다.</button>
									</c:when>
									<c:when test="${member == null}">
										<button class="btn btn-danger btn-round">
											<a href="/member/login" style="color: white"> 로그인을 먼저
												해주세요</a>
									</c:when>
									<c:when test="${member.userno == party.partyHost}">
										<div class="btn-after-login" style="display: flex;">
											<div   id="button-write">

												<a class="btn btn-round" 
													href="/party/announcement/create?party-no=${party.partyNo}"
													style="color: white; background-color: #5bc0de"> 공지사항 작성</a>
											</div>
											<div  id="btn-update">

												<a href="/party/update/${party.partyNo}" class="btn  btn-round"
													style="color: white; background-color: #5bc0de"> 모임 수정</a>
											</div>
											<div >
											<form action="/party/delete/${party.partyNo}" method="post">
												<input type="hidden" name="_method" value="delete" />
												<button class="btn  btn-round" id="btn-delete" style="background-color: #5bc0de; color : white"
													type="submit">모임 삭제</button>
											</form>
											</div>
										</div>
									</c:when>
									<c:when test="${validJoin}">
										<form action="/party/delete-join" method="post">
											<input type="hidden" name="_method" value="delete" /> <input
												type="hidden" name="partyNo" value="${party.partyNo}" /> <input
												type="hidden" name="isJoin" value="N" />
											<button class="btn btn-danger btn-round" type="submit">모임
												나가기</button>
										</form>
									</c:when>

									<c:when
										test="${parcipationParties.size() + 1 == party.partyMaximumPeople}">
										<button class="btn btn-secondary btn-round" disabled>인원이
											꽉 찼습니다.</button>
									</c:when>
									<c:when test="${!validJoin}">
										<form action="/party/join" method="post">
											<input type="hidden" name="partyNo" value="${party.partyNo}" />
											<input type="hidden" name="isJoin" value="Y" />
											<button class="btn btn-success btn-round" type="submit">모임
												참가하기</button>
										</form>
									</c:when>
								</c:choose>

								<!-- 참가하기 종료 -->
							</div>
							<h1 class="post-title">${party.partyTitle}</h1>
							<div class="post-meta">
								By&nbsp;<a href="#">${party.username}</a>&nbsp;|
								${party.partyCreatedAt} |
							</div>
						</div>


						<div class="post-entry wow fadeIn">
							<h3>모임 소개</h3>
							<p style="white-space: pre-line;">${party.partyDescription}</p>
							<ul>
								<li>주최자 : ${party.username}</li>
								<c:choose>
									<c:when test="${party.gender == 'M'}">
										<li>주최자 성별 : 남성</li>
									</c:when>
									<c:when test="${party.gender == 'F'}">
										<li>주최자 성별 : 여성</li>
									</c:when>
								</c:choose>
								<li>주최자 등급 : ${party.grade}</li>
								<li>주최자 이메일 : ${party.useremail}</li>
							</ul>
						</div>
					</div>

					<div class="post-entry wow fadeIn">
						<h4>상품 정보</h4>
						<p>상품명 : ${party.prodTitle}</p>

						<blockquote>
							<!-- <p>${party.prodSpaceInfo}</p>  -->
						</blockquote>
						<p></p>

						<ul>
							<li>인당 가격 : ${party.peopleByamount()}&nbsp; 원</li>
							<li>위치 : ${party.prodFullAddress}</li>
							<li>해당 주소 : <a
								href="/product/productDetail?prod_no=${party.prodNo}">이곳을
									클릭해 주세요!!</a></li>

							<li>시간 :
								${party.purchaseDate}&nbsp;&nbsp;${party.startTime}시&nbsp;~&nbsp;${party.endTime}시
							</li>
						</ul>
					</div>
					<!-- 본문 종료 -->

					<!-- 사람 인원 칸 시작 -->
					<div class="comments wow fadeIn">
						<h4 class="comment-title font-alt">모임 사람들 &nbsp;&nbsp;
							${parcipationParties.size() + 1} / ${party.partyMaximumPeople}</h4>
						<div class="comment clearfix">

							<div class="comment-avatar">

								<img src="${party.userFilePath}" alt="avatar" />
							</div>
							<div class="comment-content clearfix">
								<div class="comment-author font-alt">

									<a href="#">${party.username}&nbsp;&nbsp; (파티장) 님</a>
								</div>
							</div>
						</div>
						<c:forEach items="${parcipationParties}" var="memberList">
							<div class="comment clearfix">
								<div class="comment-avatar">
									<img src="${memberList.filePath}" alt="avatar" />
								</div>
								<div class="comment-content clearfix">
									<div class="comment-author font-alt">
										<a href="#">${memberList.userName}&nbsp;&nbsp; 님</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 사람 인원 칸 종료 -->
				</div>
			</div>
	</section>
</div>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>


<!-- include.jsp -->
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>