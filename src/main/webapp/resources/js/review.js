function inputCheck() {
	if (document.reviewForm.name.value == "") {
		alert("영화를 선택해주세요");
		document.reviewForm.name.focus();
		return;
	}	
	if (document.reviewForm.grade.value == "") {
		alert("평점을 선택해주세요");
		document.reviewForm.grade.focus();
		return;
	}
	if (document.reviewForm.title.value == "") {
		alert("제목을 입력해주세요");
		document.reviewForm.title.focus();
		return;
	}
	if (document.reviewForm.content.value == "") {
		alert("내용을 입력해주세요");
		document.reviewForm.content.focus();
		return;
	}
	document.reviewForm.submit();
}