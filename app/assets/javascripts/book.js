$(function () {
    var picData = [
		{ left: 0, "z-index": 2, opacity: 0.3 },
		{ left: 40, "z-index": 3, opacity: 0.6 },
		{ left: 124, "z-index": 4, opacity: 1 },
		{ left: 208, "z-index": 3, opacity: 0.6 },
		{ left: 246, "z-index": 2, opacity: 0.3 },
		{ left: 40, "z-index": 0, opacity: 0 }
	];

    var imgs = $("#showBooks").find(".area");
    var len = imgs.length;
    // initialize
    var showLen = picData.length;
    var total = "";
    for (var i = 0; i < len; i++) {
        total += "<span></span>"
    }
    $("#BooksController").html(total);
    var controllers = $("#BooksController").find("span");
    imgs.each(function (i) {
        if (i < showLen - 1) {
            $(this).css(picData[i]);
        }
        else {
            $(this).css(picData[showLen - 1]);
        }
    });


    function show(index) {
        imgs.eq(index).animate(picData[2], 500);
        imgs.eq(index - 1).animate(picData[1], 500);
        imgs.eq(index - 2).animate(picData[0], 500);
        imgs.eq((index + 1) % 8).animate(picData[3], 500);
        imgs.eq((index + 2) % 8).animate(picData[4], 500);
        imgs.eq(index - 3).animate(picData[5], 500);
        imgs.eq(index - 4).animate(picData[5], 500);
        imgs.eq(index - 5).animate(picData[5], 500);
    }
    imgs.click(function () {
        var index = $(this).index();
        controllers.eq(index).click();
    });
    controllers.click(function () {
        var index = $(this).index();
        $(this).addClass("selected").siblings().removeClass("selected");
        show(index);
    }).eq(0).click();



    $("#addCommentButton").toggle(function () {
        $(this).siblings(".hideForm").slideDown(700).end().delay(700).text("收起");
    }, function () {
        $(this).siblings(".hideForm").slideUp(700).end().delay(700).text("发表评论");
    });

    (function () {
        var h = [];
        var j = $("#waterFull").find("li");
        var boxWidth = j.first().width();
        var n = parseInt($("#waterFull").width() / boxWidth);
        var k = j.length;
        for (var i = 0; i < k; i++) {
            height = Math.floor(Math.random() * 200 + 140); //Math.floor 返回小于或等于它的最大整数
            j.eq(i).find(".boxContent").height(height);
        };

        for (var z = 0; z < k; z++) {
            boxh = j.eq(z).height();
            if (z < n) {
                h[z] = boxh;
                j.eq(z).css({ position: "" });
            }
            else {
                minH = Math.min.apply({}, h); //第一次执行到这里时，h也只有里面n个元素
                minKey = getarraykey(h, minH);
                h[minKey] += boxh //对应最小的那个盒子的高度加上自己的高度
                j.eq(z).css({ "position": "absolute", "top": minH, "left": minKey * boxWidth });
            }
        }
		figureH =  function(){
		maxH = Math.max.apply({},h);
		maxKey = getarraykey(h,maxH);
		$("#waterFull").height(h[maxKey]);
		}
		
		figureH();

        function getarraykey(s, v) {
            for (tag in s) {
                if (s[tag] == v) {
                    return tag;
                }
            }
        };
		
		function reSort(){
			var ajaxLoadEle = $("#waterFull").find(".ajaxLoad");
			var ajaxLen = ajaxLoadEle.length;
			for(var z= 0 ; z<ajaxLen ; z++){
				height = Math.floor(Math.random() * 200 + 140); //Math.floor 返回小于或等于它的最大整数
				ajaxLoadEle.eq(z).find(".boxContent").height(height);
			}
			
			for(var z= 0 ; z<ajaxLen ; z++){
				boxh = ajaxLoadEle.eq(z).height();
				minH = Math.min.apply({}, h);
				minKey = getarraykey(h, minH);
                h[minKey] += boxh //对应最小的那个盒子的高度加上自己的高度
                ajaxLoadEle.eq(z).css({ "position": "absolute", "top": minH, "left": minKey * boxWidth }).removeClass("ajaxLoad");
				figureH();
				
			}
			
			
		}
		
		$("#seeMoreBooks").click(function(){
			$.get("see_more_books" , function(data){
				$(data).find("li").appendTo("#waterFull ul");   //注意此处用find
				reSort();
				
			});
		});
		
    })()

    $("#evaluation").find(".myComment").hover(function () {
        $(this).css("background-color", "#f5f5f5").find(".commentHandle").show(0);
    }, function (
	) {
        $(this).css("background-color", "#fff").find(".commentHandle").hide(0);
    });

    $("#evaluation").find(".myComment").find(".ajaxEdit").click(function (e) {
        e.preventDefault();
        url = $(this).attr("href");
        $.get(url + "/edit", function (data) {
            $(data).filter("#EditComment").appendTo(".myComment"); 		//$(data)就已经把所有的节点给包起来了，所以用filter,因为它是body下的直接节点，如果不是就用find
            showEditCommentForm();
        });
    });

    function showEditCommentForm() {
        _this = $("#EditComment");
        var lastLeft = _this.offset().left;
        var left = lastLeft + _this.outerWidth();
        var height = _this.parents(".myComment").height()
        _this.css({ "left": -left, "height": height }).animate({ left: -lastLeft + 20 }, "slow");
        _this.find("textarea").height(height - 12);
    }
	
	
	(function() {
    var $backToTopTxt = "返回顶部", $backToTopEle = $('<div id="backToTop"></div>').appendTo($("body"))
        .text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 120);
    }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);
        }
    };
    $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
	})();
});