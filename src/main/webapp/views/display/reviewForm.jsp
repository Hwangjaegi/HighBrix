<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&family=Lora:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	@import url("/highbrix/css/display/display.css");	/* 디스플레이 css 연동 */
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>별 평점 시스템</title>
    <style>
        .star-rating {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .star {
            font-size: 30px;
            cursor: pointer;
            color: #ccc;
            transition: color 0.3s ease;
        }

        .star:hover,
        .star.checked {
            color: #ffdb58;
        }

        /* Hide radio buttons */
        input[type="radio"] {
            display: none;
        }
    </style>
    <script>
    	//reviewForm이 load되면 리뷰별점을 기본적으로 5점으로 세팅
    	document.addEventListener('DOMContentLoaded',function(){
    		const defaultStar = document.querySelector('.star[data-rating="5"]');
    		if(defaultStar){
    			defaultStar.click();
    		}
    	});
    	
    	//리뷰별점을 클릭시 원하는 별점으로 변환
        function handleRating(event) {
            const selectedStar = event.target;
            if (selectedStar.classList.contains('star')) {
                const ratingValue = selectedStar.getAttribute('data-rating');
                document.getElementById('selectedRating').value = ratingValue;

                // Reset all stars
                const stars = document.querySelectorAll('.star');
                stars.forEach(star => star.classList.remove('checked'));

                // Highlight selected star and those before it
                selectedStar.classList.add('checked');
                let prevStar = selectedStar.previousElementSibling;
                while (prevStar) {
                    prevStar.classList.add('checked');
                    prevStar = prevStar.previousElementSibling;
                }
            }
        }
       
       
    </script>
</head>
<body>
	<div class="reviewCon">
		<img class="reviewImg" alt="상품사진" src="../../images/product_img/${cm_product.cm_image }">
	    <h2>상품 평점 주기</h2><p>
	    
	    <div class="star-rating" onclick="handleRating(event)">
	        <span class="star" data-rating="1">&#9733;</span>
	        <span class="star" data-rating="2">&#9733;</span>
	        <span class="star" data-rating="3">&#9733;</span>
	        <span class="star" data-rating="4">&#9733;</span>
	        <span class="star" data-rating="5">&#9733;</span>
	    </div>
	    
	    <div class="ratingForm">
		    <form id="ratingForm" action="review.do" method="post" enctype="multipart/form-data">
		        <input type="hidden" name="rating" id="selectedRating">
		        <input type="hidden" name="cm_no" value="${cm_no }"> 
		       	<table class="reviewTable">
		       		<tr><th width="30%" class="reviewTh">리뷰제목</th><td width="70%" class="reviewTd"><input type="text" name="r_Title" required="required" autofocus="autofocus"></td></tr>
		       		<tr><th class="reviewTh">리뷰내용</th><td class="reviewTd"><textarea rows="20" cols="40" name="r_Content"></textarea>
		       		<tr><th class="reviewTh">리뷰이미지</th><td class="reviewTd"><input class="btn btn-outline-danger" type="file" name="file" ></td></tr>
		       	</table>
		        <input class="btn btn-outline-danger" id="reviewBtn" type="submit" value="후기작성">
		    </form>
	    </div>
    </div>
</body>
</html>