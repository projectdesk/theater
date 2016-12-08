$(document)
		.ready(
				function() {
				// �뵒�뤃�듃�씠踰ㅽ듃 �젣嫄�
				$('input[type="submit"]').click(function(){return false;});
				// �뤌媛� 寃��궗
				$('input[type="submit"]').click(function(){
					if($('input[name="time_no"]').val()==""||$('input[name="howmany"]').val()==0||$('input[name="howmany"]').val()==null){
						alert("상영시간을 선택해주세요");
						return;
					}
					if($('input[name="seat"]').val()==""||$('input[name="seat"]').val()==0||$('input[name="seat"]').val()==null){
						alert("좌석을 선택해주세요.");
						return;
					}
					
					if($('input[name="nownum"]').val()==""||$('input[name="nownum"]').val()==0||$('input[name="nownum"]').val()==null||$('input[name="nownum"]').val()<$('input[name="howmany"]').val()){
						alert("인원수만큼 좌석을 선택해주세요..");
						return;
					}
					if($('input[name="user_confirm"]').val()==""){
						location.href="login.do";
						return;
					}						
					$('form[name="reservation"]').submit();
					
				;});
				$('section').on('click','a',function(){return false;})
				function getDate(theater,movie){
					$.ajax({
						url : "getdate.do",
						type : "get",
						data : {
							"theater" : $(theater).attr('value'),
							"movie" : $(movie).attr('value')
						},success : function(data){
							$('.movie_date').html("<div class='title'>날짜</div>");
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
				
				//�쁺�솕愿� �꽑�깮
					$(".theater").on('click','a',
							function() {
								var val=this;// �씠踰ㅽ듃 媛앹껜 �쑀吏�v
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
					// �쁺�솕 �꽑�깮
					$('.movie').on('click','a',function(){
						val=this;// �씠踰ㅽ듃媛앹껜�쑀吏�
							$.ajax({
								url : "gettheater.do",
								type : "get",
								data : {
								"movie" : $(val).attr('value')
							}, success : function(data){
								if(!$('.theater a').hasClass('selected')){
								$('.movie a').removeClass("selected");
								$('.movie_date a').removeClass("selected");
								$('.movie_time a').removeClass("selected");
								$(val).addClass("selected");
								$('.theater').html("<div class='title'>영화관</div>");
								$.each(data,function(key,value){
										$('.theater').append("<a value="+value+" href='#'>"+value+"</a>");
								});
								
							
							    }else{
							    	$('.movie_date a').removeClass("selected");
									$('.movie_time a').removeClass("selected");
							    	$('.movie a').removeClass("selected");
									$(val).addClass("selected");
									getDate($('.theater a[class="selected"]'),$('.movie a[class="selected"]'));
							    }//both selected
							}// success
							});// ajax


					});
					
					
					// 愿��꽑�깮
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
									$('.movie_date').html("<div class='title'>날짜</div>");
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
					
					// �긽�쁺�궇吏� �꽑�깮
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
									$('.movie_time').html("<div class='title'>시간</div>");
										$.each(data,function(index,value){
											$.each(value,function(index,value){
												if(index=='no')
													no=value;
												if(index=='room')
													room=value;
												if(index=='time')
													time=value;
												if(index=='max')
													max=value;
												if(index=='remain')
													remain=value;
												if(index=='room')
												$('.movie_time').append('<a no='+no+' href="#">'+time+' ('+value+')<br>('+remain+'/'+max+')</a>');
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
										$('input[name=time_no]').val($(val).attr('no'));
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

					// 醫뚯꽍�꽑�깮
					$('.watching_number a').click(
							function() {
								$(".watching_number>a").removeAttr("style");
								$("span").removeClass("no_active");
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
					
						
					
							
					// 占쏙옙占쏙옙占쏙옙占싸울옙, 占쏙옙占쏙옙占싸울옙 표占시뱄옙 클占쏙옙占쏙옙占쌩곤옙
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