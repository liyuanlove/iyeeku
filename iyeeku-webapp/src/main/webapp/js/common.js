$(function(){

	$(".question.menu-drop").hover(function(){
		$(".question.menu-drop-down").css({display: 'block'});
	},function(){
		$(".question.menu-drop-down").css({display: 'none'});
	});


	$(".user-menu.menu-drop").hover(function(){
		$(".myspace.menu-drop-down").css({display: 'block'});
	},function(){
		$(".myspace.menu-drop-down").css({display: 'none'});
	});


	$(".question.menu-drop li").hover(function(){
		$(this).children().css({background:'#f4f4f4',color:'#46ad2e'});
	},function(){
		$(this).children().css({background:'#ffffff',color:'#111111'});
	});

	$(".user-menu.menu-drop li").hover(function(){
		$(this).children().css({background:'#f4f4f4',color:'#46ad2e'});
	},function(){
		$(this).children().css({background:'#ffffff',color:'#111111'});
	});

});
