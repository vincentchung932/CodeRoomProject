package com.vincent.coderoom.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vincent.coderoom.model.Snippet;
import com.vincent.coderoom.service.SnpServ;

@Controller
public class Usercontroller {
	
	@Autowired
	SnpServ snpServ;
	
	
	@GetMapping("/")
	public String index(@ModelAttribute("snippet")Snippet snippet) {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(@ModelAttribute("snippet")Snippet snippet,Model m) {
		List<Snippet> snps = snpServ.findAll();
		m.addAttribute("snps", snps);
		return "dashboard.jsp";
	}
	
	@PostMapping("/adding/snippet")
	public String addingSnippet(@Valid @ModelAttribute("snippet")Snippet snippet,BindingResult result,Model m) {
		if(result.hasErrors()) {
			List<Snippet> snps = snpServ.findAll();
			m.addAttribute("snps", snps);
			return "dashboard.jsp";
		}else {			
			Snippet snp = snpServ.createSnp(snippet);
			return "redirect:/code/"+snp.getId();
		}
	}
	
	@GetMapping("/create")
	public String createbyAI() {
		return "createbyai.jsp";
	}
	
	@GetMapping("/code/{id}")
	public String details(@PathVariable("id") Long id,Model m) {
		Snippet s = snpServ.findOne(id);
		m.addAttribute("snippet", s);
		List<Snippet> snps = snpServ.findAll();
		m.addAttribute("snps", snps);
		return "detail.jsp";
	}
	
	@PutMapping("/editing/snippet/{id}")
	public String editing(@Valid @ModelAttribute("snippet")Snippet s,BindingResult result,Model m,@PathVariable("id") Long id) {
		if(result.hasErrors()) {
			List<Snippet> snps = snpServ.findAll();
			m.addAttribute("snps", snps);
			return "detail.jsp";
		}
		else {
			snpServ.updateSnp(s);
			return "redirect:/code/"+id;
		}
	}
	
	@GetMapping("/delete/snippet/{id}")
	public String deleting(@PathVariable("id") Long id) {
		snpServ.deleteById(id);
		return "redirect:/dashboard";
	}
	
	@PostMapping("/code/set_time/{id}")
	public String set_time(@PathVariable("id") Long id,@RequestParam("time")String time) {
		Snippet s = snpServ.findOne(id);
		s.setTimecomplx(time);
		snpServ.updateSnp(s);
		
		return "redirect:/code/"+id;
	}
	
	
	@PostMapping("/code/set_anno/{id}")
	public String set_anno(@PathVariable("id") Long id,@RequestParam("anno")String anno) {
		Snippet s = snpServ.findOne(id);
		s.setAnnotation(anno);
		snpServ.updateSnp(s);
		
		return "redirect:/code/"+id;
	}
}







