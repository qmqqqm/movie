package com.movie.movie.event.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.event.common.base.BaseController;
import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;
import com.movie.movie.event.service.AdEventService;

@Controller("adEventController")
public class AdEventControllerImpl extends BaseController implements AdEventController{

	
	private static final String EVENT_IMAGE_FILE_PATH = "C:\\event";
	
	@Autowired
	AdEventService adEventService;
	
	
	@Override
	@RequestMapping("/adEventList.do")
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		List<String> categoryList = adEventService.categoryList();
		System.out.println(categoryList);
		
		Map<String, Object> eventMap = adEventService.eventList(categoryList);
		System.out.println(eventMap);
		
		
		//3.model
		ModelAndView mv = new ModelAndView();
		mv.addObject("categoryList", categoryList);
		mv.addObject("eventMap", eventMap);

		mv.setViewName("/event/admin/eventList");
		//4.view
		return mv;
	}

	
	@Override
	@RequestMapping("/createEventForm.do")
	public String createEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/event/admin/createEvent";
	}

	//�씠踰ㅽ듃 �옉�꽦�븯湲�(湲� �벑濡� + �씠誘몄� �벑濡�)
	@Override
	@RequestMapping(value="/createEvent.do", method= {RequestMethod.POST})
	public ResponseEntity createEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		System.out.println("createEvent");
		multipartRequest.setCharacterEncoding("utf-8"); //�씤肄붾뵫�꽕�젙
		String imageFileName = null;  //�씠誘몄��뙆�씪�씠由꾩쓣 ���옣�븯湲� �쐞�븳 蹂��닔
		
		//1. �뙆�씪誘명꽣 媛��졇�삤湲�
		Map newEventMap = new HashMap(); // �씠踰ㅽ듃�쓽 �궗吏꾧낵 �젙蹂� ���옣
		
		//1-1.�옉�꽦�옄 愿��젴 �쉶�썝 �젙蹂� 媛��졇�삤湲�
		String reg_id = "admin"; //�굹以묒뿉 memberdto �뿰寃곕릺硫� �닔�젙�븯湲�
		
		//1-2.湲� 愿��젴
		Enumeration enu = multipartRequest.getParameterNames(); 
		while( enu.hasMoreElements() ) {
			//媛��졇�삩 �뙆�씪誘명꽣�씠由꾩쓣 �씠�슜�빐�꽌  媛믪쓣 媛��졇�삩�떎
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newEventMap.put(name, value);//map�뿉 異붽�: �궎媛믪� �뙆�씪誘명꽣紐�, 媛믪� �떎�젣媛�
    	} 
		
		System.out.println("newEvent="+ newEventMap);
		
		List<EventImageDTO> eventImageList = upload(multipartRequest);
		if( eventImageList!=null && eventImageList.size()!=0 ) { //泥⑤��씠誘몄��뱾�씠 �엳�쑝硫�
			newEventMap.put( "eventImageList", eventImageList);//map�뿉 異붽�
		}
		System.out.println(newEventMap.toString());
		System.out.println(newEventMap);
		//2.鍮꾩쫰�땲�뒪濡쒖쭅 & 3. Model
		//�긽�뭹�젙蹂� + �씠誘몄��뙆�씪�뱾 �젙蹂대�� Map�떞�븘 �샇異쒗뻽怨�
		//洹� 寃곌낵濡� �엯�젰�떆 �궗�슜�맂 goods_id瑜� 諛섑솚諛쏅뒗�떎
		ResponseEntity resEntity = null; 
		String message = null; //硫붿꽭吏� -�뿬湲곗뿉�꽌�뒗 javascript肄붾뱶
		HttpHeaders responseHeaders = new HttpHeaders(); //�뿤�뜑�젙蹂�
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		try { 
			int event_id = adEventService.insertEvent(newEventMap);

			if(  eventImageList!=null && eventImageList.size()!=0 ) {
				for( EventImageDTO eventImageDTO  : eventImageList  ) {
					 imageFileName = eventImageDTO.getEvent_image_filename();
					 File srcFile = new File(EVENT_IMAGE_FILE_PATH+"\\"+"temp"+"\\"+imageFileName);
					 File destDir = new File(EVENT_IMAGE_FILE_PATH+"\\"+event_id);
					 FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}//if
			
			//�쓳�떟�쑝濡� 蹂대궪 script�깮�꽦
			message = "<script>";
			message += "		alert('이벤트 등록 성공!!.');";
									//alert李쎌쓽 �솗�씤踰꾪듉�겢由��썑  �깉�긽�뭹 �벑濡앹갹�쑝濡� (�떎�떆 �릺�룎�븘�샂) �씠�룞
			message += "		location.href='"+multipartRequest.getContextPath()+"/createEventForm.do';";   
			message += "</script>";
		}catch(Exception e) { //�엯�젰�떎�뙣�떆
			
			//�빐�떦�뙆�씪�쓣 �궘�젣
			if(  eventImageList!=null && eventImageList.size()!=0 ) {
				for( EventImageDTO eventImageDTO  : eventImageList  ) {
					 imageFileName = eventImageDTO.getEvent_image_filename();
					 File srcFile = new File(EVENT_IMAGE_FILE_PATH+"\\"+"temp"+"\\"+ imageFileName);
					 srcFile.delete();
				}
			}//if
			
			//�쓳�떟�쑝濡� 蹂대궪 script�깮�꽦
			message = "<script>";
			message += "		alert('이벤트 등록 실패! please retry');";
									//alert李쎌쓽 �솗�씤踰꾪듉�겢由��썑  �깉�긽�뭹 �벑濡앹갹�쑝濡� (�떎�떆 �릺�룎�븘�샂) �씠�룞
			message += "		location.href='"+multipartRequest.getContextPath()+"/createEventForm.do';";   
			message += "</script>";
			
			//肄섏넄�뿉 �솗�씤�슜
			e.printStackTrace();
	}//catch
 	
	//4. View
	resEntity = new ResponseEntity(message,responseHeaders, HttpStatus.OK);
	
	return resEntity;
	}

	//이벤트 삭제하기
	@Override
	@RequestMapping("/deleteEvent.do")
	public ModelAndView deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 파라미터 
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		
		//2. 비즈니스 수행
		adEventService.deleteEvent(event_id);
		
		//3.모델 & 4.view
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:adEventList.do");
		
		return mv;
	}

	@Override
	@RequestMapping("/modifyEventForm.do")
	public ModelAndView  modifyEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 파라미터 
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		
		//2. 비즈니스 수행
		List<String> categoryList = adEventService.categoryList();
		System.out.println(categoryList);
		
		Map eventMap = adEventService.eventInform(event_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("eventMap", eventMap);
		mv.addObject("categoryList", categoryList);
		
		mv.setViewName("/event/admin/modifyEvent");
		return mv;
	}

	@Override
	@RequestMapping(value = "/modifyEventInfo.do", method= {RequestMethod.POST})
	public ModelAndView  modifyEventInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		System.out.println("controller실행되유~");
		multipartRequest.setCharacterEncoding("utf-8");
		//1.파라미터받기
		Map newEventMap = new HashMap(); 
		
		Enumeration enu = multipartRequest.getParameterNames(); //file 뺴고 나머지 정보 저장
		while( enu.hasMoreElements() ) {
			String name = (String)enu.nextElement();
			Object value = (Object) multipartRequest.getParameter(name);
			newEventMap.put(name, value);
    	} 
		
		System.out.println(newEventMap); //file 뺸 나머지 정보 담겨져 있음.
		
		//삭제할거 먼저 삭제 한뒤에 수정해야되는것 같은데...?
		
		adEventService.modifyEvent(newEventMap); //event 테이블 update 하러가기! 및 del 컬럼값 다 y로 변경
		System.out.println("변경까지 마무리");
		List<Map<String, Object>> list = update(multipartRequest,newEventMap); // eventImage 관련 업무 처리하기
	
		
		try {
			 Map<String,Object> temp = null;
			    for(int i = 0; i<list.size();i++) {
			        temp = list.get(i);
			         
			        if(temp.get("IS_NEW").toString().equals("y")) {
					System.out.println("new");
					adEventService.insertFile(temp); //새로 파일을 담는다.
					File srcFile = new File(EVENT_IMAGE_FILE_PATH+"\\"+"temp"+"\\"+temp.get("event_image_filename"));
					File destDir = new File(EVENT_IMAGE_FILE_PATH+"\\"+temp.get("event_id"));
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				else {
					System.out.println("new1");
					adEventService.updateFile(temp);
				}
			}
		
		}catch(Exception e) {//수정관련 작업 실패시
			
				for(Map<String, Object> temp : list) {
					if(temp.get("IS_NEW").equals("y")) {
						File srcFile = new File(EVENT_IMAGE_FILE_PATH+"\\"+"temp"+"\\"+temp.get("event_image_filename"));
						srcFile.delete();
				
					}//if
			
			e.printStackTrace();
				}
		}//catch
		
		int event_id  = Integer.parseInt(newEventMap.get("event_id").toString());
		System.out.println(event_id);
		//del 컬럼값이 y인 아이들은 다 삭제하기 및 파일에서도 
		List<String> nameList = adEventService.selectdel(event_id);
		for(String temp : nameList) {
			deleteFile(temp,event_id);
		}
		adEventService.deleteEventDel(event_id);
		ModelAndView mv = new ModelAndView("redirect:/adEventList.do");
		return mv;
	}
	
	
	

		
	

}
