<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.User" %>
<%@ page import="com.db.UserDao" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��������̨����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function select(){
		document.search.submit();
	}
	function ckbSelect(sta,flg){
		for(var i=0;i<document.getElementsByName(flag).length;i++){
			document.getElementsByName(flag)[i].checked = sta;
		}
	}
	function addIt(){
		window.location.href = "addUser.html";
	}
</script>
</head>
<body>

<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>�û�һ��</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchUserServlet">
			<table>
				<tr>
					<td>&nbsp;ͼ������</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">��ѯ</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>�û���Ϣ�б�</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">�����û�</button>
					<button onClick="deleteIt()">ɾ��</button>
					<button onClick="editIt()">�޸��û���Ϣ</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onclick=ckbSelect(this.checked,'userId')"></th>
							<th><span>���</span></th>
							<th><span>�û���</span></th>
							<th><span>����</span></th>
							<th><span>�û����</span></th>
							<th><span>ע��ʱ��</span></th>
							<th><span>��½����</span></th>
						</tr>
					</thead>
					<tbody>
						<%
							if(request.getAttribute("userList")==null){
								ServletContext ctx = this.getServletContext();
								String server = ctx.getInitParameter("server");//��ȡ��������ַ
								String dbname = ctx.getInitParameter("dbname");//��ȡ���ݿ���
								String user = ctx.getInitParameter("user");//��ȡ���ݿ��¼��
								String pwd = ctx.getInitParameter("pwd");//��ȡ���ݿ�����
								UserDao dao = new UserDao();
							}
						%>
					
						<!-- ʹ��JSP�ű�ѭ����ʾ -->
						<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>
							<input type="checkbox" name="userId" value="${book.isbn }" calss="input_radio">
							</td>
							<td>${status.count}</td>
							<td>${book.bookName }</td>
							<td>
								<c:choose>
									<c:when test="${book.publisherID==1 }">
									���������</c:when>
									<c:when test="${book.publisherID==2 }">
									�廪��ѧ������</c:when>
									<c:when test="${book.publisherID==3 }">
									���ӹ�ҵ������</c:when>
								</c:choose>
							</td>
							<td>${book.isbn}</td>
							<td>${book.price}</td>
							<td>${book.count}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>