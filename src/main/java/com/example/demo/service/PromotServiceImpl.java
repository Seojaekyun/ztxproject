package com.example.demo.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.PromotDto;
import com.example.demo.mapper.PromotMapper;
import com.example.demo.util.MyUtils;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ps")
public class PromotServiceImpl implements PromotService {
	@Autowired
	private PromotMapper mapper;

	@Override
	public String list(HttpServletRequest request, Model model) {
		List<PromotDto> plist = mapper.promotList();
		
		model.addAttribute("plist", plist);
		System.out.println(plist.size());
		return "/promot/list";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.readnum(id);
		
		return "redirect:/promot/content?id="+id;
	}

	@Override
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		PromotDto pdto=mapper.promotContent(id);
		
		pdto.setContent(pdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("pdto", pdto);	
		return "/promot/content";
	}
	
	@Override
	public String promotList(HttpServletRequest request, Model model) {
		List<PromotDto> plist = mapper.promotList();
		
		model.addAttribute("plist", plist);
		
		return "/admin/promotList";
	}
	
	@Override
	public String promotAdd() {
		return "/admin/promotAdd";
	}

	@Override
	public String addPromots(PromotDto pdto, @RequestParam MultipartFile file) throws Exception {
		String fname = "";
		
		if (!file.isEmpty()) {
			String oname = file.getOriginalFilename();
			String str = ResourceUtils.getFile("classpath:static/resources").toString() + "/" + oname;
			str = MyUtils.getFileName(oname, str);
			
			fname = str.substring(str.lastIndexOf("/") + 1); // 파일 이름 설정
			
			Path path = Path.of(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
		}
		
		pdto.setFname(fname); // DTO에 파일 이름 설정
		mapper.addPromot(pdto); // DB에 저장
		
		return "redirect:/admin/promotList"; // 리다이렉트
	}
	
	@Override
	public String promotContent(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		PromotDto pdto=mapper.promotContent(id);
		
		pdto.setContent(pdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("pdto", pdto);	
		return "/admin/promotContent";
	}

	@Override
	public String promotUpdate(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		PromotDto pdto=mapper.promotContent(id);
		pdto.setContent(pdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("pdto", pdto);
		return "/admin/promotUpdate";
	}
	
	@Override
	public String upPromots(HttpServletRequest request, @RequestParam MultipartFile file, PromotDto pdto) throws Exception {
		String fname=request.getParameter("fname"); // request에서 이전 파일 이름을 가져옵니다.
		
		if(file.isEmpty()) {
			if(fname==null||fname.isEmpty()) {
				fname=pdto.getFname(); // DTO에서 이전 파일 이름 가져오기
			}
		}
		else { // 새로운 파일 업로드 처리
			String oname = file.getOriginalFilename();
			String str = ResourceUtils.getFile("classpath:static/resources").toString() + "/" + oname;
			str = MyUtils.getFileName(oname, str);
			
			fname=str.substring(str.lastIndexOf("/") + 1); // 파일 이름 설정
			
			Path path=Path.of(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
		}
		
		pdto.setFname(fname); // DTO에 파일 이름 설정
		mapper.upPromots(pdto); // DB에 저장
		
		return "redirect:/admin/promotContent?id=" + pdto.getId(); // 리다이렉트
	}
	
	@Override
	public String delPromot(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.delete(id);
		
		return "redirect:/admin/promotList";
	}
	
	

}
