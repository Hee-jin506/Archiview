package bitcamp.acv.web.ajax;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@Controller("ajax.OptionController")
@RequestMapping("ajax/option")
@SessionAttributes("loginUser")
public class OptionController {

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @RequestMapping("ajaxProfile")
  protected void profile(
      Model model,  
      @ModelAttribute("loginUser") Member loginUser) throws Exception {

      model.addAttribute("member", loginUser);
  }

  @RequestMapping("ajaxPasswordHint")
  public void passwordHint(
      Model model,  
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
      model.addAttribute("member", loginUser);
  }

  @RequestMapping("ajaxPasswordUpdate")
  public void passwordUpdate(
      Model model,  
      @ModelAttribute("loginUser") Member loginUser) throws Exception {

      model.addAttribute("member", loginUser);
  }

  @RequestMapping("ajaxWithdraw")
  public void withdraw( 
      Model model, 
      @ModelAttribute("loginUser") Member loginUser) throws Exception {
      model.addAttribute("member", loginUser);
    }
}
