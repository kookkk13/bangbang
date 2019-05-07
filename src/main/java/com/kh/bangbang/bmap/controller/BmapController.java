package com.kh.bangbang.bmap.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bangbang.bmap.model.service.BmapService;
import com.kh.bangbang.bmap.model.vo.Bmap;

@Controller
public class BmapController {
	// 로그 처리용 객체 의존성 주입(종속객체 주입) 처리
	private static final Logger logger = LoggerFactory.getLogger(BmapController.class);
	
	@Autowired
	private BmapService mservice;
	
	// 매물 전체 리스트 불러오기 + json으로 형태 저장
	@RequestMapping("bmap.do")
	public String bangListView(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<Bmap> mlist = mservice.selectMapList();
		model.addAttribute("mlist", mlist);
		System.out.println("맵 전체 리스트 : " + mlist.size());
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		for(Bmap bmap : mlist) {
			JSONObject addr = new JSONObject();
			addr.put("pro_no", bmap.getPro_no());
			addr.put("address", bmap.getPro_address());
			jsonArray.add(addr);
		}
		
		jsonObject.put("positions", jsonArray);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/data/address.json");
		File file = new File(savePath);

		FileWriter fw = new FileWriter(file, false);
		fw.write(jsonObject.toJSONString());
		fw.flush();
		fw.close();
		
		response.setHeader("Cache-Control","no-cache"); 
		response.setHeader("Pragma","no-cache"); 
		response.setDateHeader("Expires",0); 
		
		return "home";	
	}
	
	// 매물번호에 일치하는 매물 정보 가져오기
	@RequestMapping(value="marealist.do")
	public void mapAreaListView(@RequestParam(value="pro_no") String pro_no, HttpServletResponse response) throws IOException, ParseException {	    
		List<Bmap> malist = mservice.selectMapAreaList(pro_no);
		//System.out.println("지도 영역 안의 리스트 : " + malist.size());
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(Bmap bmap : malist) {
			JSONObject addr = new JSONObject();
			addr.put("pro_no", bmap.getPro_no());
			addr.put("id", bmap.getId());
			addr.put("pro_address", bmap.getPro_address());
			addr.put("pro_content", bmap.getPro_content());
			addr.put("con_type", bmap.getCon_type());
			addr.put("deposit", bmap.getDeposit());
			addr.put("rent", bmap.getRent());
			addr.put("build_type", bmap.getBuild_type());
			addr.put("room_count", bmap.getRoom_count());
			addr.put("floor", bmap.getFloor());
			addr.put("manage_pay", bmap.getManage_pay());
			addr.put("rename_file", bmap.getRename_file());
			addr.put("pic_prono", bmap.getPic_prono());
			jsonArray.add(addr);
		}
		
		jsonObject.put("list", jsonArray);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsonObject.toJSONString());
		pw.flush();
		pw.close();
		
	}
	
	
	@RequestMapping(value="selectMapSearch.do", method=RequestMethod.POST)
	public String selectSearch(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, NumberFormatException {
		String low_deposit = request.getParameter("low_deposit");
		String high_deposit = request.getParameter("high_deposit");
		String low_rent = request.getParameter("low_rent");
		String high_rent = request.getParameter("high_rent");
		String[] build_type = request.getParameterValues("build_type");

		
		Map option = new HashMap();
		option.put("low_deposit", low_deposit);
		option.put("high_deposit", high_deposit);
		option.put("low_rent", low_rent);
		option.put("high_rent", high_rent);
		
		if( build_type.length > 0) {
			for(int i = 0; i < build_type.length; i++) {
				option.put("count" + i, build_type[i]);
			}
		}
		
		List<Bmap> smlist = mservice.selectSearchList(option);
		model.addAttribute("smlist", smlist);
		System.out.println("상세 검색  결과 : " + smlist.size());
			
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(Bmap bmap : smlist) {
			JSONObject addr = new JSONObject();
			addr.put("pro_no", bmap.getPro_no());
			addr.put("address", bmap.getPro_address());
			jsonArray.add(addr);
		}
		
		jsonObject.put("positions", jsonArray);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/data/address.json");
		File file = new File(savePath);

		FileWriter fw = new FileWriter(file, false);
		fw.write(jsonObject.toJSONString());
		fw.flush();
		fw.close();
		
		model.addAttribute("smlist", smlist);
		model.addAttribute("low_deposit",low_deposit);
		model.addAttribute("high_deposit",high_deposit);
		model.addAttribute("low_rent",low_rent);
		model.addAttribute("high_rent",high_rent);
		model.addAttribute("btype",build_type);
		for( int i = 0 ; i < build_type.length; i++) {
			model.addAttribute("build_type"+i, build_type[i]);
		}
		
		return "home";
	}

}






