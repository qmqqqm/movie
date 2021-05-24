package com.movie.movie.event.common.base;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movie.movie.event.dto.EventImageDTO;

public abstract class BaseController  {
	
	//이미지저장소
	private static final String CURR_IMAGE_REPO_PATH = "C:\\event";
	
	//다중파일업로드
	protected List<EventImageDTO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		//파일정보를 저장할 List생성
		List<EventImageDTO> fileList = new ArrayList<EventImageDTO>();
		
		//업로드 된 파일들의 이름 목록을 구하여 fileNames에 저장
		Iterator<String> fileNames = multipartRequest.getFileNames();
		//파일의 개수만큼 반복해서 파일의 정보(ImageFileDTO)를  List에 추가
		while(fileNames.hasNext()) {
			EventImageDTO  eventImageDTO = new EventImageDTO();
			String fileName = fileNames.next();
			
			//필요시 DTO에 setter()이용
			eventImageDTO.setEvent_image_filetype(fileName); // 이미지종류  main_image,detail_image1,...
			
			//fileName에 대한 MultipartFile객체를 가져오기
			//업로드된 파일들 중  파라미터이름이 fileName인  파일정보를 가져와 mFile에 저장한다
			MultipartFile mFile = multipartRequest.getFile(fileName);
			//원래이름을 가져와 originalFilename에 저장
			String originalFilename = mFile.getOriginalFilename();
			//이미지파일명에 setting
			eventImageDTO.setEvent_image_filename(originalFilename); 
			
			fileList.add(eventImageDTO); //파일정보목록에 추가
			
			//-----------
			//이미지저장소에 담을 파일객체생성
			//자바에서는  폴더를 만들때에도  new File("폴더명")
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if( mFile.getSize()!=0  ) { //첨부된 파일이 존재하면
				if( !file.exists()  ) {//존재하지않는다면
					if(  file.getParentFile().mkdirs() ) { //경로에 해당하는 디렉토리들을 생성
						file.createNewFile();//파일생성
					}
				}
				//생성한 파일을 실제파일로 temp폴더에  전송
				/*Transfer the received file to the given destination file. 
					This may either move the file in the filesystem, 
					copy the file in the filesystem, 
					or save memory-held contents to the destination file.
					 If the destination file already exists,
					  it will be deleted first. */
				mFile.transferTo(new File( CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+originalFilename ));
			}//if
			
		}//while
		
		return fileList;//첨부파일정보가 저장된 fileList를 리턴
	}//upload
	
	//다중파일업로드
	protected List<Map<String, Object>> update(MultipartHttpServletRequest multiReq, Map map) throws Exception {
		//파일정보를 저장할 List생성
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		
		String event = map.get("event_id").toString();
		int event_id = Integer.parseInt(event);
		System.out.println(event_id);
		//업로드 된 파일들의 이름 목록을 구하여 fileNames에 저장
		Iterator<String> fileNames = multiReq.getFileNames(); //0->main_image , detail_image1,/..
		System.out.println(fileNames);
		//파일의 개수만큼 반복해서 파일의 정보(ImageFileDTO)를  List에 추가
		Map<String, Object> fileMap =null;
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			System.out.println(fileName);
			//fileName에 대한 MultipartFile객체를 가져오기
			//업로드된 파일들 중  파라미터이름이 fileName인  파일정보를 가져와 mFile에 저장한다
			MultipartFile mFile = multiReq.getFile(fileName);
			System.out.println(mFile);
			//파일이 변경이 되는경우 - input type="file" 내용이 존재 
			if(mFile.isEmpty() == false) {
				System.out.println("여긴");
				//새로 정보 추가하기 -> fileList에 담기
				String event_image_filename = mFile.getOriginalFilename();
				String event_image_filetype = fileName;
				
				fileMap = new HashMap<String,Object>();
				fileMap.put("event_id", event_id); //event_id 담기
				fileMap.put("event_image_filename", event_image_filename);//파일 이름 담기
				fileMap.put("event_image_filetype",  event_image_filetype);//파일 타입 담기
				fileMap.put("IS_NEW", 'y');
				fileList.add(fileMap);
				System.out.println("1");
				
				//파일에 담아야해!!
				File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
				if( mFile.getSize()!=0  ) { //첨부된 파일이 존재하면
					if( !file.exists()  ) {//존재하지않는다면
						if(  file.getParentFile().mkdirs() ) { //경로에 해당하는 디렉토리들을 생성
							file.createNewFile();//파일생성
						}
					}
					mFile.transferTo(new File( CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+event_image_filename));
				}//if
				
			}else { 
				System.out.println("여긴2");
				String requestName = mFile.getName(); //input 태그 name
				
				if(map.containsKey(requestName) == true && map.get(requestName) != null) {
					fileMap = new HashMap<String,Object>();
					fileMap.put("event_image_id", Integer.parseInt(map.get(requestName).toString()));
					fileMap.put("IS_NEW", 'n');
					fileList.add(fileMap);
					System.out.println("2");
				}	
			}
		
		}
		System.out.println(fileList);
		return fileList;//첨부파일정보가 저장된 fileList를 리턴
	}//update
	
	protected void deleteFile(String fileName, int event_id) {
		File file =new File(CURR_IMAGE_REPO_PATH+"\\"+ event_id +"\\"+fileName);
		try{
			file.delete();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
//	@RequestMapping(value="/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	protected  ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName=(String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView(viewName);
//		return mav;
//	}
	
	
	protected String calcSearchPeriod(String fixedSearchPeriod){
		String beginDate=null;
		String endDate=null;
		String endYear=null;
		String endMonth=null;
		String endDay=null;
		String beginYear=null;
		String beginMonth=null;
		String beginDay=null;
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal=Calendar.getInstance();
		
		endYear   = Integer.toString(cal.get(Calendar.YEAR));
		endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		endDay   = df.format(cal.get(Calendar.DATE));
		endDate = endYear +"-"+ endMonth +"-"+endDay;
		
		if(fixedSearchPeriod == null) {
			cal.add(cal.MONTH,-4);
		}else if(fixedSearchPeriod.equals("one_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -7);
		}else if(fixedSearchPeriod.equals("two_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -14);
		}else if(fixedSearchPeriod.equals("one_month")) {
			cal.add(cal.MONTH,-1);
		}else if(fixedSearchPeriod.equals("two_month")) {
			cal.add(cal.MONTH,-2);
		}else if(fixedSearchPeriod.equals("three_month")) {
			cal.add(cal.MONTH,-3);
		}else if(fixedSearchPeriod.equals("four_month")) {
			cal.add(cal.MONTH,-4);
		}
		
		beginYear   = Integer.toString(cal.get(Calendar.YEAR));
		beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		beginDay   = df.format(cal.get(Calendar.DATE));
		beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		
		return beginDate+","+endDate;
	}
	
}
