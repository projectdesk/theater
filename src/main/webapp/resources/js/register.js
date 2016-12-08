/**
 * 
 */
$(document).ready(function(){
	$( "#datepicker" ).click(function(){
	$( "#datepicker" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	
	})//click
	
$("#idcheck").click(function(){
		$.ajax({
			url : "idcheck.do",
			type : "get",
			data : {
				"id" : $("input[name='id']").val(),
			},success : function(data){
					if(data==true){
						alert("사용 가능한 아이디입니다.");
						$("input[name='idcheck']").val(true);
					}
					else
						alert("사용 불가능한 아이디입니다.");
		}//success
	});//ajax
	});//idcheck	

});//ready
 function addressSearch(){
        new daum.Postcode({
            oncomplete: function(data) {
        	 document.getElementById("zipcode").value = data.zonecode;
//             document.getElementById("zip2").value = data.postcode2;
             document.getElementById("address1").value = data.address;
             document.getElementById("address2").focus();
             
        	}
        }).open({
        	autoClose: true
        });
 }



