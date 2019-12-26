package com.ggoreb.basic.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ggoreb.basic.model.FileInfo;

@Controller
public class UploadController {
	@GetMapping("/upload1")
	public String upload1() {
		return "upload1";
	}

	@PostMapping("/upload1")
	@ResponseBody
	public String upload1Post(MultipartHttpServletRequest mRequest) {
		String result = "";

		// 파일 여러개를 업로드 했을 때 각 파일에 대해 처리
		List<MultipartFile> mFiles = mRequest.getFiles("file");
		for (int i = 0; i < mFiles.size(); i++) {
			MultipartFile mFile = mFiles.get(i);
			String oName = mFile.getOriginalFilename();
			// 지정 경로에 지정 파일명으로 저장, 지정파일명 : 업로드 된 이름 그대로
			try {
				mFile.transferTo(new File("c:/dev/" + oName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			result += oName + "\n";
		}

		// 파일 하나만 꺼내서 처리할 때
		/*
		 * MultipartFile mFile = mRequest.getFile("file"); 
		 * String oName = mFile.getOriginalFilename();
		 * 
		 * //지정 경로에 지정 파일명으로 저장, 지정파일명 : 업로드 된 이름 그대로 
		 * try { mFile.transferTo(new File("c:/dev/" + oName)); 
		 * } 
		 * catch (IllegalStateException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); 
		 * } 
		 * catch (IOException e) { //
		 * TODO Auto-generated catch block e.printStackTrace(); 
		 * } 
		 * result += oName + "\n";
		 */

		return result;
	}

	@GetMapping("/upload2")
	public String upload2() {
		return "upload2";
	}

	@PostMapping("/upload2")
	@ResponseBody
	public String upload2Post(@RequestParam("file") MultipartFile mFile) {
		String result = "";

		String oName = mFile.getOriginalFilename();
		result += oName + "\n";

		return result;
	}

	@GetMapping("/upload3")
	public String upload3() {
		return "upload3";
	}

	@PostMapping("/upload3")
	@ResponseBody
	public String upload3Post(@ModelAttribute FileInfo info) {
		String result = "";

		String oName = info.getFile().getOriginalFilename();

		result += oName + "\n";

		return result;
	}
}
