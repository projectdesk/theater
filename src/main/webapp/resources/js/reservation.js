//�󿵰�����
function setRoom(){
//	var st; 
//$.each(window.event,function(index,value){
//	 st+=index+":"+value+"\n";
// });
// alert(st);
	var source = window.event.target || window.event.srcElement;
	$('input[name="room"]').val(source.text);
}
$(document).ready(function(){
	//��ȭ������
		$(".theater>a").click(function(){
			var val=this;
			  $.ajax({
		            url : "getroom.do",
		            type: "get",
		            data : { "theater" : $(this).attr('value')},
		            success : function(data){
		                if(data){
		                	$('input[name="theater"]').val($(val).attr("value"));
		                	$('.theater_room').html("");
		                	$.each( data, function( key, value ) {
		                		  $('.theater_room').append("<a onclick='setRoom()' href='#'>"+value+"</a>");
		                		});
		                }//if
		            }//success
		        });//ajax
		});//click
		//
				
		$(".seat_gap").each(function () { 
		  $(this).css("width",$(this).attr("gap_data"));
		  console.log($(this).attr("gap_data"));
		});
		
		//���� �ʱ�ȭ�� ����
		$('.watching_number a').click(function(){
		  $(".watching_number>a").css("background-color", "white");
		  $("span").removeClass("no_active");
		  $("span").addClass("active");
		  $("input[name='seat']").val("");
		  $("input[name='nownum']").val(0);
		  $(this).css("background-color", "#227799");
		  $("input[name='howmany']").val($(this).attr("value"));
		});

		 //�¼������
		for(var i=0;i<10;i++){
		  $(".select_bar").append('<div class="row" row_num='+i+'>');
		 	 for(var j=0;j<10;j++){
		       if(i==0){
		         $("div[row_num="+i+"]").append('<a href="#" seat='+i+j+'><span class="no">'+j+'</span></a>');
		       }
		       else{
		  		$("div[row_num="+i+"]").append('<a href="#" seat='+i+j+'><span class="no">'+i+j+'</span></a>');
			}
		  $(".select_bar").append('</div>');
		       }
		}
		//�������ο�, �����ο� ǥ�ù� Ŭ�����߰�
		$('.row a').click(function(){
		  if(parseInt($("input[name='nownum']").val())<parseInt($("input[name='howmany']").val())&&!$(this).find("span").hasClass("no_active")){
		   $("input[name='seat']").val($("input[name='seat']").val()+$(this).attr("seat")+',');
		   $(this).find("span").removeClass("active").addClass("no_active");
		   $("input[name='nownum']").val(parseInt($("input[name='nownum']").val())+1);
		    }
		});
		
});