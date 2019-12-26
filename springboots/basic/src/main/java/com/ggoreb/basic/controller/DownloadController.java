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
				    //1. �ش� ������ �ٿ�ε� �Ѵ�.
//				    .contentType(MediaType.parseMediaType("application/octet-stream"))
				    //2. �ش� ������ ȭ�鿡 ����. (pdf ����)
				    //�̿� ���� ���ϰ� ���ϴ� ��ɿ� ���� �� �κ��� �ٲ㼭 ������ �ȴ�.
				    //�̷� " " �ȿ� ���� ������ "mime-type"�̶�� �Ѵ�.
				    .contentType(MediaType.parseMediaType("image/jpeg"))
				    .body(resource);
	}
	
}
