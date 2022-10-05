
$(function(){
	
	/* 리스트 페이지 글쓰기 버튼 시작 */
	$("#loginAlertBtn").click(function(){		
		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	
	$("#writeBtn").click(function(){		
		location.href="/bbs/write.jsp";
	});
	/* 리스트 페이지 글쓰기 버튼 끝 */

	/* 문의글 작성 유효성 검사 시작  */
	$("#regBtn").click(function(){
				alert("ok");		
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);	
	
		let subject = $("#subject").val().trim();
		$("#subject").val(subject);	
	
		let content = $("#content").val().trim();
		$("#content").val(content);
	
		if(uName==""){
			alert("이름을 입력해주세요.");
				$("#uName").focus();
				return;
	
		} else if(subject==""){
			alert("제목을 입력해주세요.");
				$("#subject").focus();
				return;
	
		} else if(content==""){
			alert("내용을 입력해주세요.");
				$("#content").focus();
				return;
		} 	
	});
 	/* 문의글 작성 유효성 검사 끝  */


	 /* 상세페이지 이동 시작  */
	$(".prnTr").click(function(){
		let num = $(this).val();
		let url = "/read.jsp"+num;
		
		location.href="read.jsp";	
		
	});
 	/* 상세페이지 이동 시작  */




});





/* 상세내용 보기 페이지 이동 시작 /bbs/list.jsp => read.jsp */
function read(p1, p2) {
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let param = "read.jsp?num="+p1;
	     param += "&nowPage="+p2;
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}		
/* 상세내용 보기 페이지 이동 끝 /bbs/list.jsp => read.jsp  */


