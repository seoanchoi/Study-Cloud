package study.cloud.stc.member.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.cloud.stc.member.model.service.MailSendService;
import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;



@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSendService mailSendService;
	
	@GetMapping("/joinForm")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("/join/joinForm");
		return mv;
	}
	
	@PostMapping("/prev")
	public String insertJoin(
			MemberVo memberVo
			, ModelAndView mv
		) throws Exception {
		
		memberService.insertJoin(memberVo);
		
		System.out.println("memberVo:" + memberVo);
		
		
		return "redirect:/";
	}
			
	
	@GetMapping("/jointerms")
	public ModelAndView jointerms(ModelAndView mv) {
		mv.setViewName("/join/jointerms");
		return mv;
	}
	
	@PostMapping("/idcheck")
    @ResponseBody
    public String idCheck(String memId) throws Exception {
        int result = memberService.idCheck(memId);
        return String.valueOf(result);
    }
	
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String memEmail) {
		System.out.println("이메일 인증 요청");		
		System.out.println("이메일 주소: " + memEmail);
		return mailSendService.joinEmail(memEmail);
	}


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@ExceptionHandler(NullPointerException.class)
	public ModelAndView memberNullPointExceptionHandler( NullPointerException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
	@ExceptionHandler(NumberFormatException.class)
	public ModelAndView memberNumberFormatExceptionHandler( NumberFormatException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
	@ExceptionHandler(SQLException.class)
	public ModelAndView memberSQLExceptionHandler( SQLException e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
//	@ExceptionHandler
	@ExceptionHandler(Exception.class)
	public ModelAndView memberExceptionHandler( Exception e
			// 오류 발생함. ModelAndView mv
			) {
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()+" 오류가 발생했습니다. 다시 시도해 주세요.");
		mv.setViewName("errors/error");
		return mv;
	}
}
