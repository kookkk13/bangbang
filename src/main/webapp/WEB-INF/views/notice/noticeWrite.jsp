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
			<div class="comuArea noticeArea">
				<div class="comuWrap noticeWrap">
					<div class="comuTitBox">
						<strong>공지사항 글쓰기</strong>
						<div class="clr"></div>
					</div>
					<form name="writeForm" id="writeForm" method="post" action="ninsert.do">
				        <div class="comuWriteWrap">
							<div class="writeTit">
								<div class="titCon">
									<label>제목</label>
									<div class="titBox">
										<input type="text" name="notice_title" required />
									</div>
								</div>
								<ul>
									<li>
										<div class="titCon">
											<label>작성자</label>
											<div class="titBox">
												<input type="text" name="writer" value="관리자" readonly />
											</div>
										</div>
									</li>
									<!-- <li>
										<div class="titCon">
											<label>번호</label>	
											<div class="titBox">
												<input type="text" name="notice_no" value="" readonly />
											</div>
										</div>
									</li> -->
								</ul>
							</div>
				            <textarea name="notice_content" required></textarea>
				            <div class="btnCtrl">
				                <a href="javascript:void(0);" class="btnOk"><input type="submit" value="확인"></a>
				                <a href="javascript:void(0);" class="btnCancel"><input type="reset" value="취소"></a>
				            </div>
				        </div>
				    </form>
				</div>
			</div>
		</div>
	</body>
</html>