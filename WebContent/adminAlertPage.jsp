<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息提示</title>
</head>
<body>
	<div style="width: 1000px; height: 200px; margin-top: 100px;">
		<div id="dis" align="center" style="color: #FFCC66; font-size: 36px; font-style: normal; font-family: '宋体';">
			您没有登录，<label id="loadDynamic"></label>秒后自动跳转到登录页面
		</div>
	</div>
</body>
<script type="text/javascript">
	var secs = 3;
	for ( var i = 0; i < secs; i++) {
		window.setTimeout("update(" + i + ")", i * 1000);
	}
	setTimeout("togoto()", secs * 1000);
	//alert("gaga");
	function togoto() {
		//此处换成连接
		window.top.location.href = "/adminLogin.jsp";
		// alert("gaga");
	}
	function update(num) {
		var printnr = secs - num;
		document.getElementById("loadDynamic").innerHTML = "<font style='font-size:24px; color:#CC3300; font-weight:bold;'> "
				+ printnr + "&nbsp;</font>";
	}
</script>
</html>