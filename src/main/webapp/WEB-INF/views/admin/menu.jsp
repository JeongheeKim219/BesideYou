<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.app-sidebar {
	
	flex: 0 0 210px;
	
}



</style>
</head>
<body>
<div class="app-sidebar sidebar-shadow bg-midnight-bloom sidebar-text-light">
	<div class="app-header__logo">
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="scrollbar-sidebar">
		<div class="app-sidebar__inner p-3">
			<ul class="vertical-nav-menu">
				<li class="app-sidebar__heading">������ �޴�</li>
				<li><a href="${pageContext.request.contextPath}/admin/index" class="mm-active"> 
				<i class="metismenu-icon fa fa-cog icon-gradient bg-deep-blue fa-lg"> </i> �뽬����
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/memberView"> <i
						class="metismenu-icon pe-7s-users"></i>ȸ������ <i
						class="metismenu-state-icon pe-7s-users-down caret-left"></i>
				</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/memberView"> <i
								class="metismenu-icon"> </i> ��üȸ����ȸ
						</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/viewCounselorState">�������<i
								class="metismenu-icon"> </i>
						</a></li>
						
					</ul></li>
				<li><a href="#"> <i class="metismenu-icon pe-7s-car"></i>
						�������<i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
				</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/ticketView"> <i
								class="metismenu-icon"> </i>��ü�������
						</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/viewTicketLines"> <i
								class="metismenu-icon"> </i>���ǻ�볻��
						</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/admin/contactView"> <i
						class="metismenu-icon pe-7s-display2"></i> ���ǰ���
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/reportView"> <i
						class="metismenu-icon pe-7s-display2"></i> �Ű����
				</a></li>

			</ul>
		</div>
	</div>
</div>
</body>
</html>