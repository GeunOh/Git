package com.kh.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.www.Apart.model.exception.ApartException;
import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ApartService aptService;
	
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
			model.addAttribute("msg","아파트를 신청하였습니다.");
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아파트를 신청하였습니다.'); history.go(-1);</script>");
            out.flush();


			return "index";
		}else {
			throw new ApartException("아파트 추가에 실패했습니다.");
		}
		
	}
	
}
