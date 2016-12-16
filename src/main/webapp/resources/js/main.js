$(document).ready(function() {

	var url = $('.video_wrap iframe').attr('src');

	$('.bxslider').bxSlider({
		mode : 'fade',
		captions : true
	});
	$('#video_play').click(function() {
		$('.overlay').css({
			"display" : "block",
			"width" : window.innerWidth,
			"height" : window.outerHeight
		});
		$('.video_wrap').css("display", "block");
		$('.video_wrap iframe').attr('src', url);
		// $('#movie_video').playVideo();
		return false;
	});
	$('.overlay').click(function() {
		$('.overlay').removeAttr("style");
		$('.video_wrap').removeAttr("style");
		$('.video_wrap iframe').removeAttr('src');
		// $('#movie_video').pauseVideo();
		return false;
	});

});