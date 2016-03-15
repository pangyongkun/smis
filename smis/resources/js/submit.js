(function($) {
	$.fn.submit=function(DATA,URL,METHOD)
	{
		if (method == "post") {
			$.ajax({
				type : "post",
				url : URL,
				dataType : "json",
				data : jsonStr,
				contentType : "application/json",
				processData : false,
				cache : true,
				success : function(data) {
					return data;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("访问失败!重新访问!");
				}
			});
		}
	}
	
})(jQuery);