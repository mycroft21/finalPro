<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>free_list</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_list.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">자 유 게 시 판</font>
	</div>	

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top:50px;">	
			<form action="mainSearch" method=post>
				<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
					<option value="title" style="text-align:center;">Title</option>
					<option value="id" style="text-align:center;">I D</option>
				</select>
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
				
				<input type="submit" class="list-search" value ="Search" style="width:8%;">
			</form>
		</div>
		
		<h4>자유게시판</h4>
		<div style="margin-bottom: 20px; width: 73%;">
		
			<table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			         <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">I　　D</td>
			         <td width=60 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Category</td>
			         <td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Title</td>
			         <td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Contents</td>
			         <td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Img</td>
			         <td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Date</td>
			         <td width=50 style="border-top: 2px solid #000;">Hit</td>
			    </tr>
			     
			     <!-- result는 contoller의 addObject로 부터 가져온다. -->
					<c:forEach items="${result}" var="member">
			        	<tr>
			            	<td style="font-family: 'Nanum Gothic Coding', monospace; border-bottom: 3px solid #fff;">${member.id}</td>
			            	<td style="border-bottom: 3px solid #fff;">${member.category }</td>
			             	<td style="border-bottom: 3px solid #fff;"><a href="content?bNum=${member.bNum}&pageNum=${currentPage}&bgnum=${member.bgnum}">${member.title }</a></td>
			             	<td style="border-bottom: 3px solid #fff;">${member.contents }</td>
			             	<td style="border-bottom: 3px solid #fff; width: 10% "><img src="/team4/resources/FreeBoardImg/${member.img }" style="width: 100%; height: 50px;"></td>
			             	<td style="border-bottom: 3px solid #fff;">${member.bDate }</td>
			             	<td style="border-bottom: 3px solid #fff;">${member.readcount }</td>
			         	</tr>
					</c:forEach>
				</table>
			 
			   	<!-- 전체 페이지의 수를 연산 -->
			    	<div align="center">
	                	<c:if test="${count>0}" >
			            	<c:set var="pageCount" value="${pageCount}"/>
			            	<c:set var="startPage" value="${1}" />
			            	<c:set var="pageBlock" value="${5}" />
			         
			                <fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" /><!-- result=2 -->
			                     
			                <c:if test="${(currentPage%pageBlock)!=0}">
			                	<c:set var="startPage" value="${result*pageBlock+1}" />
			                </c:if>
			         
		                    <c:if test="${(currentPage%pageBlock)==0}">
		                  		<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
		                    </c:if>
			                  
			                <c:set var="endPage" value="${startPage+pageBlock-1}" />
			                <c:if test="${endPage>=pageCount}">
			                    <c:set var="endPage" value="${pageCount}" />
			                </c:if>            
			                  
			                <ul>
			                	<!-- 화살표 -->
			                	<c:if test="${startPage>5}">
				                    <c:if test="${word == null}">
				                    	<a href="free_list?pageNum=${startPage-5}" >&laquo;</a>
				                    </c:if>
			                        
			                        <c:if test="${word != null && keyword != null}">
			                        	<a href="free_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}" >&laquo;</a>
			                        </c:if>
			                    </c:if>
			      
				     			<table>
				     				<!-- 페이지 번호 생성 -->
				                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				                    	<c:if test="${word == null}">
				                        	<td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;"><a style="text-decoration:none;" href="free_list?pageNum=${i}" >${i}</a></td>
				                        </c:if>
				                        
				                        <c:if test="${word != null }">
				                        	<td><a href="free_list?pageNum=${i}&word=${word}&keyword=${keyword}" >${i}</a></td>
				                        </c:if>
				                    </c:forEach>
				                </table>
				                    
				                <c:if test="${endPage<pageCount}">
				                	<c:if test="${word == null}">
				                    	<a href="free_list?pageNum=${startPage+5}" >&raquo;</a>
				                    </c:if>
				                    
				                    <c:if test="${word != null }">
				                        <a href="free_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}" >&raquo;</a>
				                    </c:if>
				                </c:if>                  
			                </ul>
			                <br>
			                
						</c:if>
					</div>   
				</form>
			</div>
			
			<h4>Q & A</h4>
			<div style="margin-bottom: 20px; width: 73%;">
			<table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
					<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">글번호</td>
					<td width=60 style="border-top: 2px solid #000; border-right: 1px solid #fff;">이미지</td>
					<td width=60 style="border-top: 2px solid #000; border-right: 1px solid #fff;">카테고리</td>
					<td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">글제목</td>
					<td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">작성자</td>
					<td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">조회수</td>
					<td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">작성일자</td>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>
						<td style="font-family: 'Nanum Gothic Coding', monospace; border-bottom: 3px solid #fff;">${list.rnum}</td>
						<td style="border-bottom: 3px solid #fff;"><img
							src="/team4/resources/QandAImg/${list.img }"
							style="width: 100%; height: 50px;"></td>
						<td style="border-bottom: 3px solid #fff;">${list.category}</td>
						<c:choose>
							<c:when test="${fn:length(list.title)>15 }">
								<td style="border-bottom: 3px solid #fff;"><a href="QnA_content?bnum=${list.bnum}"><c:out
											value="${fn:substring(list.title,0,14)}" />...<c:if
											test="${list.replyCount != 0}">(${list.replyCount})</c:if></a></td>
							</c:when>
							<c:otherwise>
								<td style="border-bottom: 3px solid #fff; width: 10% "><a href="QnA_content?bnum=${list.bnum}"><c:out
											value="${list.title}"/><c:if
											test="${list.replyCount != 0}">(${list.replyCount})</c:if></a></td>
							</c:otherwise>
						</c:choose>
						<td style="border-bottom: 3px solid #fff;">${list.id}</td>
						<td style="border-bottom: 3px solid #fff;">${list.count}</td>
						<td style="border-bottom: 3px solid #fff;"><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd" /></td>
					</tr>

					<input type="hidden" name="bnum" value="${list.bnum}">
				</c:forEach>
			</table>
		</div>

		<!-- 페이지 번호 -->
		<div align="center" class="w3-row">
			<c:if test="${count>0}">
				<c:set var="pageCount" value="${pageCount}" />
				<!-- pagCount=15 -->
				<c:set var="startPage" value="${1}" />
				<c:set var="pageBlock" value="${5}" />

				<fmt:parseNumber var="result" value="${currentPage/pageBlock}"
					integerOnly="true" />

				<c:if test="${(currentPage%pageBlock)!=0}">
					<c:set var="startPage" value="${result*pageBlock+1}" />
					<!-- startpage=11 -->
				</c:if>

				<c:if test="${(currentPage%pageBlock)==0}">
					<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
				</c:if>

				<c:set var="endPage" value="${startPage+pageBlock-1}" />
				<!-- endpage=15 -->
				<c:if test="${endPage>=pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<ul>
					<c:if test="${startPage>5}">
						<c:if test="${word == null}">
							<a href="QnA_list?pageNum=${startPage-5}">&laquo;</a>
						</c:if>
						<c:if test="${word != null && keyword != null}">
							<a
								href="QnA_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
						</c:if>
					</c:if>

					<table>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${word == null}">
								<td><a href="QnA_list?pageNum=${i}">${i}</a></td>
							</c:if>

							<c:if test="${word != null }">
								<td><a
									href="QnA_list?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a></td>
							</c:if>
						</c:forEach>
					</table>

					<c:if test="${endPage<pageCount}">
						<c:if test="${word == null}">
							<a href="QnA_list?pageNum=${startPage+5}">&raquo;</a>
						</c:if>

						<c:if test="${word != null }">
							<a
								href="QnA_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
						</c:if>
					</c:if>
				</ul>
				<br>
			</c:if>
		</div>
			
			
		</div>
</body>
</html>