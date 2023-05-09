package com.suyeon.spring.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.suyeon.dto.BoardDto;
import com.suyeon.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
@Controller
public class BoardController {

	private BoardService service;

	// 1.리스트
	@GetMapping("/list")
	public void list(@RequestParam(value = "category") String category, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("list", service.list(category));
	}

	// 2.읽기
	@GetMapping({ "/read", "/modify" })
	public void read(BoardDto dto, Model model) {
		log.info("컨트롤러" + dto.getNum());
		model.addAttribute("read", service.read(dto.getNum(), dto.getCategory()));
	}

	// 삭제
	@GetMapping("/board")
	public String del(@RequestParam("num") Long num, @RequestParam("category") String category, HttpSession session) {
		log.info("컨트롤러" + num);
		service.del(num);
		return "redirect:/board/list?category="+category;
	}

//	좋아요
	@ResponseBody
	@RequestMapping(value = "/board/updateLike", method = RequestMethod.GET)
	public int updateLike(@RequestParam("num") int num, @RequestParam("user_id") String user_id) {	
		int likeCheck = service.likeCheck(num, user_id);
		System.out.println("========"+service.likeCheck(num, user_id)+"========");
		if(likeCheck == 0) {
			//좋아요 처음누름
			service.insertLike(num, user_id); //like테이블 삽입
			service.updateLike(num);	//게시판테이블 +1
			service.updateLikeCheck(num, user_id);//like테이블 구분자 1
		}else if(likeCheck == 1) {
			service.updateLikeCheckCancel(num, user_id); //like테이블 구분자0
          service.updateLikeCancel(num); //게시판테이블 - 1
			service.deleteLike(num, user_id); //like테이블 삭제
		}
		return likeCheck;
	}
	
//	쓰기 화면 출력
	@GetMapping("/write")
	public void write(@RequestParam("category") String category, Model model) {
		log.info("===================");
		model.addAttribute("category",category);
	}
	
	 @PostMapping("/write") 
	 public String write(BoardDto dto, MultipartFile[] uploadFile) { 
		 service.write(dto);
	 log.info("==================="+dto.getCategory()); return
	 "redirect:/board/list?category="+dto.getCategory(); 
	 }
	
		//이미지 업로드
		@PostMapping(value="/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<BoardDto>> upload(MultipartFile[] uploadFile) {		//반환 타입이 ResponseEntity객체이고 Http의 Body에 추가될 데이터는 <List<AttachImageDto> 
//			파일을 저장할 기본적 경로를 저장하는 변수 선언&초기화
//			이미지 파일이 맞는지 체크
			for(MultipartFile multipartFile: uploadFile) {

				
				File checkfile = new File(multipartFile.getOriginalFilename());
				String type = null;
				try {
				
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE:"+type);
				} catch(IOException e) {
					e.printStackTrace();
				}
//				startsWith(): String타입의 데이터를 전달받는데 전달 받은 문자로 시작할 경우 true 아니면false
				if(!type.startsWith("image")) {
					List<BoardDto> list = null;
					return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				}
			}
			String uploadFolder = "C:\\upload";
			/*날짜 폴더 경로*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			String datePath = str.replace("-", File.separator);	//2023-04-07을 2023\04\07로 바꿔줌
//			경로 설정을 위해 File객체 초기화
			File uploadPath = new File(uploadFolder, datePath);
//			uploadPath.mkdirs();	//폴더 여러 개 생성			
			//위의까지의 코드만 사용하게 되면 폴더가 이미 존재하는 상황에도 폴더를 새로 생성하게됨
			//그래서 File클래스에서 대상 파일 혹은 디렉터리가 존재하는지 유무 반환하는 exists()메서드를 활용해야함
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();	//폴더 여러 개 생성			
			}
			//여기까지 하게 되면 upload\\temp\\2023\\04\\07폴더가 생성됨
			
			//이미지 정보 담는 객체
			List<BoardDto> list = new ArrayList();
			
			for(MultipartFile multipartFile : uploadFile) {
				//이미지 정보 객체
				BoardDto dto = new BoardDto();
				String uploadFileName = multipartFile.getOriginalFilename();
				dto.setFileName(uploadFileName);
				dto.setUploadPath(datePath);
				
				String uuid = UUID.randomUUID().toString();
				dto.setUuid(uuid);
				uploadFileName = uuid + "_"+ uploadFileName;
				//파일 위치, 파일 이름을 합친 File 객체
				File saveFile = new File(uploadPath, uploadFileName);
				//파일 저장(transferTo()의 경우 IOException와 IllegalStateException을 일으킬 가능성이 있기 때문에 try catch문을 사용
				try {
					multipartFile.transferTo(saveFile);
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
					BufferedImage bo_image = ImageIO.read(saveFile);
					double ratio = 3;
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
					Thumbnails.of(saveFile)	
					.size(width, height)
					.toFile(thumbnailFile);
				} catch(Exception e){
					
				}
				list.add(dto);
			log.info("======upload==============");		
			log.info("파일 이름:"+multipartFile.getOriginalFilename());
			log.info("파일 타입:"+multipartFile.getContentType());
			log.info("파일 크기:"+multipartFile.getSize());
			}
			
			ResponseEntity<List<BoardDto>> result = new ResponseEntity<List<BoardDto>>(list, HttpStatus.OK);
			return result;
		}

		//이미지 파일 업로드
		@GetMapping("/display")
		public ResponseEntity<byte[]> getImage(String fileName){
			File file = new File("c:\\upload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		//이미지 파일 삭제
		@PostMapping("/deleteFile")
		public ResponseEntity<String> deleteFile(String fileName){
			log.info("deleteFile....."+ fileName);
			File file = null;
			try {
				//썸네일 파일 삭제
				file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
				
				file.delete();
				
				//원본 파일 삭제
				String originFileName = file.getAbsolutePath().replace("s_", "");
				
				file = new File(originFileName);
				file.delete();
				
			} catch(Exception e) {
				e.printStackTrace();
				
				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			}
			
			return new ResponseEntity<String>("sucess", HttpStatus.OK);
		}
	// 수정
	@PostMapping("/modify")
	public String modify(BoardDto dto, @RequestParam("category") String category) {
		service.modify(dto);
		return "redirect:/board/list?category="+category;
	}

	
}
