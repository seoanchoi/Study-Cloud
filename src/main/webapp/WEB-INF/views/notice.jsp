<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="../views/module/link.jsp" %>
</head>
<body>
<%@ include file="../views/module/header.jsp" %> 
          <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h2 class="page-title text-center" style="color: black;">
                        	공지사항
                        </h2>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
        

        <!-- property area -->
        <div class="content-area recent-property" style=" padding-bottom: 55px;">
            <div class="container">    

                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 page-title">
                        <!-- /.feature title -->
                        <div style="display: inline-flex;" class="pull-right">
                        <form action="notice" class="form-inline">
							<div class="form-group text-center">     
                            	<select id="basic" class="selectpicker show-tick form-control" title="-전체-" onchange="submit();">
									<option> -전체- </option>
									<c:forEach items="${noticeList }" var="notice"> 
									<option value="${notice.notiIdx }">${notice.notiIdx }</option>
									</c:forEach>
								</select>
							</div>                             
                        </form>
						<button class="btn search-btn pull-right" type="button" onclick=" location.href='search' ">등록</button>
						</div>
                    </div>
                </div>

                <div class="row row-feat"> 
                    <div class="col-md-12"> 
                        <div class="col-sm feat-list">
                        	<c:forEach items="${noticeList }" var="notice"> 
							<div class="panel-group">
							    <div class="panel panel-default">
							        <div class="panel-heading">
							             <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#${notice.notiNum }" >
							                <b>[${notice.notiIdx }]</b> ${notice.notiTitle }
							             </h4> 
							        </div>
							        <div id="${notice.notiNum }" class="panel-collapse collapse fqa-body">
							            <div class="panel-body">
							                <ol>
							                    ${notice.notiContents }    
							                </ol>
							                <div class="button notice-btn">
                                            	<sec:authorize access="isAuthenticated()">
												<sec:authorize access="hasRole('ADMIN')">
													<form:form action="${pageContext.request.contextPath}/search" method="POST">
														<button class="btn search-btn" type="button" onclick=" submit(); ">수정</button>
													</form:form>
													<form:form action="${pageContext.request.contextPath}/join" method="GET">
											    		<button class="btn search-btn" type="button" onclick=" submit(); ">삭제</button>
													</form:form>
												</sec:authorize>			
												</sec:authorize>
											</div> 
							            </div> 
							        </div>
							    </div>
							</div>
							</c:forEach>
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                         <h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa11" >
                                            Nostrud exercitation ullamco laboris 1 1
                                         </h4> 
                                    </div>
                                    <div id="fqa11" class="panel-collapse collapse fqa-body">
                                        <div class="panel-body">
                                            <ol>
                                                <li> Lorem ipsum dolor sit amet, consectetur adipisicing</li>
                                                <li> Lorem ipsum dolor sit amet, consectetur adipisicing</li>
                                                <li> Lorem ipsum dolor sit amet, consectetur adipisicing</li>
                                                <li> Lorem ipsum dolor sit amet, consectetur adipisicing</li>
                                                <li> Lorem ipsum dolor sit amet, consectetur adipisicing</li>                                           
                                            </ol>
                                            <div class="button notice-btn">
                                            	<sec:authorize access="isAuthenticated()">
												<sec:authorize access="hasRole('ADMIN')">
													<form:form action="${pageContext.request.contextPath}/search" method="POST">
														<button class="btn search-btn" type="button" onclick=" submit(); ">수정</button>
													</form:form>
													<form:form action="${pageContext.request.contextPath}/join" method="GET">
											    		<button class="btn search-btn" type="button" onclick=" submit(); ">삭제</button>
													</form:form>
												</sec:authorize>			
												</sec:authorize>
											<!-- 	<button class="btn search-btn" type="button" onclick=" location.href='search' ">수정</button>
												<button type="button" class="btn search-btn" data-bs-toggle="modal-content" data-bs-target="#exampleModal" data-bs-whatever="@mdo">modal</button>
													<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        <form>
													          <div class="mb-3">
													            <label for="recipient-name" class="col-form-label">Recipient:</label>
													            <input type="text" class="form-control" id="recipient-name">
													          </div>
													          <div class="mb-3">
													            <label for="message-text" class="col-form-label">Message:</label>
													            <textarea class="form-control" id="message-text"></textarea>
													          </div>
													        </form>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													        <button type="button" class="btn btn-primary">Send message</button>
													      </div>
													    </div>
													  </div>
													</div>
												<button class="btn search-btn" type="button" onclick=" location.href='search' ">삭제</button> -->
											</div> 
                                        </div> 
                                    </div>
                                </div>
                            </div>
		                    
                         </div>
                    </div>
                </div>
                
					<div class="col-md-12 clear"> 
                        <div class="text-center">
                            <div class="pagination">
                                <ul>
                                    <li><a href="#">Prev</a></li>
                                    <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="page">
										<li><a href="#">${page }</a></li>	
									</c:forEach>                                    
                                    <li><a href="#">Next</a></li>
                                </ul>
                            </div>
                        </div>                
                    </div>                     
            </div>
        </div>
<%@ include file="../views/module/footer.jsp" %>

    </body>
</html>