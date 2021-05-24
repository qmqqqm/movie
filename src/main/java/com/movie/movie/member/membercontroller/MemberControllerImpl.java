package com.movie.movie.member.membercontroller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.aspectj.org.eclipse.jdt.internal.core.util.MementoTokenizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.member.memberDTO.MemberListDTO;
import com.movie.movie.member.memberService.MemberService;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	//등록되어있는 bean중에서 id가 memberService인 bean을 주입한다
		@Autowired
		private MemberService memberService;
		
		//등록되어있는 bean중에서 id가 memberDTO인 bean을 주입한다
		@Autowired
		private MemberDTO memberDTO;
		
		public MemberControllerImpl() {}
		
		//확인방법   http://localhost/컨텍스트패스/member/memberList.do
		//회원목록조회
		@Override
		@RequestMapping(value = "/member/memberList.do", 
						method = { RequestMethod.POST,
						           RequestMethod.GET })
		public  ModelAndView  getMemberList(HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			
			String pageNoVal = request.getParameter("pageNo");
			
			int pageNo = 1;
			if (pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			
			MemberListDTO memberListDTO = memberService.memberList(pageNo);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberListDTO", memberListDTO);
			mv.setViewName("/member/memberList");
			return mv;
		}
		
		

		//회원가입폼 보여주기
		//@RequestMapping("요청url")
		@Override
		@RequestMapping("/member/joinForm.do")
		public String joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			<beans:property name="prefix" value="/WEB-INF/views/" />
//			<beans:property name="suffix" value=".jsp" />
//			/WEB-INF/views/member/joinForm.jsp
			return "/member/joinForm";
		}

		//회원가입처리

		@Override
		@RequestMapping("/member/joinMember.do")
		public ModelAndView joinMember(
				@ModelAttribute("info") MemberDTO memberDTO,
				//MemberDTO memberDTO,
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			
			
			//2.鍮꾩쫰�땲�뒪濡쒖쭅 -> Service ->DAO -> Mybatis->DB
			String email2 = request.getParameter("emailSite");
			
			String tel1 = request.getParameter("member_tel2");
			
			String telfull = memberDTO.getMember_tel()+tel1;
			String emailfull = memberDTO.getMember_email()+"@"+email2;
			
			memberDTO.setMember_tel(telfull);
			memberDTO.setMember_email(emailfull);
			
			int result = memberService.joinMember(memberDTO);
			//3.Model
			//4.View => 紐⑸줉蹂닿린�럹�씠吏�濡� �꽆�뼱媛� �삁�젙=>�쉶�썝紐⑸줉蹂닿린 �슂泥�
			ModelAndView mv = new ModelAndView("redirect:/main.do");
			//System.out.println("而⑦듃濡ㅻ윭�슂泥��븿�닔�쓽 留ㅺ컻蹂��닔 memberDTO="+memberDTO);
			//mv.setViewName("member/imsiView");  
			//imsiView�뿉�꽌�뒗 紐⑤뜽�쓽 媛믪쓣 釉뚮씪�슦���뿉 異쒕젰�떆  ${info.get硫붿꽌�뱶()} �궗�슜媛��뒫
			//imsiView�뿉�꽌�뒗 紐⑤뜽�쓽 媛믪쓣 釉뚮씪�슦���뿉 異쒕젰�떆 ${memberDTO.get硫붿꽌�뱶()} �궗�슜媛��뒫
			return mv;
		}

		//개인회원정보 조회
		//요청url contextPath/member/memberDetail.do?memberNo=${member.mno}&id=${member.id}">
		@Override
		@RequestMapping("/member/memberDetail.do")
		public ModelAndView getMemberDetail(
				HttpServletRequest request, 
				HttpServletResponse response,
				ModelAndView mv,
				@RequestParam Map<String, Object> info) throws Exception {
			//여기에서는 member.xml문서에서 파라미터는 map받기로 하였으므로 map만들어서 넘길예정
			//@RequestParam Map<String, Object> info으로 요청함수의 매개변수를 사용했다는 것은
			//파라미터의 값을 Map에  info라는 참조변수, value를 Object으로 저장함을 의미한다
			//회원번호를 받고 싶다면   info.memberNo
			//회원id를  받고 싶다면   info.id
			//1. 파라미터받기(기존방식)
//			String strMno = request.getParameter("memberNo");
//			int mno = Integer.parseInt(strMno);
//			String id = request.getParameter("id");
//			Map memberMap = new HashMap();
//			memberMap.put("mno", mno);
//			memberMap.put("id", id);
			
			//1. 파라미터받기
			
			int pageNo = Integer.parseInt(request.getParameter("pageNo"));
			
			
			
			int member_id = Integer.parseInt(request.getParameter("member_id"));
			info.put("member_id", member_id);
			System.out.println("준기준기준기info="+info);
			//2. 비즈니스로직<->Service<->DAO<->myBatis<->DB
			MemberDTO memberDTO = memberService.getMemberDetail(info);
			
			//3. Model
			System.out.println("준기준기준기memberDTO="+memberDTO);
			mv.addObject("memberDTO", memberDTO);
			mv.addObject("pageNo", pageNo);
			//4. View
			mv.setViewName("/member/memberDetail");
			return mv;
		}

		/*@RequestParam(value="파라미터명", required=true또는false)
		 * required속성을 생략시  기본값은 true이다
		 * required=true로 지정하면   메서드 호출시  반드시  지정한 이름의 매개변수를  전달해야 한다
		 * 만약 매개변수가 없으면 예외가 발생한다
		 * 
		 * required=false로 지정하면 메서드 호출시  
		 * 지정한 이름의 매개변수를  전달되면 값을 저장하고
		 * 없으면 null를 저장한다
		 */
		//@RequestParam("memberId") String id은
		//이름이 memberId인 파라미터의 값을     String타입의 변수명 id에 저장한다는 의미.
		//요청 url   컨텍스트패스/member/deleteMember.do?memberId=id값
		
		//회원삭제
		@Override
		@RequestMapping(value = "/member/deleteMember.do", method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView deleteMember(
				//@RequestParam(value="memberTel", required=true) String tel,
				//@RequestParam(value="memberGender", required=false) String gender,
				@RequestParam("member_userid") String member_userid,
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			//기존방식  String id = request.getParameter("memberId");
			//이름이 memberId인 파라미터의 값을     String타입의 변수명 id에 저장
			//System.out.println("컨트롤러 요청함수의 매개변수 tel ="+tel);
			//System.out.println("컨트롤러 요청함수의 매개변수 gender ="+gender);
			
			int result = memberService.deleteMember(member_userid);
			System.out.println("컨트롤러 삭제회원수="+result);
			
			//3.Model
			//4.View => 목록보기페이지로 넘어갈 예정=>회원목록보기 요청
			ModelAndView mv = new ModelAndView("redirect:/member/memberList.do");
			return mv;
		}

		//요청url http://localhost/컨텍스트패스/member/loginForm.do
		//로그인폼 보여주기
		@Override
		@RequestMapping("/member/loginForm.do")
		public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String result = request.getParameter("loginResult");
			//기존방식에서는 /member폴더/loginForm.jsp문서를 뜻하는거지만
			//tiles를 이용하면
			//tiles_member.xml에서 정의한
			//<definition name="member/loginForm">에서의
			//name속성값인 "member
			return "/member/loginForm";
		}

		//로그인 처리
		@Override
		@RequestMapping("/member/login.do")
		public ModelAndView login(HttpServletRequest request, 
							HttpServletResponse response,
							@RequestParam Map<String ,Object> memberInfo,
							RedirectAttributes rdAttr) throws Exception {
			//1.파라미터받기
			
			//2.비즈니스로직수행
			MemberDTO memberDTO = memberService.login(memberInfo);
			
			//3.Model
			ModelAndView mv = new ModelAndView();
			//로그인 성공시 세션에 로그인한 유저 정보+sendRedirect이용 회원목록 페이지로 이동
			if(memberDTO!=null) {
				HttpSession session = request.getSession();
				//session.setAttribute(키명, memberDTO.getId());//DTO에서 특정 field만 세션에저장
				//session.setAttribute(키명, memberDTO);//DTO자체를 세션에 저장
				session.setAttribute("MID", memberDTO.getMember_id());
				session.setAttribute("MDTO", memberDTO);
				session.setAttribute("isLogin",true);
				mv.setViewName("redirect:/main.do");
			}else{//로그인 실패시 sendRedirect이용 로그인폼페이지로 이동
				//요청함수의 RedirectAttributes은 이다이렉트시 가져사는 파라미터
				//여기에서는 "loginResult"라는 키명으로
				//String타입의 loginFail 값이 사용되었다.
				rdAttr.addAttribute("loginResult","loginFail");
				mv.setViewName("redirect:/member/loginForm.do");
			}
			//4.View
			return mv;
		}

		//로그아웃
		@Override
		@RequestMapping("/member/loginOut.do")
		public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) throws Exception {
			//로그인을 성공하면 session에 로그인 유저의 정보가 담겨있다.
			//따라서 세션의 정보를 제거한다 세션객체.invalidate()
			//	     세션의 특정 정보를 제거 세션객체.removeAttribute(세션키명)
			/*
			 * 여기에서는
			 * session.setAttribute("MID", memberDTO.getId());
				session.setAttribute("MDTO", memberDTO);
				session.setAttribute("isLogin",true);
			*/
			HttpSession session = request.getSession();
			session.removeAttribute("MID");
			session.removeAttribute("MDTO");
			session.removeAttribute("isLogin");
			
			//메인페이지로 리다이렉트 방식으로 이동
			mv.setViewName("redirect:/main.do");
			return mv;
		}

		@RequestMapping("/member/chgMember.do")
		@Override
		public ModelAndView chgMember(@ModelAttribute MemberDTO memberDTO,HttpServletRequest request, HttpServletResponse response, ModelAndView mv)
				throws Exception {
			System.out.println("memberDTO준기준기"+memberDTO);
			
			memberDTO.setMember_id(Integer.parseInt(request.getParameter("member_id")));
			memberService.chgMember(memberDTO);
			
			mv.setViewName("redirect:/member/memberList.do");
			return mv;
		}
		
		//마이페이지
		@Override
		@RequestMapping("/member/myPage.do")
		public ModelAndView myPage(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv
						) throws Exception {
			
					HttpSession sesseion = request.getSession();
					MemberDTO memberDTO	= (MemberDTO)sesseion.getAttribute("MDTO");
					int member_id = memberDTO.getMember_id();
					MemberDTO memberDto = memberService.myPage(member_id);
					
					
					
					mv.addObject("memberDto", memberDto);
					mv.setViewName("member/myPage");
					return mv;
				}
				
				//마이페이지 : 회원정보수정 폼
				@Override
				@RequestMapping("/member/myPageModifyForm.do")
				public ModelAndView myPageModifyForm(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@RequestParam("member_id")int member_id) throws Exception {
					MemberDTO memberDto = memberService.myPage(member_id);
					
					mv.addObject("memberDto", memberDto);
					mv.setViewName("member/myPageModifyForm");
					return mv;
				}
				//마이페이지 : 회원정보수정
				@Override
				@RequestMapping("/member/myPageModify.do")
				public ModelAndView myPageModify(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@ModelAttribute("memberInfo") MemberDTO memberDto) throws Exception {
					memberService.myPageModify(memberDto);
					
					mv.setViewName("redirect:/member/myPage.do?member_id="+memberDto.getMember_id());
					return mv;
				}
						
				//마이페이지 : 회원탈퇴
				@Override
				@RequestMapping("/member/myPageDelete.do")
				public ModelAndView myPageDelete(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@RequestParam("member_id")int member_id) throws Exception {
					memberService.myPageDelete(member_id);
					
					HttpSession session = request.getSession();
					session.removeAttribute("MID");
					session.removeAttribute("MDTO");
					session.removeAttribute("isLogin");
					
					mv.setViewName("redirect:/movie/movieList.do");
					return mv;
				}		
}
