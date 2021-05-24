package com.movie.movie.board.boardController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.board.boardDTO.BoardDTO;
import com.movie.movie.board.boardService.BoardService;

@Controller
public class BoardControllerImpl{
	@Inject
	BoardService boardService;
	
	//게시글 등록
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception{
		List<BoardDTO> list = boardService.listAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/list");
		mv.addObject("list", list);
		
		return mv;
	}
	//게시글 작성 화면
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() {
		return "/board/write";
	}
	//게시글 작성처리
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardDTO dto) throws Exception{
		boardService.create(dto);
		return "redirect:list.do";
	}
	//게시글 상세조회, 조회수 증가 처리
	@RequestMapping(value="view.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception{
		
		//모델+뷰 전달 객체
		ModelAndView mv = new ModelAndView();
		//뷰이름
		mv.setViewName("/board/view");
		//뷰에 전달할 데이터
		mv.addObject("dto", boardService.read(bno));
		return mv;
	}
	//게시글 수정
	//폼에서 입력한 내용들은 @ModelAttribute BoardDTO dto로 전달
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO dto) throws Exception{
		boardService.update(dto);
		return "redirect:/list.do";
	}
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:/list.do";
	}
}
