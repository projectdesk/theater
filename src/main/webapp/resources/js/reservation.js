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
				
				function getDate(theater,movie){
					$.ajax({
						url : "getdate.do",
						type : "get",
						data : {
							"theater" : $(theater).attr('value'),
							"movie" : $(movie).attr('value')
						},success : function(data){
							$('.movie_date').html("<div class='title'>상영시간</div>");
							$.each(data,function(index,value){
								$.each(value,function(index,val){
									if(index=='no')
										no=val;
									if(index=='mdate'){
									$('.movie_date').append('<a no='+no+' href="#">'+val+'</a>');
									}
							});
							});
						}
					});//ajax
				}
				
				//영화관 선택
					$(".theater").on('click','a',
							function() {
								var val=this;// 이벤트 객체 유지v
								var no;
								$.ajax({
									url : "getmovie.do",
									type : "get",
									data : {
										"theater" : $(this).attr('value')
									},
								success : function(data) {
									if (data) {
											if(!$('.movie a').hasClass('selected')||($('.movie a').hasClass('selected')&&$('.theater a').hasClass('selected'))){
												$('.theater a').removeClass("selected");
												$(val).addClass("selected");
												$('.movie').html("<div class='title'>영화</div>");
												$('.movie_date').html("<div class='title'>날짜</div>");
												$('.movie_time').html("<div class='title'>시간</div>");
												$.each(data,function(key,value){
													$.each(value,function(key,value){
														if(key=="no"){
															no=value;
														}
														if(key=="name"){
														$('.movie').append(
																	"<a no="+no+" value="+value+" href='#'>"
																	+ value
																	+ "</a>");
														}
													});// bean
												});// list
											}//if(!$('.movie a').hasClass('selected'))
											else{
												$('.theater a').removeClass("selected");
												$(val).addClass("selected");
												getDate($('.theater a[class="selected"]'),$('.movie a[class="selected"]'));
											}//both selected
										}// if(date)
									
													
										
									}// success
								});// ajax
							});// click
					// 영화 선택
					$('.movie').on('click','a',function(){
						val=this;// 이벤트객체유지
							$.ajax({
								url : "gettheater.do",
								type : "get",
								data : {
								"movie" : $(val).attr('value')
							}, success : function(data){
								if(!$('.theater a').hasClass('selected')){
								$('.movie a').removeClass("selected");
								$(val).addClass("selected");
								$('.theater').html("<div class='title'>영화관</div>");
								$.each(data,function(key,value){
										$('.theater').append("<a value="+value+" href='#'>"+value+"</a>");
								});
								
							
							    }else{
							    	$('.movie a').removeClass("selected");
									$(val).addClass("selected");
									getDate($('.theater a[class="selected"]'),$('.movie a[class="selected"]'));
							    }//both selected
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
									$('.movie_date').html("<div class='title'>상영시간</div>");
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
					
					// 상영날짜 선택
					$('.movie_date').on('click','a',
							function(){
								val=this;												
								$.ajax({
									url : "gettime.do",
									type : "get",
									data : {
									"no" : $(val).attr('no'),
									}, success : function(data){
									$('.movie_date a').removeClass("selected");
									$(val).addClass("selected");
									$('.movie_time').html("<div class='title'>상영시간</div>");
										$.each(data,function(index,value){
											$.each(value,function(index,value){
												if(index=='no')
													no=value;
												if(index=='room')
													room=value;
												if(index=='time')
													time=value
												if(index=='room')
												$('.movie_time').append('<a no='+no+' href="#">'+time+' ('+value+')</a>');
											});															
									});
								}// success
								});
							});// .movie_date>a click
					
					$('.movie_time').on('click','a',
							function(){
								val=this;												
								$.ajax({
									url : "getseat.do",
									type : "get",
									data : {
									"no" : $(val).attr('no'),
									}, success : function(data){
									$(val).addClass("selected");
										$.each(data,function(index,value){
											$('.row a[seat='+value+'] span').addClass('allready');
									});
								}// success
								});
							});// .movie_time>a click
					
					
					
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
					
					var a=['A','B','C','D','E','F','G','H','I','J'];
					for ( var i = 0; i < 10; i++) {
						$(".seat_container").append(
								'<div class="row" row_num=' + i + '><span class="title">'+a[i]+'</span>');
						for ( var j = 1; j < 11; j++) {
							if (i == 0) {
								$("div[row_num=" + i + "]").append(
										'<a href="#" seat=' + j
												+ '><span class="no">' + j
												+ '</span></a>');
							} else {
								$("div[row_num=" + i + "]").append(
										'<a href="#" seat=' + i + j
												+ '><span class="no">' + j
												+ '</span></a>');
							}
							$(".seat_container").append('</div>');
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