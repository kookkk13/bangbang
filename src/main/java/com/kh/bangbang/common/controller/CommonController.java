package com.kh.bangbang.common.controller;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bangbang.common.model.vo.BaseResponse;

@ControllerAdvice
public class CommonController {
	
//	@ExceptionHandler(SQLException.class)
//	public @ResponseBody BaseResponse SQLException() {
//		return new BaseResponse(false, "SQL 에러"); 
//	}
}
