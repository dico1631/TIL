package com.ggoreb.basic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DownloadController {

	@GetMapping("/download")
	public ResponseEntity<Resource> download() throws Exception {
		File file = new File("C:\\Users\\student\\Downloads\\error.zip");
		InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
		return ResponseEntity.ok()
						.header("content-disposition", 
								"filename=" + URLEncoder.encode(file.getName(), "utf-8"))
				    .contentLength(file.length())
				    //1. 해당 파일을 다운로드 한다.
//				    .contentType(MediaType.parseMediaType("application/octet-stream"))
				    //2. 해당 파일을 화면에 띄운다. (pdf 같이)
				    //이와 같이 파일과 원하는 기능에 따라 이 부분을 바꿔서 넣으면 된다.
				    //이런 " " 안에 들어가는 문장을 "mime-type"이라고 한다.
				    .contentType(MediaType.parseMediaType("image/jpeg"))
				    .body(resource);
	}
	
}
