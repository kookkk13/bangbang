<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
	</head>
	<body>
		<c:import url="../common/top.jsp"/>
		<div id="notice-index">
			<div class="comuArea qnaArea">
				<div class="comuWrap qnaWrap">
					<div class="comuTitBox">
						<strong>질문 작성하기</strong>
						<div class="clr"></div>
					</div>
					<form name="writeForm" id="writeForm" method="post" action="qnainsert.do">
				        <div class="comuWriteWrap">
							<div class="writeTit">
								<div class="titCon">
									<label>제목</label>
									<div class="titBox">
										<input type="text" name="qna_title" required />
									</div>
								</div>
								<ul>
									<li>
										<div class="titCon">
											<label>작성자</label>
											<div class="titBox">
												<input type="text" name="user_id" value="${ loginMember.id}" readonly />
											</div>
										</div>
									</li>
									
								</ul>
							</div>
				            <textarea name="qna_content" required></textarea>
				            <div class="btnCtrl">
				                <a href="javascript:void(0);" class="btnOk"><input type="submit" value="확인"></a>
				                <a href="qnalist.do?id=${ loginMember.id}" class="btnCancel">취소</a>
				            </div>
				        </div>
				    </form>
				</div>
			</div>
		</div>
	</body>
</html>