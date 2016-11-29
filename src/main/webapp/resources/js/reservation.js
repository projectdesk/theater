$(document).ready(function(){
	// Write JavaScript here 
	$(".seat_gap").each(function (){
	  $(this).css("width",$(this).attr("gap_data"));
	  console.log($(this).attr("gap_data"));
	});

	$('a').click(function(){
	  $(".watching_number>a").css("background-color", "white");
	  $("span").removeClass("no_active");
	  $("span").addClass("active");
	  $("input[name='where']").val("");
	  $("input[name='nownum']").val(0);
	  $(this).css("background-color", "#227799");
	  $("input[name='howmany']").val($(this).attr("value"));
	});

	 
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
	$('.row a').click(function(){
	  if(parseInt($("input[name='nownum']").val())<parseInt($("input[name='howmany']").val())&&!$(this).find("span").hasClass("no_active")){
	   $("input[name='where']").val($("input[name='where']").val()+$(this).attr("seat")+',');
	   $(this).find("span").removeClass("active").addClass("no_active");
	   $("input[name='nownum']").val(parseInt($("input[name='nownum']").val())+1);
	    }
	});
});