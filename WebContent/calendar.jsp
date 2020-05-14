<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/dist/js/datepicker.min.js"></script>
<script src="/dist/js/i18n/datepicker.en.js"></script>
<style>
	.fun{
		display:none;
	}
</style>
<script>
	$(function(){
		$("#btn").click(function(){
			var myDatepicker = $('.fun').datepicker().data('datepicker');
			myDatepicker.clear();
		});
	});
</script>
</head>
<body>
	<input type='text' class="datepicker-here fun" data-position="right top" readonly/>
	<button id="btn">클릭</button>
	<ul>
		<li><button class="a" value=1>1</button></li>
		<li><button class="a" value=2>2</button></li>
		<li><button class="a" value=3>3</button></li>
	</ul>
</body>
</html>