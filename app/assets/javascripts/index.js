
function figureBody(){
	windowH = $(window).height();
	windowW = $(window).width();
	$("body").height(windowH);
	$("body,#mainIndex,#mainLeft,#mainRight").width(windowW);
	$("#mainContent").width(windowW*3).css({"left":-windowW});
	$("#mainRegister").css({"left":windowW/2});
}

$(window).resize(function(){
	figureBody();
});

$(window).load(function(){
	figureBody();
	$(".notice").delay(3000).hide(0); //hide(0)和hide()不一样，hide有参数 delay才有效
});

$(function(){
	$("#leftSlide").click(function(){
		$("#mainContent").animate({"left":0},800);
	});
	$("#rightSlide").click(function(){
		$("#mainContent").animate({"left":-windowW*2},800);
	});
	$("#register").click(function(){
		$("#mainRegister").show(0).css({"z-index":"99"}).animate({"width":windowW,"left":0},800);
	});

    $("#leftSlide").hover(function(){
        $(this).stop(true,false).animate({left:0},500);
    },function(){
        $(this).stop(true,false).animate({left:"-30px"},500);
    });
    $("#rightSlide").hover(function(){
        $(this).stop(true,false).animate({right:0},500);
    },function(){
        $(this).stop(true,false).animate({right:"-30px"},500);
    });
});