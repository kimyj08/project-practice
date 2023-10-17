package com.springproj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springproj.biz.domain.AskRvVO;
import com.springproj.biz.domain.AskVO;
import com.springproj.biz.service.ArService;
import com.springproj.biz.service.AskService;

@Controller
@SessionAttributes("ask")
public class AskController {
	
	@Autowired
	AskService askService;
	@Autowired
	ArService arService;

	//@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET) // value = : 이거는 하나만 세팅 해줄 때는 안써도 가능.
	@GetMapping("/insertBAsk.zo") // 4점대 버전 이후부터 사용 가능한 기능.
	public String insertBAsk(Model model, HttpServletRequest request) {
		//System.out.println("글 등록 화면 처리");
		
		List<Map<String, String>> list = askService.getBrandList();
		
		model.addAttribute("role", request.getParameter("a"));
		model.addAttribute("BrandList", list);
		
		return "insertBAsk";
	}
	
	//@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	@PostMapping("/insertBAsk.zo")
	public String insertBAsk(AskVO ask, HttpServletRequest request) {
		//System.out.println("글 등록 처리");
		
		// 파일 업로드 처리
//		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/");
//		System.out.println("=>" + fileSaveFolder);
//		
//		MultipartFile uploadFile =  board.getUploadFile();
//		
//		if(!uploadFile.isEmpty()) {
//			String fileName = uploadFile.getOriginalFilename();
//			uploadFile.transferTo(new File(fileSaveFolder+fileName));
//		}
		
		askService.insertServiceB(ask);
		
		String returnUrl = "";
		
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		
		if("관리자".equals(role)) { // 관리자
			returnUrl = "redirect:getPAskList.zo";
		} else if("브랜드".equals(role)) { // 브랜드
			returnUrl = "redirect:getBAskList.zo";
		} else { // 일반회원
			returnUrl = "redirect:getUAskList.zo";
		}
		
		return returnUrl;
	}
	
	@GetMapping("/insertUAsk.zo")
	public String insertUAsk() {
		return "insertUAsk";
	}
	
	@PostMapping("/insertUAsk.zo")
	public String insertUAsk(AskVO ask) {
		askService.insertServiceU(ask);
		return "redirect:getUAskList.zo";
	}
	
	@GetMapping("/insertUAskP.zo")
	public String insertUAskP() {
		return "insertUAskP";
	}
	
	@PostMapping("/insertUAskP.zo")
	public String insertUAskP(AskVO ask) {
		askService.insertServiceP(ask);
		return "redirect:getPAskList.zo";
	}
	
	@RequestMapping(value = "/getAsk.zo")
	public String getAsk(AskVO ask, Model model, AskRvVO ar, HttpServletRequest request) {
		//System.out.println("GetBoardController 처리.");
		System.out.println(ask.getUm_no());
		System.out.println(ask.getBm_no());
		System.out.println(ask.getA_pmm());
		
		askService.updateCntService(ask.getA_no());
		
		AskVO vo = askService.getService(ask);
		
		List<AskRvVO> list = arService.getServiceList(""+ask.getA_no());
		
		System.out.println(list.size());
		
		// 작성자가 답글을 확인한 경우에만 답글 조회 여부 수정할 수 있도록 변수 세팅
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		String name_1 = vo.getName_1();
		
		if(list != null && list.size() > 0) {
			model.addAttribute("ar", list.get(0));
			
			// 작성자가 답글을 확인한 경우에만 답글 조회 여부 수정
			if(name_1.equals(userName)) {
				arService.updateYNService(list.get(0));
			}
		}
		
		model.addAttribute("ask", vo); // command 객체로 이용 가능하다.
		
		return "getAsk";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") // key 자리
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap; // value 자리
	}
	
	@RequestMapping(value = "/getBAskList.zo")
	public String getBList(AskVO vo, Model model, HttpServletRequest request) {
		//System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건: "+vo.getSearchCondition());
		System.out.println("검색 단어: "+vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		// 로그인한 계정의 seq 값 세팅
		HttpSession session = request.getSession();
		vo.setBm_no((String) session.getAttribute("userSeq"));
		
		List<AskVO> list = askService.getServiceBList(vo);
		
		model.addAttribute("askList", list);
		
		return "getBAskList";
	}
	
	@RequestMapping(value = "/getUAskList.zo")
	public String getUList(AskVO vo, Model model, HttpServletRequest request) {
		//System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건: "+vo.getSearchCondition());
		System.out.println("검색 단어: "+vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		// 로그인한 계정의 seq 값 세팅
		HttpSession session = request.getSession();
		vo.setUm_no((String) session.getAttribute("userSeq"));
		
		List<AskVO> list = askService.getServiceUList(vo);
		
		model.addAttribute("askList", list);
		
		return "getBAskList";
	}
	
	@RequestMapping(value = "/getPAskList.zo")
	public String getPList(AskVO vo, Model model) {
		//System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건: "+vo.getSearchCondition());
		System.out.println("검색 단어: "+vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<AskVO> list = askService.getServicePList(vo);
		
		model.addAttribute("askList", list);
		
		return "getBAskList";
	}
	
	@PostMapping(value = "/updateAsk.zo")
	public String updateAskProc(@ModelAttribute("ask") AskVO vo) {
		//System.out.println("글 수정 처리.");
		System.out.println(vo);
		
		askService.updateService(vo);
		
		return "redirect:getAsk.zo?a_no=" + vo.getA_no() + "&um_no=" + vo.getUm_no() + "&bm_no=" + vo.getBm_no() + "&a_pmm=" + vo.getA_pmm();
	}

	@RequestMapping(value = "/deleteAsk.zo")
	public String deleteAsk(AskVO ask, HttpServletRequest request) {
		//System.out.println("글 삭제 처리.");
		
		askService.deleteService(ask.getA_no());
		
		String returnUrl = "";
		
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		
		if("관리자".equals(role)) { // 관리자
			returnUrl = "redirect:getPAskList.zo";
		} else if("브랜드".equals(role)) { // 브랜드
			returnUrl = "redirect:getBAskList.zo";
		} else { // 일반회원
			returnUrl = "redirect:getUAskList.zo";
		}
		
		return returnUrl;
	}
	
}
