package com.movie.movie.event.common.file;

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
public class FileDownloadController {

	// 이미지저장소
	private static final String CURR_IMAGE_REPO_PATH = "C:\\event";


	@RequestMapping("/eventList_image.do")
	protected void eventList_image(@RequestParam("event_id") String event_id, 
								@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();

		// 파일저장위치에서 썸네일이미지로 보여줄 파일을 지정
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + event_id + "\\" + fileName;

		File image = new File(filePath);

		if (image.exists()) {
			// 브라우저로 전송할 때 썸네일이미지로 만들어서 내보내겠다
			// 원본 이미지에 대한 썸네일 이미지를 생성한 후
			// OutputStream 객체에 할당
			Thumbnails.of(image).size(256,170).outputFormat("png").toOutputStream(out);
		}

		// 썸네일 이미지를 OutputStream객체(버퍼형태로 담아)를 이용해서 한 번에 8kbyte씩 브라우저로 전송
		byte[] buffer = new byte[1024 * 8]; // bit<byte<kb<mb
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/eventDetail_image.do")
	protected void eventDetail_image(@RequestParam("event_id") String event_id, 
									@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();

		// 파일저장위치에서 썸네일이미지로 보여줄 파일을 지정
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + event_id + "\\" + fileName;

		File image = new File(filePath);

		if (image.exists()) {
			// 브라우저로 전송할 때 썸네일이미지로 만들어서 내보내겠다
			// 원본 이미지에 대한 썸네일 이미지를 생성한 후
			// OutputStream 객체에 할당
			Thumbnails.of(image).size(1150,1000).outputFormat("png").toOutputStream(out);
		}

		// 썸네일 이미지를 OutputStream객체(버퍼형태로 담아)를 이용해서 한 번에 8kbyte씩 브라우저로 전송
		byte[] buffer = new byte[1024 * 8]; // bit<byte<kb<mb
		out.write(buffer);
		out.close();
	}
}
