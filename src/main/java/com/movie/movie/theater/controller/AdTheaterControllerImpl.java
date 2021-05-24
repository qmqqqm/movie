package com.movie.movie.theater.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.theater.dto.BeforeTimeDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.service.AdTheaterService;

@Controller("adTheaterController")
public class AdTheaterControllerImpl implements AdTheaterController{
	
	//파일이 저장되는 (실제)경로
			private static final String CURR_IMAGE_MOVIE_PATH ="C:\\theater";
	
	@Autowired
	private AdTheaterService adTheaterService;
	
	@Autowired 
	private TheaterDTO theaterDTO;
	
	//영화관 리스트
	@Override
	@RequestMapping(value = "/showTheaterList.do") 
	public ModelAndView showTheaterList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터 - 없음
		//2.비즈니스로직수행
		RowDTO rowDTO = new RowDTO(1,10);
		
		List<TheaterDTO> theaterList = adTheaterService.showTheaterList(rowDTO);
		System.out.println("theaterList="+theaterList);
		//3.model
		ModelAndView mv = new ModelAndView("/theater/admin/theaterList");
		
		mv.addObject("theaterList", theaterList);
		//4.view
		return mv;
	}

	//새로운영화관 만들기->form
	@Override
	@RequestMapping("/createTheaterForm.do")
	public ModelAndView  createTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터- 없음
		//2.비즈니스 수행 -1)theater table 에서 지역명을 가져온다.
		List<String> locationList = adTheaterService.getLocation();
		System.out.println(locationList);
		
		//이미지 정보 가져오기
		List<TheaterImageDTO> theaterImageList = adTheaterService.chooseTheImg();
		System.out.println(theaterImageList);
		//3.model
		ModelAndView mv = new ModelAndView("/theater/admin/createTheater");
		mv.addObject("theaterImageList", theaterImageList);
		
		mv.addObject("locationList", locationList);
		//4.view
		return mv;
		
		
	}
	//새로운 영화관 만들기 
	@Override
	@RequestMapping("/createTheater.do")
	public ModelAndView createTheater(HttpServletRequest request, HttpServletResponse response,
										@ModelAttribute("info") TheaterDTO theaterDTO) throws Exception {
		//파라미터받기
		
		/*
		 * String theater_location = request.getParameter("location"); String
		 * theater_name = request.getParameter("name"); String theater_address
		 * =request.getParameter("address"); String theater_phone
		 * =request.getParameter("phone");
		 */
		
		System.out.println("theaterDTO.getImage_id()="+theaterDTO.getImage_id());
		
		//2.비즈니스로직수행
		int result = adTheaterService.createTheater(theaterDTO);
		System.out.println("컨트롤러에서 비즈니스로직결과 result ="+result);
		
		//3.model
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/theater/admin/theaterList");
		//4.view
		return mv;
	}
	
	//영화 삭제하기
	@Override
	@RequestMapping("/deleteTheater.do")
	public ModelAndView deleteTheater(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터 제대로 받았는지 확인하기
		int theater_id = Integer.parseInt(request.getParameter("theater_id"));
		
		System.out.println(theater_id);
		//2.비즈니스 로직 수행
		int result = adTheaterService.deleteTheater(theater_id);
		System.out.println("result" + result);
		
		//3.model
		ModelAndView mv = new ModelAndView("redirect:showTheaterList.do");
		
		//4.view
		return mv;
	}

	//영화 수정하기-폼
	@Override
	@RequestMapping("/modifyTheaterForm.do")
	public ModelAndView modifyTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 파라미터
		int theater_id = Integer.parseInt(request.getParameter("theater_id"));
		
		System.out.println(theater_id);
		
		//2.비즈니스 로직 수행
		TheaterDTO theaterInform = adTheaterService.TheaterInform(theater_id);
		System.out.println(theaterDTO.toString());
		//이미지정보 가져오기
		List<TheaterImageDTO> theaterImageList = adTheaterService.chooseTheImg();
		List<String> locationList = adTheaterService.getLocation();
	
		//3.model
		ModelAndView mv = new ModelAndView("/theater/admin/modifyTheater");
		mv.addObject("theaterInform", theaterInform);
		mv.addObject("locationList", locationList);
		mv.addObject("theaterImageList", theaterImageList);
		//4.view
		return mv;

	}

	//영화 수정하기
	@Override
	@RequestMapping("/modifyTheater.do")
	public ModelAndView modifyTheater(HttpServletRequest request, HttpServletResponse response
					,@ModelAttribute("newInfo") TheaterDTO theaterDTO) throws Exception {
		//1.파라미터
		System.out.println(theaterDTO.toString());
		
		//2.비즈니스
		int result = adTheaterService.modifyTheater(theaterDTO);
		System.out.println("컨트롤러에서 비즈니스로직결과 result ="+result);
	
		//3.model
		ModelAndView mv = new ModelAndView("redirect:showTheaterList.do");
		
		//4.view
		return mv;
	}

	//극장이미지 추가페이지 보여주기
	@Override
	@RequestMapping("/theaterImage.do")
	public ModelAndView theaterImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/theaterImage");
		return mv;
	}
	
	//극장이미지 파일 업로드
	@RequestMapping(value = "/admin/theaterImagePlus.do", method = RequestMethod.POST)
	@Override
	public ModelAndView addTheaterImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8"); //인코딩설정
		String imageFileName; //이미지 파일이름을 저장하기 위한 변수
		List<TheaterImageDTO> theaterImageList = new ArrayList<TheaterImageDTO>();
		Iterator<String> it = multipartRequest.getFileNames();
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("MDTO");
		String reg_name = memberDTO.getMember_name();
		
		while(it.hasNext()) {
			TheaterImageDTO theaterImageDTO = new TheaterImageDTO();
			String name = it.next();
			MultipartFile mFile = multipartRequest.getFile(name);
			String originalFilename = mFile.getOriginalFilename();
			theaterImageDTO.setFilename(originalFilename);
			theaterImageDTO.setReg_name(reg_name);
			theaterImageList.add(theaterImageDTO);
			
			//-----------------------------
			File file =new File(CURR_IMAGE_MOVIE_PATH+"\\"+name); //실제로 파일이나 폴더가 생성되는 것은 아니다 createNewFile()통해 생성
			  if(mFile.getSize()!=0) {//첨부된 파일이 존재하면
				  if(!file.exists()) {//파일이 존재하지 않는다면 
					  if(file.getParentFile().mkdir()) {//부모디렉토리 생성 , 
						  								//getParentFile() : 부모 폴더를 File 형태로 리턴한다.
						  								//mkdir() 보다 상위의 디렉터리가 존재하지 않을 경우, 만드려고하는 폴더의 이름이 이미존재 -> 디렉터리 생성 못하고 false를 반환 합니다.
						  //파일생성
						  file.createNewFile(); //실제로 파일 생성 ?? 왜 하는 것일까(이해x)
					  }
				  }
				  //생성한 파일을 실제파일로 temp폴더에 전송
				  /*Transfer the received file to the given destination file. 
				   *This may either move the file in the filesystem, copy the file in thefilesystem, or save memory-held contents to the destination file.If the destination file already exists, it will be deleted first.*/
				  mFile.transferTo(new File(CURR_IMAGE_MOVIE_PATH+"\\"+"temp"+"\\"+originalFilename));
			  }
		}//while
		
		//----------------------------------------
		try {//입력성공시
			//2.비즈니스로직 <->Service <->DAO <->MyBatis<->DB
			//상품정보 + 이미지파일들 정보를 Map담아 호출했고
			//그 결과로 입력시 사용된 goods_id를 반환 받는다
			adTheaterService.addTheaterImage(theaterImageList);
			
			//파일의 개수만큼 이미지 파일 저장소에 상품id명과 동일한 폴더를 생성하고 + 그 하위에 파일을 생성
			if(theaterImageList!=null&&theaterImageList.size()!=0) {
				for(TheaterImageDTO TheaterImageDTO: theaterImageList) {
					System.out.println(TheaterImageDTO.getImage_id());
					imageFileName = TheaterImageDTO.getFilename();
					File srcFile = new File(CURR_IMAGE_MOVIE_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_MOVIE_PATH+"\\"+TheaterImageDTO.getImage_id());
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}//if
		}catch (Exception e) {//입력 실패시
			
			//해당 파일을 삭제
			if(theaterImageList!=null&&theaterImageList.size()!=0) {
				for(TheaterImageDTO imageFileDTO: theaterImageList) {
					imageFileName = imageFileDTO.getFilename();
					File srcFile = new File(CURR_IMAGE_MOVIE_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}//if
			
			e.printStackTrace();
		}//catch
		
		
		//4.View
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/theaterImage.do");
		return mv;
	}
	
	//상영시간표 제작 
		@Override
		@RequestMapping("/createTimesForm.do")
		public ModelAndView createTimesForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			// 2. 비즈니스 로직
			//2-1. 영화 정보 가져오기
			List<MovieDTO> movieList = adTheaterService.movieList();
			System.out.println(movieList);
			//2-2. 극장 및 상영관 정보 가져오기
			List<String> locationList = adTheaterService.getLocation();
			List<TheaterDTO> theaterList = adTheaterService.showTheaterList();

			ModelAndView mv = new ModelAndView();
			mv.addObject("movieList", movieList);
			mv.addObject("locationList", locationList);
			mv.addObject("theaterList", theaterList);
			mv.setViewName("/theater/admin/createTimes");
			
			return mv;
		}

		  @Override
		  @RequestMapping("/adsangygInform.do")
		  public @ResponseBody Map<String, Object> sangygInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  //1.파라미터
		  int theater_id = Integer.parseInt(request.getParameter("theater_id"));
		  System.out.println(theater_id);
		  
		  List<SangygDTO> sangyg = adTheaterService.sangygInform(theater_id);
		  
		  //3.
		  Map<String, Object> sangyginform = new HashMap<String,Object>();
		  sangyginform.put("sangyg", sangyg);
		 
		  return sangyginform; 
		  }

		@Override
		@RequestMapping("/createTimes.do")
		public ModelAndView createTimes(HttpServletRequest request, HttpServletResponse response, TheaterDTO theaterDTO) throws Exception {
			//1.파라미터 받기
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			int theater_id =Integer.parseInt( request.getParameter("theater_id"));
			int sangyg_id = Integer.parseInt(request.getParameter("sangyg_id"));
			int times_seat = Integer.parseInt(request.getParameter("sangyg_seat"));
			String day = request.getParameter("day");
			String hh = request.getParameter("hh");
			String mm = request.getParameter("mm");
			String before = day + " " + hh +":"+ mm + ":00";
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date times_time = fm.parse(before);

			BeforeTimeDTO beforeDTO = new BeforeTimeDTO(sangyg_id,theater_id,movie_id,times_seat,times_time);
			
			adTheaterService.createTimeT(beforeDTO);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:createTimesForm.do");
			return mv;
		}

		@Override
		@RequestMapping("/timeList.do")
		public ModelAndView timesList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("contoller 싷행");
			//파라미터 받기
			int theater_id = Integer.parseInt(request.getParameter("theater_id"));
			String theater_name= request.getParameter("theater_name");
			
			//비즈니스
			//영화관 id 에 따른 상영시간표 정보 가져오기
			List<TimesDTO> times = adTheaterService.timesList(theater_id);
			System.out.println(times);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/theater/admin/timesList");
			mv.addObject("theater_name", theater_name);
			mv.addObject("times", times);
			
			return mv;	
			
		}

		//times 삭제하기
		@Override
		@RequestMapping("/deleteTimes.do")
		public ModelAndView deleteTimes(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("컨트롤러~");
			//1.파라미터 제대로 받았는지 확인하기
			String time= request.getParameter("times_id");
			System.out.println(time);
			
			int times_id = Integer.parseInt(time);
			System.out.println(times_id);
			//2.비즈니스 로직 수행
			adTheaterService.deleteTimes(times_id);
			
			System.out.println("실행됨");
			//3.model
			ModelAndView mv = new ModelAndView("redirect:/showTheaterList.do");
			
			//4.view
			return mv;
		}			

	  @Override
	  @RequestMapping("/moreTheaterInform.do")
	  public @ResponseBody Map<String, Object> moreTheaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 
	  //1.파라미터받기
	  int startCnt = Integer.parseInt(request.getParameter("startCnt"));
	  int viewCnt = Integer.parseInt(request.getParameter("viewCnt"));
	  
	  System.out.println(startCnt);
	  System.out.println(viewCnt);
	  
	  RowDTO rowDTO = new RowDTO(startCnt+1,startCnt+viewCnt);
		
	  List<TheaterDTO> theaterList = adTheaterService.showTheaterList(rowDTO);
	  System.out.println("theaterList="+theaterList);
	  
	  //3.
	  Map<String, Object> theaterinform = new HashMap<String,Object>();
	  theaterinform.put("theaterList", theaterList);
	  return theaterinform; 
	  }

}
