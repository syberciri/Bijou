<<<<<<< HEAD

package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.dao.IItemsDao;
import com.study.springboot.dao.IItemsQnADao;
import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dao.IOrderListDao;
import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.ItemsDto;
import com.study.springboot.dto.ItemsQnADto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.FileUploadService2;
import com.study.springboot.service.ItemsService;
import com.study.springboot.service.MemberService;


@Controller
public class MyController3 {

	
	@Autowired // 객체 초기화
	private INoticeDao noticeDao;
	
	@Autowired
	private IOrderListDao orderListDao;
	
	@Autowired
	private IMemberDao memberDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	FileUploadService2 fileUploadService2;
	
	@Autowired
	private ItemsService itemsService;

	@Autowired
	private IItemsDao dao;
	
	@Autowired
	private IReviewDao review_dao;
	
	@Autowired
	private IItemsQnADao items_qna_dao;

	
	// 관리자-아이템 부분
	
	@RequestMapping("/items_list")
	public String list( Model model ) throws Exception {
		
		
		
		model.addAttribute("list", dao.list());
		
		
        return "admin/items_list";
	}
	

	@RequestMapping("items_delete")
	public String delete( @RequestParam("item_idx") String item_idx, Model model ) {
		
		dao.item_delete(item_idx);
		
		return "redirect:/items_list" ;
		
	}
	
	@RequestMapping("items_list_contents")
	public String item_list_content(@RequestParam("item_idx") String item_idx, Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("review_list", review_dao.review_list(item_idx));
		
		model.addAttribute("items_qna_list", items_qna_dao.items_qna_list(item_idx));

		
		return "admin/items_list_contents";
	}
	
	@RequestMapping("items_correction")
	public String itemsCorrection( @RequestParam("item_idx") String item_idx, Model model ) {
		model.addAttribute("dto", dao.item_correction(item_idx));
		
		return "admin/items_correction";
		
	}
	
	@RequestMapping("itemsUpdate")
	public String itemsUpdate( @RequestParam("item_idx") String item_idx,
							  @RequestParam("item_category") String item_category,
							  @RequestParam("item_option") String item_option,
							  @RequestParam("item_name") String item_name,
							  @RequestParam("item_price") String item_price,
							  @RequestParam("item_MainImg") MultipartFile item_MainImg,
							  @RequestParam("item_img") MultipartFile item_img,
							  @RequestParam("item_content") String item_content,
							 Model model ) {
		
		
		System.out.println("item_MainImg:" + item_MainImg );
		System.out.println("item_img:" + item_img );
		Long size = item_MainImg.getSize();
		Long size2 = item_img.getSize();
		System.out.println("size" + size);
		System.out.println("size2" + size2);
		
	
			
			System.out.println("file is not null!");
			String url = fileUploadService.restore(item_MainImg);
			String url2 = fileUploadService.restore2(item_img);
			
			
			//String url = fileUploadService.restore(file);
			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
			System.out.println("url:" + url);
			System.out.println("url2:" + url2);
			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
			model.addAttribute("url", url);
			model.addAttribute("url2", url2);
			
			//"url"이라는 이름의 model에 url값을 저장
			
		
		
		
		dao.itemsUpdate(item_idx, item_category, item_name, item_price, item_option, url, url2, item_content);
		
		return "redirect:/items_list";
		
	}
	
	@RequestMapping("items_register")
	public String itemsRegister() {
		
	
		
		return "admin/items_register";
	}
	
	
	@RequestMapping("itemsRegisterForm")
	public String itemsRegisterForm( @RequestParam("item_category") String item_category,
		                        	@RequestParam("item_option") String item_option,
									@RequestParam("item_name") String item_name,
									@RequestParam("item_price") String item_price,
									@RequestParam("item_MainImg") MultipartFile item_MainImg,
									@RequestParam("item_img") MultipartFile item_img,
									@RequestParam("item_content") String item_content,
									
									Model model) {
					
		
		
		System.out.println("item_MainImg:" + item_MainImg );
		System.out.println("item_img:" + item_img );
		Long size = item_MainImg.getSize();
		Long size2 = item_img.getSize();
		System.out.println("size" + size);
		System.out.println("size2" + size2);
		
	
			
			System.out.println("file is not null!");
			String url = fileUploadService.restore(item_MainImg);
			String url2 = fileUploadService.restore2(item_img);
			
			
			//String url = fileUploadService.restore(file);
			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
			System.out.println("url:" + url);
			System.out.println("url2:" + url2);
			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
			model.addAttribute("url", url);
			model.addAttribute("url2", url2);
			
			//"url"이라는 이름의 model에 url값을 저장
			
		
			dao.write(item_category, item_name, item_price, item_option, url, url2, item_content);
	
		
		
		
		return "redirect:/items_list"; //list로 리다이렉트 시킴
	}
	
	
	
	
	// 사용자-아이템 리스트
	@RequestMapping("items_view_all")
	public String allItemsView( HttpServletRequest request, Model model ) {
		
		model.addAttribute("list", dao.list());
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(user_id));
		
		return "user/items/items_view_all";
	}
	
	
	@RequestMapping("items_view")
	public String itemsView(@RequestParam("item_category") String item_category, Model model) {
		
	
		return "user/items/items_view";
	}
	
	
	
	@RequestMapping("/items_view_best")
	public String bestView(Model model) {
		
		model.addAttribute("list", dao.bestList());
		
		return "user/items/items_view_best";
	}
	
	@RequestMapping("/items_view_new")
	public String newView(Model model) {
		
		model.addAttribute("list", dao.newList());
		
		return "user/items/items_view_new";
	}
	
	@RequestMapping("/items_view_ring")
	public String ringView(Model model) {
		
		model.addAttribute("list", dao.ringList());
		
		return "user/items/items_view_ring";
	}
	
	@RequestMapping("/items_view_necklace")
	public String necklaceView(Model model) {
		
		model.addAttribute("list", dao.necklaceList());
		
		return "user/items/items_view_necklace";
	}
	
	@RequestMapping("/items_view_bracelet")
	public String braceletView(Model model) {
		
		model.addAttribute("list", dao.braceletList());
		
		return "user/items/items_view_bracelet";
	}
	
	@RequestMapping("/items_view_earrings")
	public String earringsView(Model model) {
		
		model.addAttribute("list", dao.earringsList());
		
		return "user/items/items_view_earrings";
	}
	
	
	@RequestMapping("items_content")
	public String itemsContent(@RequestParam("item_idx") String item_idx,  HttpServletRequest request, Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(user_id));
		
		return "user/items/items_content";
	}
	
	
	
}

=======
package com.study.springboot;

public class MyController3 {

}
>>>>>>> db71145a7dc7060e80cd70eddca983ed27b30357
