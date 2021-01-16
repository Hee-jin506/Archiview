package bitcamp.acv.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.acv.domain.Like;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Save;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.SaveService;

@Controller
@RequestMapping("/save")
@SessionAttributes("loginUser")
public class saveController {

  @Autowired SaveService saveService;

  @GetMapping("add")
  public String add(Save save,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    save.setSavingMemberNo(loginUser.getNo());
    saveService.add(save);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }

  @GetMapping("delete")
  public String delete(Save save,
      @ModelAttribute("loginUser") Member loginUser,
      HttpServletRequest request
      ) throws Exception {
    
    save.setSavingMemberNo(loginUser.getNo());
    saveService.delete(save);

    String referer = request.getHeader("REFERER");
    String[] r = referer.split("app");
    return "redirect:.." + r[1];
  }
}
