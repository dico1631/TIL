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
		File file = new File("C:\\dev\\html\\video.html");
		InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
		return ResponseEntity.ok()
						.header("content-disposition",  
								// encode(file.getName()) �� �ٲٸ� ���� �̸��� �ٸ� �̸����� ���� �� �ִ�.
								//���� ���嶧�� �ߺ��� �����ϱ� ���� ���ϸ�_��¥ �� ����
								//�ٵ� �ٲ� ���ϸ����� �ٿ�ް� �ϸ� ����ڰ� ������. �׷��� �����ϸ�� �ٲ� ���ϸ� �Ѵ� ����
								//�ٲ� ���ϸ����� ã�Ƽ� �ش�Ǵ� ���� �����ϸ����� �ٿ�ε� �ֱ�
								"filename=" + URLEncoder.encode(file.getName(), "utf-8"))
				    .contentLength(file.length())
				    //1. �ش� ������ �ٿ�ε� �Ѵ�.
//				    .contentType(MediaType.parseMediaType("application/octet-stream"))
				    //2. �ش� ������ ȭ�鿡 ����. (pdf ����)
				    //�̿� ���� ���ϰ� ���ϴ� ��ɿ� ���� �� �κ��� �ٲ㼭 ������ �ȴ�.
				    //�̷� " " �ȿ� ���� ������ "mime-type"�̶�� �Ѵ�.
				    .contentType(MediaType.parseMediaType("text/plain"))
				    .body(resource);
	}
	
}
