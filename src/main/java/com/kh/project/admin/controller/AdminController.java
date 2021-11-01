package com.kh.project.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.common.util.FileUploadUtil;
import com.kh.project.community.service.CommunityService;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.movie.service.MovieService;
import com.kh.project.movie.vo.MovieImgVO;
import com.kh.project.movie.vo.MovieVO;
import com.kh.project.reservation.service.ReservationService;
import com.kh.project.reservation.service.ReservationServiceImpl;
import com.kh.project.reservation.vo.MovieTimeVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//관리자 기능 구현
	
	@Resource(name = "communityService")
	private CommunityService communityService;
	
	@Resource(name = "movieService")
	private MovieService movieService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;
	
	//영화 관리 페이지로 이동
	@GetMapping("/movieManage")
	public String movieManage(Model model, MovieVO movieVO) {
		//페이징 처리
		movieVO.setTotalCnt(movieService.selectMovieCnt(movieVO));
		movieVO.setPageInfo();
		//영화 목록 조회
		model.addAttribute("movieList", movieService.selectAdminMovieList(movieVO));
		System.out.println(movieVO.getNowPage());
		
		return "admin/movie_manage";
	}
	
	//영화 삭제
	@GetMapping("/deleteMovie")
	public String deleteMovie(MovieVO movieVO) {
		movieService.deleteMovie(movieVO);
		
		return "redirect:/admin/movieManage";
	}
	
	//영화 등록 페이지로 이동
	@GetMapping("/goInsertMovie")
	public String goInsertMovie(Model model) {
		return "admin/insert_movie";
	}
	
	//영화 등록
	@PostMapping("/insertMovie")
	public String insertMovie(Model model, MultipartHttpServletRequest multi, MovieVO movieVO) {
		//----------코드 관련 변수 생성----------
		//다음에 들어갈 영화 코드 조회
		String mvCode = movieService.selectNextMovieCode();
		//다음에 들어갈 이미지 코드의 숫자 조회
		int movieImgNumber = movieService.selectNextImgNumber();
		
		//----------이미지 파일들 첨부----------
		//Iterator : 리스트로 생각
		//inputNames : file, files (input태그의 name 속성 값)
		//getFileNames() : 등록하는 파일들의 이름을 가져옴
		Iterator<String> inputNames = multi.getFileNames();
		
		//첨부될 폴더
		//String uploadPath = "D:\\workspaceSTS\\Cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 학원 컴퓨터 경로
		String uploadPath = "C:\\Users\\Administrator\\git\\cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 노트북 경로
		
		//모든 첨부파일 정보가 들어갈 공간
		List<MovieImgVO> imgList = new ArrayList<>();
		
		//파일 첨부
		while(inputNames.hasNext()) {	//input 태그의 개수만큼 반복(file, files - 2번)
			//input 태그의 name 속성 값
			String inputName = inputNames.next();
			
			//실제 첨부 기능
			try {
				//다중 첨부(multiple) -> 스틸컷 이미지들
				if(inputName.equals("files")) {	//input 태그 name="files" -> multiple
					//input 태그에 하나씩 접근해서 파일을 다 가져옴 -> 파일 목록
					List<MultipartFile> fileList = multi.getFiles(inputName);
					
					//파일 목록 중 하나씩 빼서 파일 첨부
					for(MultipartFile file : fileList) {
						//변환한 파일명
						String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
						
						//파일 저장한 경로 + 변환한 파일명
						String uploadFile = uploadPath + attachedFileName;
						
						//파일 첨부
						file.transferTo(new File(uploadFile));
						
						//첨부한 파일에 대한 이미지 정보를 갖는 img -> imgList에 넣을 img 생성
						MovieImgVO img = new MovieImgVO();
						img.setMovieImgCode("MVI_" + String.format("%03d", movieImgNumber++));
						img.setOriginImgName(file.getOriginalFilename());
						img.setAttachedImgName(attachedFileName);
						img.setMvCode(mvCode);
						img.setIsPoster("N");
						
						//파일에 대한 이미지 정보를 imgList에 추가
						imgList.add(img);
					}
				}
				//단일 첨부 -> 포스터 이미지
				else {	//input 태그 name="file"
					//input 태그에 하나씩 접근해서 파일을 가져옴
					MultipartFile file = multi.getFile(inputName);
					
					//변환한 파일명
					String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
					
					//파일 저장한 경로 + 변환한 파일명
					String uploadFile = uploadPath + attachedFileName;
					
					//파일 첨부		transfer : 이동, 이전, 옮김
					file.transferTo(new File(uploadFile));
					
					//imgList에 넣을 img 생성
					MovieImgVO img = new MovieImgVO();
					img.setMovieImgCode("MVI_" + String.format("%03d", movieImgNumber++));
					img.setOriginImgName(file.getOriginalFilename());
					img.setAttachedImgName(attachedFileName);
					img.setMvCode(mvCode);
					img.setIsPoster("Y");
					
					//파일에 대한 이미지 정보를 imgList에 추가
					imgList.add(img);
				}
			} catch (IllegalStateException e) {	//부적합한 상태로 예외 발생했을 때
				e.printStackTrace();
			} catch (IOException e) {	//입출력 예외 발생했을 때
				e.printStackTrace();
			}
			
		}
		
		
		
		//----------예전 단일첨부만 작성 해둔 내용!!!!!
//		//영화 포스터 이미지 객체 생성
//		MovieImgVO movieImgVO = new MovieImgVO();
//		//첨부될 폴더
//		String uploadPath = "D:\\workspaceSTS\\Cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 학원 컴퓨터 경로
//		//String uploadPath = "C:\\Users\\Administrator\\git\\cinema\\src\\main\\webapp\\resources\\images\\movie\\";	//은경 - 노트북 경로
//		//input 태그에 접근해서 파일을 가져옴
//		file = multi.getFile("imageFile");	//파일첨부 input 태그 name 속성 값 = imageFile
//		//변환한 파일명 (영화제목을 파일명으로 쓰고, 그걸 그대로 저장)
//		String attachedFileName = file.getOriginalFilename();
//		//파일 저장한 경로 + 변환한 파일명
//		String uploadFile = uploadPath + attachedFileName;
//		//파일 첨부
//		try {
//			//transfer : 이동, 이전, 옮김
//			file.transferTo(new File(uploadFile));
//			
//			//영화 포스터 이미지 정보 설정
//			movieImgVO.setMovieImgCode(movieImgCode);
//			movieImgVO.setOriginImgName(file.getOriginalFilename());
//			movieImgVO.setAttachedImgName(attachedFileName);
//			movieImgVO.setMvCode(mvCode);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//----------상품&이미지 정보 등록----------
		//MV_CODE 설정
		movieVO.setMvCode(mvCode);
		//영화 정보 등록
		movieService.insertMovie(movieVO);
		//imgList 설정
		movieVO.setImgList(imgList);
		//영화 포스터 이미지 등록
		movieService.insertImages(movieVO);
		
		return "redirect:/admin/movieManage";
	}
	
	//영화 상세보기
	@GetMapping("/movieDetail")
	public String movieDetail(Model model, MovieVO movieVO) {
		//영화 상세 조회
		model.addAttribute("movieInfo", movieService.selectDetailMovie(movieVO));
		
		return "admin/movie_detail";
	}
	
	//영화 정보 수정 페이지로 이동
	@GetMapping("/goUpdateMovie")
	public String goUpdateMovie(Model model, MovieVO movieVO) {
		//영화 상세 정보
		model.addAttribute("movieInfo", movieService.selectDetailMovie(movieVO));
		
		return "admin/update_movie";
	}
	
	//영화 정보 수정
	@PostMapping("/updateMovie")
	public String updateMovie(MovieVO movieVO, Model model) {
		//정보 수정
		movieService.updateMovie(movieVO);
		
		//영화 코드
		model.addAttribute("mvCode", movieVO.getMvCode());
		
		return "redirect:/admin/movieDetail";
	}
	
	//1.회원 목록 조회
	@RequestMapping("/adminMemberList")
	public String adminMemberList(Model model, MemberVO memberVO) {
		//페이징 처리
		memberVO.setTotalCnt(memberService.selectMemberCnt(memberVO));
		memberVO.setPageInfo();
		
		//카테고리 목록 조회 후 jsp로 전달
		model.addAttribute("memberList", memberService.selectMemberList(memberVO));
		
		return "admin/admin_member_list";
	}
	
	//2.회원 상세 조회
	@GetMapping("/adminMemberDetail")
	public String adminMemberDetail(Model model, MemberVO memberVO) {
		
		//카테고리 목록 조회 후 jsp로 전달
		model.addAttribute("memberDetail", memberService.selectMemberDetail(memberVO));
		

		return "admin/admin_member_detail";
	}
	
	
	

	
}
