<!--#include file="Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY{
BACKGROUND-COLOR: #E1F4EE;
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>

<SCRIPT language=javascript>
function check() 
{
	var strFileName=document.form1.FileName.value;
	var FileType;
	var ImgWH;
	if (strFileName=="")
	{
    	alert("��ѡ��Ҫ�ϴ����ļ�");
		document.form1.FileName.focus();
    	return false;
  	}
  	else
  	{
		FileType=strFileName.substr(strFileName.length-3)
		FileType=FileType.toLowerCase();
		if(FileType=="jpg" || FileType=="bmp" || FileType=="gif" || FileType=="png" )
		{
			ImgWH=prompt("ͼƬ�Ŀ�,��,���뷽ʽ,�м���Ӣ�Ķ��Ÿ���.���뷽ʽ:1-�����,2-���ж���,3-�Ҷ���.����������ߵ�'ȡ��'��ť,��ʹ��ͼƬ��ʵ�ʴ�С��","300,200,2"); 
			if (ImgWH!=null)
			{
				var arr=ImgWH.split(",");
				document.form1.ImgWidth.value=arr[0];
				document.form1.ImgHeight.value=arr[1];
				document.form1.AlignType.value=arr[2];
			}
			else
			{
				document.form1.ImgWidth.value=0;
				document.form1.ImgHeight.value=0;
				document.form1.AlignType.value=0;
			}
		}
		else if(FileType=="swf")
		{
			ImgWH=prompt("������FLASH�ļ��Ŀ��Ⱥ͸߶ȣ��м���Ӣ�ĵĶ��Ÿ�����","500,350"); 
			if (ImgWH==null)
			{
				document.form1.ImgWidth.value=0;
				document.form1.ImgHeight.value=0;
				return false;
			}
			else
			{
				document.form1.ImgWidth.value=ImgWH.substr(0,ImgWH.indexOf(","));
				document.form1.ImgHeight.value=ImgWH.substr(ImgWH.indexOf(",")+1);
			}
		}
  	}
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0">
<%
if EnableUploadFile="Yes" and (session("AdminName")<>"" or request.Cookies("asp163")("UserName")<>"") then
%>
<form action="upfile_article.asp" method="post" name="form1" onSubmit="return check()" enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="20">
  <input type="submit" name="Submit" value="�ϴ�" style="border:1px double rgb(88,88,88);font:9pt">
  <input name="ImgWidth" type="hidden" id="ImgWidth">
  <input name="ImgHeight" type="hidden" id="ImgHeight">
  <input name="AlignType" type="hidden" id="AlignType">
</form>
<%
end if
%>
</body>
</html>