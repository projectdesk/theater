$(document)
		.ready(
				function() {
				//디폴트이벤트 제거
				$('input[type="submit"]').click(function(){return false;});
				//폼값 검사
				$('input[type="submit"]').click(function(){
					if($('input[name="theater"]').val()==""||$('input[name="theater"]').val()==0||$('input[name="theater"]').val()==null){
						alert("영화관을 선택하세요");
						return;
					}
					if($('input[name="room"]').val()==""||$('input[name="room"]').val()==0||$('input[name="room"]').val()==null){
						alert("상영관을 선택하세요");
						return;
					}
					if($('input[name="viewing_id"]').val()==""||$('input[name="viewing_id"]').val()==0||$('input[name="viewing_id"]').val()==null){
						alert("영화을 선택하세요");
						return;
					}
					if($('input[name="howmany"]').val()==""||$('input[name="howmany"]').val()==0||$('input[name="howmany"]').val()==null){
						alert("인원을 선택하세요");
						return;
					}
					if($('input[name="seat"]').val()==""||$('input[name="seat"]').val()==0||$('input[name="seat"]').val()==null){
						alert("좌석을 선택하세요");
						return;
					}
					
					if($('input[name="nownum"]').val()==""||$('input[name="nownum"]').val()==0||$('input[name="nownum"]').val()==null||$('input[name="nownum"]').val()<$('input[name="howmany"]').val()){
						alert("선택숫자가 부족합니다.");
						return;
					}
					if($('input[name="room_idx"]').val()==""||$('input[name="room_idx"]').val()==0||$('input[name="room_idx"]').val()==null){
						alert("상영관을 선택하세요");
						return;
					}
					$('form[name="reservation"]').submit();
					
				;});
					$(".theater>a").click(
							function() {
								var val=this;//이벤트 객체 유지
								var room_name;
								var idx;
								var theater_room_idx;
								var movie_name='����';
								$.ajax({
									url : "getmovie.do",
									type : "get",
									data : {
										"theater" : $(this).attr('value')
									},
								success : function(data) {
									if (data) {
											$('input[name="theater"]').val(
											$(val).attr("value"));
											$('.movie').html("<div>영화<div>");
											$.each(data,function(key,value){
												$.each(value,function(key,value){
													if(key=="idx"){
														idx=value;
													}
													if(key=="movie"){
													$('.movie').append(
																"<a movie="+value+" idx="+idx+" href='#'>"
																+ value
																+ "</a>");
													}
												});//bean
											});//list
										
										}// if
									
													$('.movie > a').click(function(){
																val=this;//이벤트객체유지
																$('input[name="viewing_id"]').val($(this).attr("viewing_id"));
																	$.ajax({
																		url : "getroom.do",
																		type : "get",
																		data : {
																		"idx" : $(val).attr('idx'),
																		"movie" : $(val).attr('movie')
																	}, success : function(data){
																		$('.theater_room').html("<div>상영관</div>");
																		$.each(data,function(key,value){
																			$.each(value,function(key,value){
																			if(key=='theater_room_idx'){
																				theater_room_idx=value;}
																			if(key=='room_name'){
																				room_name=value;
																				$('.theater_room').append("<a theater_room_idx='"+theater_room_idx+"' href='#'>"+value+"</a>");
																			}
																			});
																		});
																	}
																	});


															});
										$('.theater_room a').click(
												function(){
													val=this;												
													$('input[name="room"]').val($(this).text());
													$('input[name="room_idx"]').val($(this).attr("room_idx"));
													$.ajax({
														url : "getmovie.do",
														type : "get",
														data : {
														"room_idx" : $(val).attr('room_idx')
														}, success : function(data){
														if(data==""){
															alert("no movie");
														}
														else{
															$.each(data,function(index,value){
																$('.movie').html("<div>영화</did>");
																$.each(value,function(index,value){
																	if(index=="viewing_id")
																	viewing_id=value;
																	if(index=="room_idx")
																	room_idx=value;
																	if(index=="movie_name"){
																	movie_name=value;
																	$('.movie').append("<a viewing_id="+viewing_id+" href='#'>"+movie_name+"</a>");
																	}
																});
															});
												
														}
														}//success
													});
												});//.theater_room>a click
									}// success
								});// ajax
							});// click
					//

					$(".seat_gap").each(function() {
						$(this).css("width", $(this).attr("gap_data"));
						console.log($(this).attr("gap_data"));
					});

					// 좌석선택
					$('.watching_number a').click(
							function() {
								$(".watching_number>a").css("background-color",
										"white");
								$("span").removeClass("no_active");
								$("span").addClass("active");
								$("input[name='seat']").val("");
								$("input[name='nownum']").val(0);
								$(this).css("background-color", "#227799");
								$("input[name='howmany']").val(
										$(this).attr("value"));
								false;
							});
					
							

					// �¼������
					for ( var i = 0; i < 10; i++) {
						$(".select_bar").append(
								'<div class="row" row_num=' + i + '>');
						for ( var j = 0; j < 10; j++) {
							if (i == 0) {
								$("div[row_num=" + i + "]").append(
										'<a href="#" seat=' + i + j
												+ '><span class="no">' + j
												+ '</span></a>');
							} else {
								$("div[row_num=" + i + "]").append(
										'<a href="#" seat=' + i + j
												+ '><span class="no">' + i + j
												+ '</span></a>');
							}
							$(".select_bar").append('</div>');
						}
					}
					
						
					
							
					// �������ο�, �����ο� ǥ�ù� Ŭ�����߰�
					$('.row a')
							.click(
									function() {
										if (parseInt($("input[name='nownum']")
												.val()) < parseInt($(
												"input[name='howmany']").val())
												&& !$(this).find("span")
														.hasClass("no_active")) {
											$("input[name='seat']").val(
													$("input[name='seat']")
															.val()
															+ $(this).attr(
																	"seat")
															+ ',');
											$(this).find("span").removeClass(
													"active").addClass(
													"no_active");
											$("input[name='nownum']")
													.val(
															parseInt($(
																	"input[name='nownum']")
																	.val()) + 1);
										}
										return false;
									});

				});