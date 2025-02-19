<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
    <!-- adminheader.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminheader.jsp" %>
	<!-- adminside.jsp -->
    <%@ include file ="/WEB-INF/view/admin/adminside.jsp" %>
     <!-- jquery/ajax 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js" integrity="sha512-pdCVFUWsxl1A4g0uV6fyJ3nrnTGeWnZN2Tl/56j45UvZ1OMdm9CIbctuIHj+yBIRTUUyv6I9+OivXj4i0LPEYA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>    
    
    
    
	 	<script>
			$(document).ready(function() {
			    $(".btn-pdf-download").click(function() {
			        var element = document.querySelector(".box-body");
			        var opt = {
			            margin: 0.5,
			            filename: 'refund_history.pdf',
			            image: { type: 'jpeg', quality: 0.98 },
			            html2canvas: { scale: 2 },
			            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
			        };
			
			        html2pdf().from(element).set(opt).save();
			    });
			});
		</script>
    
    
  	
    
	<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

			<div class="panel">
				<div class="panel-heading">
					<div class="right">
						<button type="button" class="btn-toggle-collapse">
							<i class="lnr lnr-chevron-up"></i>
						</button>
						<button type="button" class="btn-remove">
							<i class="lnr lnr-cross"></i>
						</button>
					</div>
				</div>
				
				<div class="panel-body no-padding">
					
			<div class="container">
						<button class="btn btn-info btn-pdf-download" style="margin-left: 800px;">PDF파일받기</button>    
				   <div class="row justify-content-center">
					 <div class="col-md-8" style="margin-left: 200px;">	
								
						<div class="card">
		 				  <div class="card-body">
			        			
							<div class="box-body"><br>
							
								<div class="details" style="display: inline;">
								    <h3 style="font-weight: bold; display: inline;">환불내역서</h3>
								</div><br><br>
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>결제ID</h5></label>
									 <input type="text" class="form-control" id="exampleInputEmail1"  value="${refund.adminHisNo}">
								</div><br>
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>결제금액(원)</h5></label>
									 <input type="text" class="form-control" id="exampleInputEmail1"  value="${refund.adminHisPrice}">
								</div><br>
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>상품명</h5></label>
									 <input type="text" class="form-control" id="exampleInputEmail1"  value="${refund.prodTitle}">
								</div><br>
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>은행</h5></label>
									 <input type="text" class="form-control" id="exampleInputEmail1"  value="${refund.bank}">
								</div><br>
								
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>환불금액(원)</h5></label>
									 <input type="text" class="form-control" id="exampleInputEmail1" value="${refund.cancelAmount}">
								</div><br>
								
								
								<div class="form-group w-25">
									 <label for="exampleInputEmail1"><h5>취소사유</h5></label>
										<textarea class="form-control" rows="3" readonly="readonly">${refund.cancelReason}</textarea>	
								</div><br>
								
								    
							  <div style="display: flex; align-items: center;">
							    <img src="/logo/logo.jpg.png" style="width:100px; height: 100px;">   
							    <div style="margin-left: 10px;"><h3>대표 김진수</h3>
							    <h4>부산광역시 부산진구 중앙대로 749, 범향빌딩3층</h4>
							    <p style="color: red">이 문서를 유출할 시에는 관련법에 의거, 처벌될 수 도 있습니다.</p>
							    </div>
							    <img src="/logo/sign.png" style="width:150px; height: 100px;"> 
							 </div> 
								      
							  </div>
							   
							  
    						    
						   </div>
						   
				
    					  
					  </div>		
				
				   </div>				
				</div>			
			</div>				
					
					

	
	
	
	
	
					
					
					
					
					
					
					
					
					
					
					
					
					

					
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->	
	</div>
	<!-- END WRAPPER -->
	<script type="text/javascript" src="/js/admin/sign.js"></script>
	
	
	
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
	    
    