package com.suyeon.spring.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
	@GetMapping("/del")
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
//todo 글쓰고 리스트에 뿌릴 때 로그인한 user_id가 나오도록
	
	 @PostMapping("/write") public String write(BoardDto dto, MultipartFile[]
	 uploadFile) { 
		 service.write(dto);
	 log.info("==================="+dto.getCategory()); return
	 "redirect:/board/list?category="+dto.getCategory(); 
	 }
	
		//이미지 업로드
		@PostMapping(value="/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<BoardDto>> upload(MultipartFile[] uploadFile) {		//반환 타입이 ResponseEntity객체이고 Http의 Body에 추가될 데이터는 <List<AttachImageDto>이다 
//			파일을 저장할 기본적 경로를 저장하는 변수 선언&초기화
//			이미지 파일이 맞는지 체크
			for(MultipartFile multipartFile: uploadFile) {

				//File의 객체는 MIME TYPE
				File checkfile = new File(multipartFile.getOriginalFilename());
				String type = null;
				try {
				//probeContentType:MIME TYPE데이터를 String으로 변환
				//파라미터로는 Path객체로 전달받아야 하는데 이를 위해 toPath() 사용
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
//			SimpleDateFormat:날짜 데이터를 지정된 문자열 형식으로 변환, 날짜 문자열 데이터를 날짜 데이터로 변환
			/*날짜 폴더 경로*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
//			str 데이터에는 '-'가 작성되어있기 때문에 replace를 사용해서 \로 변경
			String datePath = str.replace("-", File.separator);	//2023-04-07을 2023\04\07로 바꿔줌
//			경로 설정을 위해 File객체 초기화
//			uploadFolder는 저장소의 경로 datePath는 하위 경로
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
				//뷰에서 전달받은 파일을 지정한 폴더에 저장하기
				//파일 이름
				String uploadFileName = multipartFile.getOriginalFilename();
				dto.setFileName(uploadFileName);
				dto.setUploadPath(datePath);
				//UUID 적용 UUID: 국제기구에서 표준으로 정한 식별자
				//똑같은 이름의 파일을 저장할 경우 기존 파일을 덮어씌워버림
				//UUID는 5개의 버전 방식을 사용 
				//버전4 방식 적용(randomUUID()): 정적(static)메서드이기 때문에 UUID를 인스턴스화하지않고 사용 가능
				//*static메서드:
				//클래스 자체에 속하기 때문에 인스턴스화하지 않고 호출 가능
				//인스턴스 변수나 인스턴스 메서드에 접근 불가능
				//static메서드를 사용하기 위해서는 클래스 이름을 통해 호출, 해당 클래스의 인스턴스를 만들 필요가 없음
				//UUID타입의 데이터이기 때문에 toString메서디를 사용하여 String타입으로 변경해줘야함
				// uuid 적용 파일 이름
				String uuid = UUID.randomUUID().toString();
				dto.setUuid(uuid);
				uploadFileName = uuid + "_"+ uploadFileName;
				//파일 위치, 파일 이름을 합친 File 객체
				File saveFile = new File(uploadPath, uploadFileName);
				//파일 저장(transferTo()의 경우 IOException와 IllegalStateException을 일으킬 가능성이 있기 때문에 try catch문을 사용
				try {
					multipartFile.transferTo(saveFile);
					//썸네일 생성 및 저장	 ImageIO도 try catch구문 사용
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
					//BufferedImage는 이미지 데이터를 처리하거나 조작에 필요한 값과 메서드 제공
					//read는 BufferedImage타입으로 변경해주는 메서드 
					BufferedImage bo_image = ImageIO.read(saveFile);
					//(width, height, imageType)
					//비율
					double ratio = 3;
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
					Thumbnails.of(saveFile)	//ImageIo보다 간단하게 생성하기(코드 127-129)
					.size(width, height)
					.toFile(thumbnailFile);
				//	BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				//	Graphics2D graphic = bt_image.createGraphics();
					//(x,y,width,height,ImageObserver)
				//	graphic.drawImage(bo_image, 0,0,width,height,null);
					//썸네일 이미지를 파일로 만들어주기 (파일로 저장할 이미지, 이미지 형식, 지정될 경로와 이름으로 생성한 File객체)
				//	ImageIO.write(bt_image, "jpg", thumbnailFile);
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

	// 수정
	@PostMapping("/modify")
	public String modify(BoardDto dto, @RequestParam("category") String category) {
		service.modify(dto);
		return "redirect:/board/list?category="+category;
	}

	
}
