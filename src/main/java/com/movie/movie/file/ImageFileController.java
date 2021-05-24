package com.movie.movie.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;



@Controller
public class ImageFileController {

   //이미지저장소 - 파일 저장위치
   private static final String CURR_IMAGE_REPO_PATH = "C:\\movie\\imgFile";
   
   //goodsDetail.jsp의  책소개 부분에서
   //${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}"
   /* @RequestMapping("/download.do")
   protected void download(@RequestParam("goods_id") String goods_id,
                                 @RequestParam("fileName") String fileName,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
      OutputStream out = response.getOutputStream();
      
      //파일저장위치에서  썸네일이미지로 보여줄 파일을 지정
      String  filePath = CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
      
      File image = new File(filePath);
      FileInputStream in = new FileInputStream(image);
      
      /* respons기본객체는 웹 브라우저에 보내는 응답response정보를 담는 객체이다
       * 헤더정보와 리다이렉트 기능이 있다
       * 
       *-헤더정보 : 응답 정보에 헤더를 추가하는 기능을 제공. 주로 웹서버에 대한 정보를 담는다
       *response.setHeader(String name, String value) :name헤더에 value를 값으로 설정  
       *response.addHeader(String name, String value):name헤더에 value를 값으로 추가
       * 
       * 데이터가 변경되었음에도 불구하고   웹브라우저가 변경된 내용을 반영하지 않는 이유는,
       * 브라우저가  서버가 보내준 결과를 출력하지 않고
       * 캐시에 저장되었던 데이터를 출력하기 때문이다
       * => 내용이 거의 변경되지 않는site의 경우에는 
       *          웹브라우저가 캐시를 이용해 보다 빠른 응답을 제공할 수 있다
       * 그러나 게시판과 같이 내용이 자주 변경되는 경우에는 
       *          웹브라우저에 캐시를 적용시  일반 user는 변경된 내용을 확인할 수 없다
       * HTTP는 특수한 응답헤더를 이용해 캐시사용여부를 설정할 수 있다
       * Cache-Control 응답헤더 : 값을 "no-cache"로 지정하면 캐시에 저장하지X
       * ----------------------
       * Content-disposition 응답헤더 : 실제로 지정된 파일명을 지정함으로써
       *                                        더 자세한 파일의 속성을 알려줄수 있게 된다
       * 
      response.setHeader("Cache-Control","no-cache");
      response.addHeader("Content-disposition", "attachment; fileName="+fileName);
      
      //썸네일 이미지를 OutputStream객체(버퍼형태로 담아)를 이용해서  한 번에 8kbyte씩 브라우저로 전송  
      byte[] buffer = new byte[1024*8];  
      
      //버퍼를 이용하여 파일에 대한 정보를 읽어온다
      while(true) {
         int count = in.read(buffer);  //버퍼에 읽어들인 문자의 length
         if( count==-1 ) break; //버퍼에서 더 이상 읽어들일 내용이 없다면 -1을 리턴=>버퍼의 마지막에 도달했니?
         out.write(buffer,0, count);  //버퍼에 읽어들인 문자길이만큼  브라우저에 출력
      }
      in.close();
      out.close();
   }
   */
   
   //쇼핑몰처럼 많은 이미지를 사용할 경우
   //썸네일 이미지를 바로 다운로드하게 함으로써  훨씬 빠르게 이미지를 출력할 수 있게 된다
   //${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}
   @RequestMapping("/thumbnails.do")
   protected void thumbnails(@RequestParam("movie_id") String movie_id,
                                    @RequestParam("movieImage_fileName") String movieImage_fileName,
                                    HttpServletRequest request,
                                    HttpServletResponse response) throws Exception {
      OutputStream out = response.getOutputStream();
      
      //파일저장위치에서  썸네일이미지로 보여줄 파일을 지정
      String  filePath = CURR_IMAGE_REPO_PATH+"\\"+movie_id+"\\"+movieImage_fileName;
      
      File image = new File(filePath);
      
      if( image.exists()  ){
         //브라우저로 전송할 때 썸네일이미지로 만들어서 내보내겠다
         //원본 이미지에 대한 썸네일 이미지를 생성한 후 
         //OutputStream 객체에 할당
         Thumbnails.of(image).size(300, 427).outputFormat("jpg").toOutputStream(out);
      }
      
      //썸네일 이미지를 OutputStream객체(버퍼형태로 담아)를 이용해서  한 번에 8kbyte씩 브라우저로 전송  
      byte[] buffer = new byte[1024*8];   //bit<byte<kb<mb
      out.write(buffer);
      out.close();
   }
}
