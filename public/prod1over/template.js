// mouseout pop
var timerId = setTimeout(function poptime() {
	$(function() {
	  $('.screenLock').css({height : $(document).height() + "px"});
		$('a.order-btn').click(function() {
			$(this).closest('form').submit();
			return false;
		});
		$('.close').click(function(){
		  $('.screenLock').fadeOut(300);
		})
	var flag = true;
	$(window).mouseout(function(e){
	  if(e.pageY - $(window).scrollTop() < 1 && flag == true){
		$('.screenLock').fadeIn(300);
		flag = false;
	  }
	}) 
	});
	timerId = setTimeout(poptime, 30000);
}, 300);


var timerId = setTimeout(function footsale() {
function firstshow() {
  $('.ftrsale').fadeIn(300);
}
setTimeout(firstshow, 10000);
	timerId = setTimeout(footsale, 20000);
}, 300);

$(function() {
	$('.cls').click(function(){
	  $('.ftrsale').fadeOut(300);
	})
});

$(function() {
	$('.popbutton').click(function(){
	  $('.screenLock').fadeOut(100);
	})
});

$(function() {
	$('.popbutton').click(function(){
	  $('.ftrsale').fadeOut(100);
	})
});
