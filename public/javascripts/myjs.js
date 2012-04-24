$(function(){
	$("#clickme").click(function(){
		$.getJSON("/test?limit=3",function(date){alert(date);}//,{limit:2},function(){
			//alert($(this).text());
		//}
		);
	});
	
//	 $("#clickme").load("feeds.php", {limit: 25}, function(){
//   alert("The last 25 entries in the feed have been loaded");
//   });
});