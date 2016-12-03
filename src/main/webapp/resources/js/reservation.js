$(document)
		.ready(
				function() {
				// 디폴트이벤트 제거
				$('input[type="submit"]').click(function(){return false;});
				// 폼값 검사
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
					$(".theater").on('click','a',
							function() {
								var val=this;// 이벤트 객체 유지
								var room_name;
								var idx;
								var date;
								var theater_room_idx;
								var movie_name;
								$.ajax({
									url : "getmovie.do",
									type : "get",
									data : {
										"theater" : $(this).attr('value')
									},
								success : function(data) {
									if (data) {
											$(val).addClass("selected");
											$('input[name="theater"]').val(
											$(val).attr("value"));
											$('.movie').html("<div>영화</div>");
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
												});// bean
											});// list
										
										}// if
									
													
										
									}// success
								});// ajax
							});// click
					// 영화 선택
					$('.movie').on('click','a',function(){
						val=this;// 이벤트객체유지
						$('input[name="viewing_id"]').val($(this).attr("viewing_id"));
							$.ajax({
								url : "getroom.do",
								type : "get",
								data : {
								"idx" : $(val).attr('idx'),
								"movie" : $(val).attr('movie')
							}, success : function(data){
								$(val).addClass("selected");
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
								
							

							}// success
							});// ajax


					});
					
					
					// 관선택
					$('.theater_room').on('click','a',
							function(){
								val=this;												
								$('input[name="room"]').val($(this).text());
								$('input[name="room_idx"]').val($(this).attr("room_idx"));
								$.ajax({
									url : "gettime.do",
									type : "get",
									data : {
									"idx" : $(val).attr('theater_room_idx'),
									"movie" :$('.movie a[class="selected"]').text()
									}, success : function(data){
									$(val).addClass("selected");
									$('.movie_date').html("<div>상영시간</div>");
									$.each(data,function(index,value){
										$.each(value,function(index,value){
											if(index=='idx')
												idx=value;
											if(index=='date')
												date=value;
											if(index=='time')
											$('.movie_date').append("<a idx="+idx+" time="+value+" href='#'>"+value+"</a>");
										});
									});
																											
									}// success
								});
							});// .theater_room>a click
					
					// 상영시간 선택
					$('.movie_date').on('click','a',
							function(){
								val=this;												
// $('input[name="room"]').val($(this).text());
// $('input[name="room_idx"]').val($(this).attr("room_idx"));
								$.ajax({
									url : "getseat.do",
									type : "get",
									data : {
									"idx" : $(val).attr('idx'),
									}, success : function(data){
									$(val).addClass("selected");
// $.each(data,function(index,value){
										$.each(data,function(index,value){
											$('.select_bar .row a[seat='+value+'] span').addClass('allready').parent().removeAttr('href');
												
											});
// });
																											
									}// success
								});
							});// .theater_room>a click
					
					
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
														.hasClass("no_active")&& !$(this).find("span")
														.hasClass("allready")) {
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