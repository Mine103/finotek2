package com.finotek.ajaxfile.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finotek.ajaxfile.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	@RequestMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@RequestMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadForder = "C:\\finotek\\uploadFiles\\";
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize());
			
			File saveFile = new File(uploadForder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@RequestMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload Ajax");
	}
	
	@RequestMapping(value="/uploadAjaxAction", 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		
		String uploadFolder = "C:\\finotek\\uploadFiles\\";
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : "+uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachFileDTO = new AttachFileDTO();
			
			log.info("-------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : "+uploadFileName);
			attachFileDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachFileDTO.setUuid(uuid.toString());
				attachFileDTO.setUploadPath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					attachFileDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}
				list.add(attachFileDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<List<AttachFileDTO>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		Resource resource = new FileSystemResource("C:\\finotek\\uploadFiles\\"+fileName);
		if(resource.exists() == false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_"+1));
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			headers.add("Content-Disposition", 
						"attachment; filename="+
						new String(downloadName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : "+fileName);
		File file = new File("C:\\finotek\\uploadFiles\\");
		log.info("file : "+file);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;
		try {
			file = new File("C:\\finotek\\uploadFiles\\"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(file.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
