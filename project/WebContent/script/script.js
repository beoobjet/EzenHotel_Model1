
$(function(){
	
	/* 상단 메뉴 고정 시작 */
	
	/* 상단 메뉴 고정 끝 */
	
	/* 공지사항 시작 */
	$("#tabBtn>button").click(function(){
		
		$("#tabBtn>button").css({
	            "border": "1px solid #eceae1",
	            "background-color": "#faf9f4"
	        });

	        $(this).css({
	            "background": "#fff",
	            "border-bottom": "1px solid #fff"
	        });
	
	      let dataLink = $(this).attr("data-link");
			
	
			$(".multiTB").css({
		            "display": "none"
		        });

	        $("." + dataLink).css({
	            "display": "inline-block"
	        });
	});
	
	$(".btnIco").click(function(){
		let img = $(this).children("img");
		img.attr("src",function(index, attr){
			if(attr.match('up')){
				return attr.replace("up","down");
			} else{
				return attr.replace("down","up");
			}
		});
		
		$(".reply").toggle();
	});
	
	
	/* 공지사항 끝 */
	
	/* 고객센터 유효성 검사 시작  */	
	$("#regBtn").click(function(){
	let uName = $("#uName").val().trim();
	$("#uName").val(uName);
	
	let subject = $("#subject").val().trim();
	$("#subject").val(subject);
	
	let content = $("#content").val().trim();
	$("#content").val(content);
	
	if(uName==""){
		alert("이름을 입력해주세요.");
			$("#uName").focus();
			return false;
	} else if(subject==""){
		alert("제목을 입력해주세요.");
			$("#subject").focus();
			return false;
	} else if(content==""){
		alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
	} 

	});
	/* 고객센터 유효성 검사   */
	
	/* 슬라이드 쇼 시작 */
	setInterval(fnSlide_Fade, 6000);
	
	 function fnSlide_Fade() {
		$("#slideFrame>a:nth-child(1)").fadeOut(
				3000,
				function(){
					$(this).insertAfter("#slideFrame>a:nth-child(3)");
					
				}
			);
		$("#slideFrame>a:nth-child(2)").fadeIn(3000);
	} 
	
	/* 슬라이드 쇼 끝 */
	
	/* 상세보기 시작 */
	$(".readNum").click(function(){
		let num = $(this).attr('value');
		let param = "read.jsp?num="+num;
		
		location.href=param;
		
	});
	
	/* 상세보기 끝 */
	
	/* 삭제 시작 */
	$(".delBtn").click(function(){
		let num = $(this).attr('value');
		let param = "deleteProc.jsp?num="+num;
		
		location.href=param;
		
	});
	
	/* 삭제 끝 */
});


