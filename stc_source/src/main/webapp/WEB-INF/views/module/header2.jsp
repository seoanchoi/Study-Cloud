<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
        <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="index.html"><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/logo.png" alt=""></a> --%>
                	<a class="navbar-brand" href="<%=request.getContextPath() %>/">Study Cloud</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
                    <div class="button navbar-right">
                    	<sec:authorize access="isAnonymous()">
	                    	<form:form action="${pageContext.request.contextPath}/login" method="GET">
					    		<button class="navbar-btn nav-button login" onclick=" submit(); ">로그인</button>
							</form:form>
							<form:form action="${pageContext.request.contextPath}/jointerms" method="GET">
					    		<button class="navbar-btn nav-button" onclick=" submit(); ">회원가입</button>
							</form:form>		                        
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ADMIN')">
							<form:form action="${pageContext.request.contextPath}/logout" method="POST">
								<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
							</form:form>
							<form:form action="${pageContext.request.contextPath}/admin?memId=${member.memId }" method="GET">
					    		<button class="navbar-btn nav-button" onclick=" submit(); ">관리자관리</button>
							</form:form>
						</sec:authorize>			
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('HOST')">
							<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						    	<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
					    	</form:form>
							<form:form action="${pageContext.request.contextPath}/host" method="GET">
					    		<button class="navbar-btn nav-button" onclick=" submit(); ">마이페이지</button>
							</form:form>
						</sec:authorize>			
						</sec:authorize> 
						<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('USER')">
							<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						    	<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
					    	</form:form>
							<form:form action="${pageContext.request.contextPath}/user" method="GET">
					    		<button class="navbar-btn nav-button" onclick=" submit(); ">마이페이지</button>
							</form:form>
						</sec:authorize>			
						</sec:authorize>                      
                    </div>
                    <sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('ADMIN')">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li><a class="" href="<%=request.getContextPath() %>/admin/user">일반회원 관리</a></li>
						<li><a class="" href="<%=request.getContextPath() %>/admin/host">호스트 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/admin/product">공간 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/admin/chat">채팅 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/notice">notice 관리</a></li>
                    </ul>
                    </sec:authorize>			
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('HOST')">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li><a class="" href="<%=request.getContextPath() %>/host/info">내 정보</a></li>
						<li><a class="" href="<%=request.getContextPath() %>/host/product">공간 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/host/reserve">예약 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/host/review">리뷰 관리</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/host/qna">Q&A 관리</a></li>
                    </ul>
                    </sec:authorize>			
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('USER')">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li><a class="" href="<%=request.getContextPath() %>/user/info">내 정보</a></li>
						<li><a class="" href="<%=request.getContextPath() %>/user/reserve">내 예약</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/user/review">내 리뷰</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/user/qna">내 Q&A</a></li>
                        <li><a class="" href="<%=request.getContextPath() %>/user/chat">내 채팅</a></li>
                    </ul>
                    </sec:authorize>			
					</sec:authorize>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->
</header>
