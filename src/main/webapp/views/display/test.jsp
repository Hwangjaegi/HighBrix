<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>리뷰 페이지</title>
<style>

        .stars-container {
            display: inline-block;
            font-size: 24px;
            cursor: pointer;
        }

        .stars {
            display: inline-block;
            overflow: hidden;
            position: relative;
        }

        .star {
            display: inline-block;
            width: 20%;
            overflow: hidden;
        }

.rating .rate_radio+label {
	position: relative; 
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('../../images/heart.svg');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}
</style>

<script type="text/javascript">
	function Rating() {
	};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate) { //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리    
		this.rate = newrate;
		let items = document.querySelectorAll('.rate_radio');
		items.forEach(function(item, idx) {
			if (idx < newrate) {
				item.checked = true;
			} else {
				item.checked = false;
			}
		});
	}
	let rating = new Rating();//별점 인스턴스 생성
	document.addEventListener('DOMContentLoaded', function(){    //별점선택 이벤트 리스너    
		document.querySelector('.rating').addEventListener('click',function(e){        
			let elem = e.target;        
			if(elem.classList.contains('rate_radio')){            
				rating.setRate(parseInt(elem.value));        
				}    
			})});
</script>
</head>
<body>
	<!-- <div class="wrap">
		<h1>후기</h1>
		<form name="reviewform" class="reviewform" method="post"
			action="/save">
			<input type="hidden" name="rate" id="rate" value="0" />
			<p class="title_star">별점과 리뷰를 남겨주세요.</p>
			<div class="review_rating">
				<div class="warning_msg">별점을 선택해 주세요.</div>
				<div class="rating">
					해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용
					<input type="checkbox" name="rating" id="rating1" value="1"
						class="rate_radio" title="1점"> <label for="rating1"></label>
					<input type="checkbox" name="rating" id="rating2" value="2"
						class="rate_radio" title="2점"> <label for="rating2"></label>
					<input type="checkbox" name="rating" id="rating3" value="3"
						class="rate_radio" title="3점"> <label for="rating3"></label>
					<input type="checkbox" name="rating" id="rating4" value="4"
						class="rate_radio" title="4점"> <label for="rating4"></label>
					<input type="checkbox" name="rating" id="rating5" value="5"
						class="rate_radio" title="5점"> <label for="rating5"></label>
				</div>
			</div>
			
		</form>
	</div> -->

	<div>
					    <h2>평가 결과</h2>
					    <p>당신의 평가 점수: ${score }점</p>
					    
					    <!-- 별점 표시 부분 -->
					    <%
						    // 사용자로부터 전달받은 평가 점수
						    int score = Integer.parseInt(request.getParameter("score"));
					    	System.out.print(score);
						%>
					    <div class="stars-container">
					        <div class="stars">
					            <% for (int i = 1; i <= 5; i++) { %>
					                <div class="star" style="color: <%= i <= score ? "gold" : "#ddd" %>">★</div>
					            <% } %>
					        </div>
					    </div>
					</div>
</body>
</html>