//엔코딩부터 확인
function inputCheck() {
	if (document.regForm.id.value == "") {
		alert("아이디를 입력해주세요");
		document.regForm.mem_id.focus();
		return;
	}
	if (document.regForm.password.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.regForm.mem_passwd.focus();
		return;
	}
	if (document.regForm.password.value != document.regForm.passwordCheck.value) {
		alert("비밀번호가 다릅니다");
		document.regForm.mem_repasswd.focus();
		return;
	}

	if (document.regForm.name.value == "") {
		alert("이름을 입력해 주세요");
		document.regForm.mem_name.focus();
		return;
	}
	if (document.regForm.birthday.value == "") {
		alert("생년월일을 적어주세요");
		document.regForm.mem_phone.focus();
		return;
	}

	if (document.regForm.email.value == "") {
		alert("이메일 입력해 주세요");
		document.regForm.mem_email.focus();
		return;
	}

	if (document.regForm.zipcode.value == "") {
		alert("우편번호를 적어주세요");
		document.regForm.mem_phone.focus();
		return;
	}

	if (document.regForm.address2.value == "") {
		alert("주소를 다 적어주세요");
		document.regForm.mem_phone.focus();
		return;
	}
	if (document.regForm.phone.value == "") {
		alert("연락처를 입력해 주세요");
		document.regForm.mem_phone.focus();
		return;
	}
	document.regForm.submit();
}

function loginCheck() {
	if (document.loginform.id.value == "") {
		alert("아이디를 입력해주세요");
		document.regForm.mem_id.focus();
		return;
	}
	if (document.loginform.password.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.regForm.mem_passwd.focus();
		return;
	}
	document.loginform.submit();
}
