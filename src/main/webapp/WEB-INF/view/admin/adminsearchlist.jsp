<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- adminheader.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminheader.jsp" %>
	<!-- adminside.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminside.jsp" %>
    <!-- jquery/ajax 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		


		
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
		
			<div class="panel">
				
				<div style="display: flex;">
				    <div>
				        <div class="panel-heading">
				            <h3 class="panel-title" style="margin-left: 20px; margin-top: 10px;"><b>회원관리</b></h3>
				        </div>
				    </div>
				   <form action="/admin/admin-searchmember" method="get">
					    <div>
					         <div class="input-group" style="margin-top: 20px; margin-left: 1500px; display: flex; align-items: center;">
					        	<select name="searchOption" class="form-control" style="width: 100px; margin-right: 2px;">
					        			<option value="user_name">이름</option>
								        <option value="user_address">주소</option>
								        <option value="grade">등급</option>
								        <option value="join_at">가입일</option>
				   				</select>
					            <input type="text" name="searchKeyword" class="form-control" placeholder="키워드입력">
					            <span class="input-group-btn">
					                <button type="submit" class="btn btn-primary">검색</button>
					            </span>
					        </div>
					    </div>
				    </form> 
				</div>
				
				
				<div class="panel-body no-padding">
					<table class="table table-striped" style="width: 95%; margin: auto;">
						<thead>
							<tr>
								<th>사진</th>
								<th>등급(포인트)</th>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>주소</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>가입일</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
					<c:forEach var="memberlist" items="${memberlist}">
						<tbody>
							<tr>
							     <td>
								    <c:choose>
								        <c:when test="${memberlist.filepath eq 'default.jpg'}">
								           <a href="/admin/admin-photoupdate" data-toggle="modal" data-target="#photoModal">
								            <img src="/assets/img/default.jpg" style="width:30px; height: 30px; border-radius:50%;">
								           </a>
								        </c:when>
								        <c:otherwise>
								           <a href="/admin/admin-photoupdate"  data-toggle="modal" data-target="#photoModal">
								            <img src="${memberlist.filepath}" style="width:30px; height: 30px; border-radius:50%;">
								           </a>
								        </c:otherwise>
								    </c:choose>
								</td>
								  <td>	
									<c:choose>
										<c:when test="${memberlist.grade == '브론즈'}">
											<img src="/assets/img/bronze.png" style="width:30px; height: 30px; border-radius:50%;">	(${memberlist.userpoint})
										</c:when>
										<c:when test="${memberlist.grade =='실버'}">
											<img src="/assets/img/silver.png" style="width:30px; height: 30px; border-radius:50%;"> (${memberlist.userpoint})
										</c:when>
										<c:otherwise>
											<img src="/assets/img/gold.png" style="width:30px; height: 30px; border-radius:50%;"> (${memberlist.userpoint})
										</c:otherwise>
									</c:choose>
								  </td>
								<td>${memberlist.userno}</td>  
								<td>${memberlist.username}</td>
								<td>${memberlist.userid}</td>
								<td>${memberlist.useraddress}</td>
								<td>${memberlist.useremail}</td>
								<td>${memberlist.formatHp(memberlist.userhp)}</td>
								<td>${memberlist.formatjoinAt()}</td>
								<td>
									<a href="/admin/admin-update" data-toggle="modal" data-target="#updateModal">
        								<span class="label label-success">수정</span>
    								</a>     	
    								<a href="/admin/admin-delete" data-toggle="modal" data-target="#deleteModal">
										<span class="label label-danger">삭제</span>
									</a>
								</td>
																						
							</tr>
						</tbody>
					  </c:forEach>	
					</table>


					
					<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
						<ul class="pagination">
							<c:if test="${pageVO.prev }">
								<li class="page-item">
								  <a class="page-link" href="/admin/admin-searchmember?page=${pageVO.startPage - 1 }&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
							</c:if>


					
							<c:forEach var="i" begin="${pageVO.startPage }"
								end="${pageVO.endPage }" step="1">
								<c:set var="isActive" value="${pageVO.cri.page == i}" />
								<li class="page-item ${isActive ? 'active' : ''}"><a
									class="page-link" href="/admin/admin-searchmember?page=${i}&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}"
									style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
										${i} </a></li>
							</c:forEach>
							

				
							<c:if test="${pageVO.next }">
								<li class="page-item"><a class="page-link"
									href="/admin/admin-searchmember?page=${pageVO.endPage + 1 }&searchKeyword=${pageVO.cri.searchKeyword}&searchOption=${pageVO.cri.searchOption}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

						</ul>
					</nav>

				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->	
	</div>
	<!-- END WRAPPER -->
	
		
	
	<!-- Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>











<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	
	
	
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>
	
	
	

	

	
	
	
</body>

</html>
