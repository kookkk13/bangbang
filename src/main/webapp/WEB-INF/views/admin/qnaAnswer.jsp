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
						<strong>답변 작성하기</strong>
						<div class="clr"></div>
					</div>
					<form name="modifyForm" id="" method="post" action="qnaadminupdate.do">
				        <input type="hidden" name="qna_no" value="${qna.qna_no }" readonly>
				        <div class="comuWriteWrap">
							<div class="writeTit">
								<div class="titCon">
									<label>제목</label>
									<div class="titBox">
										<input type="text" name="qna_title" value="${qna.qna_title }" readonly>
									</div>
								</div>
								<ul>
									<li>
										<div class="titCon">
											<label>작성자</label>
											<div class="titBox">
												<input type="text" name="user_id" value="${qna.user_id }" readonly />
											</div>
										</div>
									</li>
								</ul>
							</div>
				            <textarea name="qna_content" readonly>${qna.qna_content }</textarea>
				             <textarea name="qna_answer">${qna.qna_answer }</textarea>
				            <div class="btnCtrl">
				                <a href="javascript:void(0);" class="btnOk"><input type="submit" value="확인"></a>
				                <a href="javascript:void(0);" class="btnCancel"><input type="submit" value="취소"></a>
				            </div>
				        </div>
				    </form>
				</div>
			</div>
		</div>
	</body>
</html>