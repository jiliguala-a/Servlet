<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>color</title>
</head>
<body>
<%--声明两个颜色的全局变量 --%>
<%!
	private String color1 = "EFBEBEB";
	private String color2 = "F8F8F8";
%>

<!-- 表格 -->>
<table border='1' align='center'>
<% 
	for(int i=11;i<16;i++){
		String color = "";
		if(i%2==0){
			color=color1;
		}else{
			color=color2;
		}
%>	
<tr bgcolor="<%=color%>">
<td>
姓名<%=i%>
</td>
<td>
<%=i%>
</td>
</tr>
<%
}	//此右括号对应上方for，可见JSP的代码可以分段，在函数中添加html
%>
</table>

</body>
</html>