// 表格mouse over特效
$(document).ready(function() {
	$(".msc-table tbody tr").mouseover(function() {
		$(this).addClass("over");
	}).mouseout(function() {
		$(this).removeClass("over");
	});
		// $(".msc-table tbody tr:even").addClass("alt");
});

//打开窗体
function openColorBox(url,width,height){
	if (url != null) {
		if (url.indexOf("?")>-1){
			url+='&';
		}else{
			url+='?';
		}
		url+="t="+new Date().getTime();
		
		$.colorbox({
			href : url,
			innerWidth : width + "px",
			innerHeight : height + "px",
			iframe:true,
			opacity:0.75,
			open:true
		});
	}
}

//打开窗体
function openWin(url,width,height){
	if (url.indexOf("?")>-1){
		url+='&';
	}else{
		url+='?';
	}
	url+="t="+new Date().getTime();
	var iTop = (window.screen.availHeight-30-height)/2;       //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-width)/2;           //获得窗口的水平位置;
	var winOption = "height="+height+",width="+width+",top=" + iTop + ",left=" + iLeft + ",alwaysRaised=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0";
	window.open(url,'newWindow', winOption);
}

//删除信息。
function confirmIt(url,info){
	if(confirm(info)){
		$.ajax({url:url,success:function(msg){
			msg  = $.trim(msg);
			if (msg.length>0){
				alert(msg);
			}
			$("#pageForm").submit();
		}});
	}
	return false;
}

// 翻页
function go2page(pageNo) {
	if (pageNo == null)
		pageNo = $('#editPageNo').val();
	var pageNo=parseInt(pageNo);
	var pageCount =parseInt($('#pageCount').val()); 
	if(pageNo>pageCount){
		alert("超出了查询的最大页数！");
		$('#editPageNo').val($('#pageCount').val());
		pageNo=$('#pageCount').val();
	}
	$('#pageNo').val(pageNo);
	$('#pageForm').submit();
}

// 全选
function checkAll() {
	var obj = event.srcElement || event.target;
	var chkArr = document.getElementsByName("id");
	for ( var i = 0; i < chkArr.length; i++) {
		if (obj.checked) {
			chkArr[i].checked = true;
		} else {
			chkArr[i].checked = false;
		}
	}
}
// 反选
function reverseAll() {
	var obj = event.srcElement || event.target;
	var chkArr = document.getElementsByName("id");
	for ( var i = 0; i < chkArr.length; i++) {
		if (chkArr[i].checked) {
			chkArr[i].checked = false;
		} else {
			chkArr[i].checked = true;
		}
	}
}
// copy到剪贴板
function copy(copyText) {
	if (window.clipboardData) {
		window.clipboardData.setData("Text", copyText)
	} else {
		var flashcopier = 'flashcopier';
		if (!document.getElementById(flashcopier)) {
			var divholder = document.createElement('div');
			divholder.id = flashcopier;
			document.body.appendChild(divholder);
		}
		document.getElementById(flashcopier).innerHTML = '';
		var divinfo = '<embed src="/images/_clipboard.swf" FlashVars="clipboard=' + encodeURIComponent(copyText) + '" width="0" height="0" type="application/x-shockwave-flash"></embed>';
		document.getElementById(flashcopier).innerHTML = divinfo;
	}
}
