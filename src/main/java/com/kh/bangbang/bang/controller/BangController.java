package com.kh.bangbang.bang.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.bangbang.bang.model.service.BangService;
import com.kh.bangbang.bang.model.vo.Bang;
import com.kh.bangbang.bang.model.vo.BangUploadFile;
import com.kh.bangbang.bang.model.vo.LiveOption;
import com.kh.bangbang.bang.model.vo.ResOption;
import com.kh.bangbang.bookmark.model.service.BookmarkService;
import com.kh.bangbang.bookmark.model.vo.Bookmark;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.member.model.vo.Member;
import com.kh.bangbang.user.model.vo.User;

@Controller
public class BangController {
	
	@Autowired
	private BangService bservice;
	
	@Autowired
	private BookmarkService mservice;
	
	@RequestMapping("blist.do")
	public String bangListView(Model model) {
		List<Bang> blist = bservice.selectBangList();
		model.addAttribute("blist", blist);
		List<BangUploadFile> bimg = bservice.selectImge();
		model.addAttribute("bimg", bimg);
		return "bang/bangList";
	}
	
	//찜리스트출력
	@RequestMapping("bookmarklist.do")
	public String bangListView(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		List<Bang> blist = bservice.selectBookmarkList(id);
		model.addAttribute("blist", blist);
		List<BangUploadFile> bimg = bservice.selectImge();
		model.addAttribute("bimg", bimg);
		return "bang/bookmarkList"; //뷰 찜리스트
	}
	@RequestMapping("bwrite.do")
	public String bangWriteView(Model model) {
		return "bang/bangWrite";
	}
	@RequestMapping("binfo.do")
//	public String infoBangView(Model model, @RequestParam(name="pro_id", required=true) String pro_id,@RequestParam(name="pro_no", required=true) int pro_no) {
	public String infoBangView(Model model, HttpSession session, HttpServletRequest request) {
		String id = request.getParameter("id");
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String userid = null;
		int schedulerCheck = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if( request.getParameter("userid") != null) {
		userid = request.getParameter("userid");
		map.put("userid", userid);
		map.put("pro_no", pro_no);
		schedulerCheck = bservice.selectSchedulerCheck(map);
		}
		
		int bcheck = 0;
		String userType = request.getParameter("userType");
		Bang Bang = bservice.selectInfoBang(pro_no);
		List<LiveOption> live = bservice.selectInfoLiveBang(pro_no);
		List<ResOption> res = bservice.selectInfoResBang(pro_no);
		List<BangUploadFile> bfile = bservice.selectBangFile(pro_no);
		Bookmark bookmark = new Bookmark();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if( loginMember != null) {
		bookmark.setUser_id(loginMember.getId());
		bookmark.setCom_id(id);
		bookmark.setPro_no(pro_no);
		bcheck = mservice.checkBookmark(bookmark);
		}
		String member = bservice.selectWriter(id);
		if( member.equals("개인")) {
			User user = bservice.selectWriterUser(id);
			model.addAttribute("user", user);
		}else {
			Company company = bservice.selectWriterCompany(id);
			model.addAttribute("company", company);
		}
		model.addAttribute("Bang", Bang);
		model.addAttribute("live", live);
		model.addAttribute("res", res);
		model.addAttribute("bfile", bfile);
		model.addAttribute("bcheck", bcheck);
		model.addAttribute("userType", userType);
		model.addAttribute("schedulerCheck", schedulerCheck);
		return "bang/bangInfo";
	}
	
	@RequestMapping("bupdateView.do")
	public String bupdateView(Model model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String id = request.getParameter("id");
		Bang Bang = bservice.selectInfoBang(pro_no);
		String userType = request.getParameter("userType");
		List<LiveOption> live = bservice.selectInfoLiveBang(pro_no);
		List<ResOption> res = bservice.selectInfoResBang(pro_no);
		List<BangUploadFile> bfile = bservice.selectBangFile(pro_no);
		String member = bservice.selectWriter(id);
		if( member.equals("개인")) {
			User user = bservice.selectWriterUser(id);
			model.addAttribute("user", user);
		}else {
			Company company = bservice.selectWriterCompany(id);
			model.addAttribute("company", company);
		}
		
		model.addAttribute("Bang", Bang);
		model.addAttribute("live", live);
		model.addAttribute("res", res);
		model.addAttribute("bfile", bfile);
		model.addAttribute("userType", userType);
		return "bang/bangUpdate";
	}
	
	@RequestMapping(value="insertBang.do", method=RequestMethod.POST)
	public String insertBang(Model model, HttpServletRequest request, Bang bang,
									MultipartHttpServletRequest mrequest){
		
		String[] resOp = request.getParameterValues("res_option");
		String[] liveOp = request.getParameterValues("living_option");
		
		//파일
		BangUploadFile bfile = new BangUploadFile();
		List<MultipartFile> bangFile = mrequest.getFiles("original_file");
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/bang/");
		List<BangUploadFile> bfileList = new ArrayList<BangUploadFile>();
		String original_file = null;
		String rename_file = null;
		UUID uuid = UUID.randomUUID();
		
		int proResult = bservice.insertProperty(bang);
		int resResult = 0;
		int liveResult = 0;
		int fileResult = 0;
		
		if( proResult == 1  ) {
			int index = 0;
		for ( MultipartFile mf : bangFile) {
			try {
			String savefile = null;
			System.out.println(index);
			if( index == 0) {
				original_file = mf.getOriginalFilename(); //첫번째 섬네일용 파일
				int pro_no = bservice.selectPro_no();
				rename_file = Integer.toString(pro_no)+ "." +original_file.substring(original_file.lastIndexOf(".")+1);
				savefile = savePath + rename_file;
				bfile.setOriginal_file(original_file );
				bfile.setRename_file(rename_file);
				bfileList.add(bfile);
				mf.transferTo(new File(savefile));
				fileResult = bservice.insertBangFile(bfile);
				index++;
			} else {
				original_file = mf.getOriginalFilename(); //원본파일명
				rename_file = uuid.toString()+"_"+original_file;
				savefile = savePath + rename_file;
				bfile.setOriginal_file(original_file);
				bfile.setRename_file(rename_file);
				bfileList.add(bfile);
				mf.transferTo(new File(savefile));
				fileResult = bservice.insertBangFile(bfile);
				System.out.println(index);
				index++;
			}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			liveResult = bservice.insertLive(liveOp);
			resResult = bservice.insertRes(resOp);
				if( resResult == 1 && liveResult == 1 && fileResult== 1) {
					return "redirect:/blist.do";
				} else {
					return "common/error";
				}
		} else {
			return "common/error";
		}
		//return "redirect:/blist.do";
	}
	
	@RequestMapping(value="userBdel.do")
	public String deleteUserBang(int pro_no, Model model ,HttpServletRequest request) {
		String id = request.getParameter("id");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		int pro_result = bservice.deleteBang(pro_no);
		if( pro_result > 0 ) {
			model.addAttribute("id", id);
			model.addAttribute("currentPage", currentPage);
			return "redirect:/userBangPage.do";
		} else { 
			return "common/error";
		}
		
	}
	@RequestMapping(value="bdelete.do")
	public String deleteBang(int pro_no, HttpServletRequest request) {
		
		int pro_result = bservice.deleteBang(pro_no);
		if( pro_result > 0 ) {
			return "redirect:/blist.do";
		} else { 
			return "common/error";
		}
		
/*		// 실제 파일 및 매물 삭제 시 구현내용
  int file_result = 1;
		List<BangUploadFile> delList = bservice.selectBangFile(pro_no);
		int pro_result = bservice.deleteBang(pro_no);
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/bang");
		System.out.println(delList.size());
  if( pro_result == 1) {
			File file = null;
			for( int i = 0; i< delList.size(); i++) {
				file = new File(savePath + "/" + delList.get(i).getRename_file());
				System.out.println(file.getName());
				if(file.exists()) {
					boolean filed = file.delete();
					if(filed) {
						System.out.println("삭제 성공");
						file_result &= 1;
					} else {
						System.out.println("삭제 실패");
						file_result &= 0;
					}
				}
			}
			if( file_result == 1) {
				return "redirect:/blist.do";
			} else {
				return "common/error";	
			}
		} else {
			return "common/error";
		}*/
	}
	@RequestMapping("adminBdel.do")
	public String adminDel(int pro_no, HttpServletRequest request) {
		int pro_result = bservice.deleteBang(pro_no);
		if( pro_result > 0 ) {
			return "redirect:/adminblist.do";
		} else { 
			return "common/error";
		}
	}
	
	@RequestMapping(value="upBang.do")
	public String updateBang(Model model, HttpServletRequest request, Bang bang, MultipartHttpServletRequest mrequest) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String id = request.getParameter("id");
		String userType = request.getParameter("userType");
		
		
		int delResResult = 0;
		int delLiveResult = 0;
		int delFileResult = 0;
		int upResResult = 0;
		int upLiveResult = 0;
		int upFileResult = 0;
		
		List<BangUploadFile> oldList = bservice.selectBangFile(pro_no);
		List<MultipartFile> upList = mrequest.getFiles("new_file");
		List<BangUploadFile> newList = new ArrayList<BangUploadFile>();
		List<LiveOption> liveList = new ArrayList<LiveOption>();
		List<ResOption> resList = new ArrayList<ResOption>();
		String[] resOp = request.getParameterValues("res_option");
		String[] liveOp = request.getParameterValues("living_option");
		
		int upProResult = bservice.updateProperty(bang);
		if( upProResult == 1) {
			try {
				String savePath = request.getSession().getServletContext().getRealPath("resources/files/bang/");
				System.out.println(savePath);
				File file = null;
				String savefile = null;
				String original_file = null;
				String rename_file = null;
				UUID uuid = UUID.randomUUID();
				BangUploadFile bfile = new BangUploadFile();
				int index = 0;
				
 				for ( MultipartFile mf : upList) {
 					if( oldList.size() > 0) {
						 if( index < oldList.size()) {
							if ( index == 0) { // 첫번째파일은 리네임 매물번호로 해야함
								if( !mf.getOriginalFilename().isEmpty()) { // 수정되는 파일이 있을때
									original_file = mf.getOriginalFilename();
									rename_file = pro_no+ "." +original_file.substring(original_file.lastIndexOf(".")+1);
									bfile.setOriginal_file(original_file);
									bfile.setRename_file(rename_file);
									bfile.setPro_no(pro_no);
									delFileResult = bservice.deleteBangFile(oldList.get(index).getPic_no());
									upFileResult = bservice.insertBangFile1(bfile);
									file = new File(savePath + oldList.get(index).getRename_file());
									file.delete();
									savefile = savePath + rename_file;
									mf.transferTo(new File(savefile));
								} else {
									bfile.setOriginal_file(oldList.get(index).getOriginal_file());
									bfile.setRename_file(oldList.get(index).getRename_file());
									
								}//첫번째 인덱스 종료
						  } else { // 나머지 인덱스
								if( !mf.getOriginalFilename().isEmpty()) {
									original_file = mf.getOriginalFilename();
									rename_file = uuid.toString()+"_"+original_file;
									bfile.setOriginal_file(original_file);
									bfile.setRename_file(rename_file);
									bfile.setPro_no(pro_no);
									delFileResult = bservice.deleteBangFile(oldList.get(index).getPic_no());
									upFileResult = bservice.insertBangFile1(bfile);
									file = new File(savePath + oldList.get(index).getRename_file());
									file.delete();
									savefile = savePath + rename_file;
									mf.transferTo(new File(savefile));
								} else {
									bfile.setOriginal_file(oldList.get(index).getOriginal_file());
									bfile.setRename_file(oldList.get(index).getRename_file());
									
								}
							}
						} else { // 원본 사이즈보다 많이 첨부될때
								original_file = mf.getOriginalFilename();
								rename_file = uuid.toString()+"_"+original_file;
								bfile.setOriginal_file(original_file);
								bfile.setRename_file(rename_file);
								bfile.setPro_no(pro_no);
								upFileResult = bservice.insertBangFile1(bfile);
								savefile = savePath + rename_file;
								mf.transferTo(new File(savefile));
						}
					} else {
						if ( index == 0) { // 첫번째파일은 리네임 매물번호로 해야함
								original_file = mf.getOriginalFilename();
								rename_file = pro_no+ "." +original_file.substring(original_file.lastIndexOf(".")+1);
								bfile.setOriginal_file(original_file);
								bfile.setRename_file(rename_file);
								bfile.setPro_no(pro_no);
								upFileResult = bservice.insertBangFile1(bfile);
								savefile = savePath + rename_file;
								mf.transferTo(new File(savefile));
						} else {
								original_file = mf.getOriginalFilename();
								original_file = mf.getOriginalFilename();
								rename_file = uuid.toString()+"_"+original_file;
								bfile.setOriginal_file(original_file);
								bfile.setRename_file(rename_file);
								bfile.setPro_no(pro_no);
								upFileResult = bservice.insertBangFile1(bfile);
								savefile = savePath + rename_file;
								mf.transferTo(new File(savefile));
						}
					}
 					 index++;
 				}
				newList = bservice.selectBangFile(pro_no);
				
				delResResult = bservice.deleteResOption(pro_no);
				delLiveResult = bservice.deleteLiveOption(pro_no);
				
				if( delResResult > 0 && delLiveResult > 0) {
					LiveOption lo = new LiveOption();
					for( int i = 0 ; i < liveOp.length; i++) {
						lo.setPro_no(pro_no);
						lo.setLive_pro_con(liveOp[i]);
						liveList.add(lo);
						upLiveResult = bservice.insertLive1(lo);
					}
					
					ResOption ro = new ResOption();
					for(int i = 0; i < resOp.length; i++) {
						ro.setPro_no(pro_no);
						ro.setRes_pro_con(resOp[i]);
						upResResult = bservice.insertRes1(ro);
						resList.add(ro);
					}
					
					if(  upResResult > 0 && upLiveResult > 0 ) {
						if( userType.equals("admin")) {
							model.addAttribute("userType", userType);
							return "redirect:/adminblist.do";
						} else if( userType.equals("all")){
						model.addAttribute("pro_no", pro_no);
						model.addAttribute("id", id);
						model.addAttribute("userType", userType);
						return "redirect:/binfo.do";
						} else if( userType.equals("writer")) {
							model.addAttribute("id", id);
						}
					} else {
						return "common/error";
					}
				} else {
					return "common/error";
				}
			}catch (Exception e) {
				e.printStackTrace();
				return "common/error";
		}//try closed
		}
		if ( userType.equals("admin")) {
			model.addAttribute("pro_no", pro_no);
			model.addAttribute("id", id);
			model.addAttribute("userType", userType);
			return "redirect:/binfo.do";
		} else {
		model.addAttribute("pro_no", pro_no);
		model.addAttribute("id", id);
		model.addAttribute("userType", userType);
		return "redirect:/binfo.do";
		}
	}
	
	@RequestMapping("adminblist.do")
	public String selectAdminBangList(Model model, HttpServletRequest request) {
		int currentPage = 1;
		List<Bang> blist = new ArrayList<Bang>();
		
		if( request.getParameter("page")!= null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = bservice.countList();
		int limit = 10;
		int startPage = ((int)((double)currentPage/limit+0.9)-1)* limit +1;
		int endPage = startPage + limit - 1;
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		blist = bservice.selectAdminBangAll(map);
		model.addAttribute("blist", blist);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminBangList";
	}
	@RequestMapping("adminSblist.do")
	public String selectAdminSearchBang(Model model, HttpServletRequest request, String searchType, String keyword) {
		int currentPage = 1;
		List<Bang> blist = new ArrayList<Bang>();
		
		if( request.getParameter("page")!= null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if( searchType != null && keyword != null && searchType != "" && keyword != "") {
		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchType", searchType);
		search.put("keyword", keyword);
		int listCount = bservice.countSList(search);
		int limit = 10;
		int startPage = ((int)((double)currentPage/limit+0.9)-1)* limit +1;
		int endPage = startPage + limit - 1;
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		blist = bservice.selectAdminSearchBang(map);
		model.addAttribute("blist", blist);
		model.addAttribute("limit", limit);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminBangList";
		} else {
			return "common/error";
		}
	}
	
	@RequestMapping("userSBang.do")
	public String userSearchBang(Model model, HttpServletRequest request) {
		String low_deposit = request.getParameter("low_deposit");
		String high_deposit = request.getParameter("high_deposit");
		String low_rent = request.getParameter("low_rent");
		String high_rent = request.getParameter("high_rent");
		String[] build_type = request.getParameterValues("build_type");
		String rent = request.getParameter("rent");
		String deposit = request.getParameter("deposit");
		List<Bang> blist = new ArrayList<Bang>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if( build_type.length > 0) {
		for(int i = 0; i < build_type.length; i++) {
			map.put("build" + i, build_type[i]);
		}
		}
		
		map.put("low_deposit",low_deposit);
		map.put("high_deposit",high_deposit);
		map.put("low_rent",low_rent);
		map.put("high_rent",high_rent);
		map.put("build_type",build_type);
		map.put("count", build_type.length);
		map.put("rent", rent);
		map.put("deposit", deposit);
		blist = bservice.userSearchBang(map);
		
		List<BangUploadFile> bimg = new ArrayList<BangUploadFile>();
		bimg = bservice.selectImge();
		
		model.addAttribute("blist", blist);
		model.addAttribute("bimg", bimg);
		model.addAttribute("low_deposit",low_deposit);
		model.addAttribute("high_deposit",high_deposit);
		model.addAttribute("low_rent",low_rent);
		model.addAttribute("high_rent",high_rent);
		model.addAttribute("btype",build_type);
		for( int i = 0 ; i < build_type.length; i++) {
			model.addAttribute("build_type"+i, build_type[i]);
		}
		return "bang/bangList";
	}
	@RequestMapping("userBangPage.do")
	public String userBangPage(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String userType = "writer";
		int currentPage = 1;
		int listCount = bservice.countUserBang(id);
		
		if( request.getParameter("page")!= null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int startPage = ((int)((double)currentPage/limit+0.9)-1)* limit +1;
		int endPage = startPage + limit - 1;
		int maxPage = (int)((double)listCount / limit + 0.9);
		
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);
		
		List<Bang> blist = new ArrayList<Bang>();
		blist = bservice.selectUserBangList(map);

		model.addAttribute("blist", blist);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("userType", userType);
		
		return "bang/userBangPage";
	}
	
	@RequestMapping("contractBang.do")
	public String contractBang(Model model, HttpServletRequest request) {
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		String id = request.getParameter("id");
		String userType = request.getParameter("userType");
		
		int result = bservice.contractBang(pro_no);
		
		if( result > 0) {
			if( userType.equals("writer")) {
				model.addAttribute("id", id);
				model.addAttribute("userType", userType);
				return "redirect:/userBangPage.do";
			} else {
				model.addAttribute("id", id);
				model.addAttribute("userType", userType);
				return "redirect:/adminblist.do";
			}
		} else {
			return "common/error";
		}
		
	}
	
}
