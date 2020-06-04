package com.kh.www;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Apart.model.exception.ApartException;
import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.service.MemberService;
import com.kh.www.Member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ApartService aptService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder BCryptPasswordEncoder; 
	
	//아파트 추가
	@RequestMapping("aptAdd.do")
	public String aptInsert(@RequestParam("aptAdd_Name") String name, @RequestParam("address1") String address,
			                @RequestParam("aptAdd_dong") String[] dong, @RequestParam("aptAdd_phone") String phone,
			                Model model, HttpServletResponse response) throws IOException {
		
		System.out.println("이름:" + name);
		System.out.println("주소:" + address);
		System.out.println("동:" + Arrays.toString(dong));
		System.out.println("전화번호:" + phone);
		
		String dongjoin = String.join(",",dong); 
		
		Apart apt = new Apart(name, dongjoin, address, phone);
		
		int result = aptService.aptInsert(apt);
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아파트 신청이 완료되었습니다.'); history.go(-1);</script>");
            out.flush();


			return "index";
		}else {
			throw new ApartException("아파트 신청이 불가능합니다.");
		}
		
	}
	// 아파트 동 리스트 뽑기
	@RequestMapping("donglist.bo")
	public void donglist(@RequestParam("name") String name, Model model,
						   HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8"); 
		String dong = null;
		String[] dongs = null;
		if(name != null) {
			dong = aptService.donglist(name);
			dongs = dong.split(",");
		}
		
		Gson gson = new Gson();
		
		try {
			gson.toJson(dongs, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 아파트 중복체크
	@RequestMapping("aptDupChk.do")
	public void aptDupName(@RequestParam("name") String name, HttpServletResponse response) {
		
		System.out.println(name);
		
		int result = aptService.aptDupName(name);
		
		boolean isable = result == 0 ? true : false;
		
		try {
			response.getWriter().print(isable);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//아이디 중복체크
	@RequestMapping("dupid.do")
	public void dupid(@RequestParam("id") String id, HttpServletResponse response) {
		System.out.println(id);
		
		int result = mService.dupid(id);
				
		boolean isable = result == 0 ? true : false;
		
		try {
			response.getWriter().print(isable);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//멤버 회원가입
	@RequestMapping("memberInsert.do")
	public String InsertMember(@ModelAttribute Member m, @RequestParam("profile_img") MultipartFile imgFile,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		int userLevel = 1;
		System.out.println(imgFile);
		m.setUserId(request.getParameter("id"));
		m.setUserName(request.getParameter("name"));
		m.setNickName(request.getParameter("nickName"));
		m.setPhone(request.getParameter("phone"));
		m.setEmail(request.getParameter("email"));
		m.setAptName(request.getParameter("aptName"));
		m.setAptDong(request.getParameter("aptDong"));
		m.setAptHosu(request.getParameter("aptNum"));
		m.setUserLevel(userLevel);
		
		String encPwd = BCryptPasswordEncoder.encode(request.getParameter("pwd"));
		System.out.println(encPwd);
		
		m.setUserPwd(encPwd);
		
		if(imgFile != null && !imgFile.isEmpty()) {
			String renameFileName = saveFile(imgFile, request);
			
			if(renameFileName != null) {
				m.setUserFile(renameFileName);
			}
		}
		
		int result = mService.InsertMember(m);
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('회원 가입이 완료되었습니다.'); history.go(-1);</script>");
            out.flush();


			return "index";
		}else {
			throw new ApartException("아파트 신청이 불가능합니다.");
		}
	}
	
	
	//파일 이름 변경
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	
	
}
