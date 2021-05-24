/**
 * 
 */
package com.movie.movie.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;
import com.movie.movie.service.MovieService;

@Controller("movieController")
public class MovieControllerImpl implements MovieController {

	@Autowired
	MovieService movieService;
	
	//이미지저장소 - 파일 저장위치
	private static final String CURR_IMAGE_REPO_PATH = "C:\\movie\\imgFile";
	
	//영화리스트
	@Override
	@RequestMapping("/movie/movieList.do")
	public ModelAndView movieList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws Exception {
		List<MovieDto> mvList =movieService.movieList();
		mv.addObject("mvList", mvList);
		mv.setViewName("movie/movieList");
		
		
		HttpSession session = request.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("MDTO");
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		mv.addObject("memberDto", memberDto);
		mv.addObject("isLogin", isLogin);
		
		
		return mv;
	}
	
	//영화상세보기
	@Override
	@RequestMapping("/movie/movieDetail.do")
	public ModelAndView movieDetail(HttpServletRequest request, HttpServletResponse response, 
									ModelAndView mv, 
									@RequestParam(value = "movie_id",required=true) int movie_id
											) throws Exception {
		
		 Map<String,Object> map =movieService.movieDetail(movie_id);
		/*
		 *   영화상세보기("movieDetail", movieDetail); 
		 *  영화정보 map.put("movieInfo", movieInfo);
		 *  movieDetailImg
		 */
		mv.addObject("map", map);
		mv.setViewName("movie/movieDetail");
		
		HttpSession session = request.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("MDTO");
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		mv.addObject("memberDto", memberDto);
		mv.addObject("isLogin", isLogin);
		
		return mv;
	}
	
	//영화수정폼
	@Override
	@RequestMapping("/movie/movieModifyForm.do")
	public ModelAndView movieModifyForm(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, @RequestParam(value = "movie_id",required=true) int movie_id) throws Exception {
		
		Map<String,Object> map =movieService.movieDetail(movie_id);
		mv.addObject("map", map);
		mv.setViewName("movie/movieModifyForm");
		return mv;
	}

	//영화수정
	@Override
	@RequestMapping("/movie/movieMoidfy.do")
	public ModelAndView movieModify(HttpServletRequest request, HttpServletResponse response, 
				@ModelAttribute("info") MovieDto movieDto, 
				@RequestParam("MainFile") MultipartFile MainFile,
				@RequestParam("SubFile") MultipartFile[] SubFile,
				@RequestParam("sub_movieImage_fileName") String[] sub_movieImage_fileName,
				ModelAndView mv)
			throws Exception {
		movieService.movieModify(movieDto);
		int movie_id = movieDto.getMovie_id();
		String movieImage_fileName = movieDto.getMovieImage_fileName();
		
		Map<String,Object> map =movieService.movieDetail(movie_id);
		mv.addObject("map", map);
		
		//메인사진 삭제
		File file = new File(CURR_IMAGE_REPO_PATH+"\\"+movie_id+"\\"+movieImage_fileName);
		        
    	if( file.exists() ){
    		if(file.delete()){
    			System.out.println("파일삭제 성공");
    		}else{
    			System.out.println("파일삭제 실패");
    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
    	
    	//메인이미지 업로드
    	String path = CURR_IMAGE_REPO_PATH+"\\"+movie_id; 
		File Folder = new File(path);

		
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
	         else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}//if (!Folder.exists()) {
		
		if(!MainFile.isEmpty()) {
			String mExt = MainFile.getOriginalFilename().substring(MainFile.getOriginalFilename().lastIndexOf("."));
			String mName = movieDto.getMovie_title()+"_"+"main"+mExt;
			
			if(!MainFile.getOriginalFilename().isEmpty()) {
				MainFile.transferTo(new File(path, mName));
			}
		}
		

		System.out.println("sub_movieImage_fileName[0]"+sub_movieImage_fileName[0]);
		System.out.println("sub_movieImage_fileName[1]"+sub_movieImage_fileName[1]);
			//서브사진 삭제
			for(int n=0; n<sub_movieImage_fileName.length; n++) {
				file = new File(CURR_IMAGE_REPO_PATH+"\\"+movie_id+"\\"+sub_movieImage_fileName[n]);
				        
		    	if( file.exists() ){
		    		if(file.delete()){
		    			System.out.println("파일삭제 성공");
		    			movieService.movieImageDelete(sub_movieImage_fileName[n],movie_id);
		    		}else{
		    			System.out.println("파일삭제 실패");
		    		}
		    	}else{
		    		System.out.println("파일이 존재하지 않습니다.");
		    	}
			}
	
			//서브이미지파일 네임 설정
			List<MovieDto> movieDetailImg = (List<MovieDto>) map.get("movieDetailImg");
			MovieDto subFileName = movieDetailImg.get(0);
			
			/*String num = subFileName.getMovieImage_fileName().substring(subFileName.getMovieImage_fileName().lastIndexOf("b")+1,subFileName.getMovieImage_fileName().lastIndexOf("b")+2);
			int i = Integer.parseInt(num)+1;*/
			System.out.println(subFileName.getMovieimage_id());
			int i = subFileName.getMovieimage_id()+1;
			
			//서브파일 업로드
			List<Object> subName = new ArrayList<Object>();
			
				for(MultipartFile img : SubFile) {
					if(!img.isEmpty()) {
						String sExt = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
						String sName = movieDto.getMovie_title()+"_"+"sub"+i+sExt;
						
						subName.add(sName);
						
						if(!img.getOriginalFilename().isEmpty()) {
							img.transferTo(new File(path, sName));
						}
						i++;
					
					}
			}
		movieService.movieImageModify(subName,movie_id);
		
			
			
			


		
		mv.setViewName("redirect:/movie/movieDetail.do?movie_id="+movie_id);
		
		return mv;
	}

	//영화삭제
	@Override
	@RequestMapping("/movie/movieDelete.do")
	public ModelAndView movieDelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, 
									@RequestParam(value = "movie_id",required=true) String movie_id) throws Exception{
		
		movieService.movieDelete(movie_id);
		mv.setViewName("redirect:/movie/movieList.do");
		return mv;
	}
	
	//영화작성 폼
	@Override
	@RequestMapping("/movie/movieWriteForm.do")
	public String movieWriteForm(HttpServletRequest request, HttpServletResponse response
			) throws Exception{

	return "movie/movieWriteForm";
	}
	
	//영화작성
	@RequestMapping("/movie/movieWrite.do")
	public ModelAndView movieWrite(HttpServletRequest request, HttpServletResponse response, 
												ModelAndView mv, 
												@RequestParam("MainFile") MultipartFile MainFile,
												@RequestParam("SubFile") MultipartFile[] SubFile,
												@ModelAttribute("movieInfo") MovieDto movieDto
												) throws Exception{
	
		
		//영화정보 작성
		 movieService.movieWrite(movieDto);
		 
		 //영화아이디 얻어오기
		int movie_id=movieService.selectMovie_id(movieDto.getMovie_title());
		
		
		//폴더 경로
		String path = CURR_IMAGE_REPO_PATH+"\\"+movie_id; 
		File Folder = new File(path);

		
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
	         else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		Map<String,Object> mainMap = new HashMap<String,Object>();
		
			String mExt = MainFile.getOriginalFilename().substring(MainFile.getOriginalFilename().lastIndexOf("."));
			String mName = movieDto.getMovie_title()+"_"+"main"+mExt;
			
			if(!MainFile.getOriginalFilename().isEmpty()) {
				MainFile.transferTo(new File(path, mName));
			}
			mainMap.put("mName", mName);
			mainMap.put("movie_id", movie_id);
			
		
		int i=1;
		List<Object> subName = new ArrayList<Object>();
		
		for(MultipartFile img : SubFile) {
			
			String sExt = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
			String sName = movieDto.getMovie_title()+"_"+"sub"+i+sExt;
			
			subName.add(sName);
			
			if(!img.getOriginalFilename().isEmpty()) {
				img.transferTo(new File(path, sName));
			}
			i++;
		}
		
		 movieService.movieImageWrite(subName,movie_id,mainMap);
		
		
		mv.setViewName("redirect:/movie/movieList.do");
		return mv;
	}

	//메인
	@Override
	@RequestMapping("/movie/main.do")
	public String main(HttpServletRequest request, HttpServletResponse response
				) throws Exception{
	
		return "main";
	}
	
	//영화주요정보 입력 폼
	@Override
	@RequestMapping("/movie/mainInfoWriteForm.do")
	public ModelAndView mainInfoWriteForm(HttpServletRequest request, HttpServletResponse response
			) throws Exception{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/movie/movieList.do");
	return mv;
}
	//리뷰입력폼
	@Override
	@RequestMapping("/movie/reviewWriteForm.do")
	public ModelAndView reviewWriteForm(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "movie_id",required=true) String movie_id, ModelAndView mv) throws Exception{
		
		HttpSession session = request.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("MDTO");
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		mv.addObject("memberDto", memberDto);
		mv.addObject("isLogin", isLogin);
		
		
		
		mv.addObject("movie_id",movie_id);
		mv.setViewName("movie/reviewWriteForm");
		return mv;
	}

	//리뷰작성
	@Override
	@RequestMapping("/movie/reviewWrite.do")
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("reviewInfo") ReviewDto reviewDto,
			ModelAndView mv) throws Exception{
		
		movieService.reviewWrite(reviewDto);
		mv.setViewName("redirect:/movie/movieDetail.do?movie_id="+reviewDto.getMovie_id());
		return mv;
	}
	
	
	//리뷰리스트
	@Override
	@RequestMapping("/movie/reviewList.do")
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response, 
									ModelAndView mv, 
									PagingDto pagingDto,
									@RequestParam(value = "movie_id",required=true) int movie_id,
									@RequestParam(value="nowPage", required=false)String nowPage,
									@RequestParam(value="cntPerPage", required=false)String cntPerPage
											) throws Exception {
		//리뷰숫자
		int total = movieService.reviewCount(movie_id);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pagingDto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), movie_id);
		List<ReviewDto> review= movieService.review(pagingDto);
		int review_grade=0;
		
		/* 리뷰 평균점수
		 * for(int i=0; i<review.size(); i++) { ReviewDto reveiews = review.get(i);
		 * review_grade += Integer.parseInt(reveiews.getReview_grade()); }
		 * review_grade=review_grade/total; mv.addObject("review_grade",review_grade);
		 */
		
		mv.addObject("paging", pagingDto);
		mv.addObject("review", review);
		mv.addObject("movie_id", movie_id);
		
		
		HttpSession session = request.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("MDTO");
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		mv.addObject("memberDto", memberDto);
		mv.addObject("isLogin", isLogin);
		
		mv.setViewName("movie/reviewList");
		return mv;
	}
	
	//리뷰수정폼
	@Override
	@RequestMapping("/movie/reviewModifyForm.do")
	public ModelAndView reviewModifyForm(HttpServletRequest request, HttpServletResponse response, 
					@RequestParam(value="review_id", required=false)int review_id
			) throws Exception{

		ReviewDto reviewDto = movieService.reviewModifyForm(review_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewDto",reviewDto);
		mv.setViewName("movie/reviewModifyForm");
	return mv;
}
	
	//리뷰 수정하기
	@Override
	@RequestMapping("/movie/reviewModify.do")
	public ModelAndView reviewModify(HttpServletRequest request, HttpServletResponse response, 
				@ModelAttribute("reviewInfo") ReviewDto reviewDto
			) throws Exception{

		movieService.reviewModify(reviewDto);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/movie/movieDetail.do?movie_id="+reviewDto.getMovie_id());
	return mv;
}
	
	//리뷰 삭제하기
	@Override
	@RequestMapping("/movie/reviewDelete.do")
	public ModelAndView reviewDelete(HttpServletRequest request, HttpServletResponse response, 
					@RequestParam(value="review_id", required=false)int review_id,
					@RequestParam(value="movie_id", required=false)int movie_id
			) throws Exception{

		movieService.reviewDelete(review_id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/movie/movieDetail.do?movie_id="+movie_id);
	return mv;
}
	
}
	
	
			
	
	


	
	


