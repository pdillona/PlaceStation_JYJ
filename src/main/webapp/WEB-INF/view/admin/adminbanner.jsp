<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<!-- adminheader.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminheader.jsp" %>
	<!-- adminside.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminside.jsp" %>
    
			
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

			<div class="panel">
				<div class="panel-heading">
					<h3 class="panel-title" style="margin-left: 20px; margin-top: 10px;"><b>광고관리</b></h3>
				</div>
				
			 	<div style="position: absolute; right: 100px;">
			 			<a href="/admin/admin-bannerinsert" data-toggle="modal" data-target="#bannerinsertModal">
        					<span class="label label-info">등록</span>
    					</a>  
						<a href="/admin/admin-bannerupdate" data-toggle="modal" data-target="#bannerupdateModal">
        					<span class="label label-success">수정</span>
    					</a>     	
    					<a href="/admin/admin-bannerdelete" data-toggle="modal" data-target="#bannerdeleteModal">
							<span class="label label-danger">삭제</span>
						</a>
				</div>	
			 
			 
			 
												
				<div class="panel-body no-padding">
					<table class="table table-striped" style="width: 95%; margin: auto;">
						<thead>
							<tr>
								<th style="width: 33.33%;">배너번호</th>
								<th style="width: 33.33%;">배너명</th>
								<th style="width: 33.33%;">사진</th>
							</tr>
						</thead>
					<c:forEach var="bannerlist" items="${bannerlist}">
						<tbody>
							<tr>
								<td>${bannerlist.banNo}</td>
								<td>${bannerlist.banName}</td>
								<td>
								    <c:choose>
								        <c:when test="${empty bannerlist.filePath or bannerlist.filePath eq 'defaultbanner.jpg'}">
								            <img src="/assets/img/defaultbanner.jpg" style="width: 400px; height: 100px;">
								        </c:when>
								        <c:otherwise>
								            <img src="${bannerlist.filePath}" style="width: 400px; height: 100px;">
								        </c:otherwise>
								    </c:choose>
								</td>
							</tr>
						</tbody>
					 </c:forEach>	
					</table>
					
					<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
						<ul class="pagination">
							<c:if test="${pageVO.prev }">
								<li class="page-item">
								  <a class="page-link" href="/admin/admin-banner?page=${pageVO.startPage - 1 }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
							</c:if>


					
							<c:forEach var="i" begin="${pageVO.startPage }"
								end="${pageVO.endPage }" step="1">
								<c:set var="isActive" value="${pageVO.cri.page == i}" />
								<li class="page-item ${isActive ? 'active' : ''}"><a
									class="page-link" href="/admin/admin-banner?page=${i}"
									style="${isActive ? 'background-color: #95c4a2; color: #ffffff; border-color: #81b189;' : 'background-color: #ffffff; color: #000000; border-color: #dddddd;'}">
										${i} </a></li>
							</c:forEach>


				
							<c:if test="${pageVO.next }">
								<li class="page-item"><a class="page-link"
									href="/admin/admin-banner?page=${pageVO.endPage + 1 }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

						</ul>
					</nav>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				</div>
			</div>

		</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->	
	</div>
	<!-- END WRAPPER -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="bannerinsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="bannerupdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content"></div>
	    </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="bannerdeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
    