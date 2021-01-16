package bitcamp.acv.web;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/tag")
public class TagController {

  @Autowired TagService tagService;
  @Autowired ServletContext servletContext;

  @RequestMapping("delete")
  public String inactive(int no) throws Exception {
    if (tagService.delete(no) == 0) {
      throw new Exception("해당 태그가 없습니다.");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("multipleDelete")
  public String multipleDelete(String[] tags, HttpServletResponse response)
      throws Exception {
    int count = 0;
    if (tags != null) {
      for (String tagNo : tags) {
        count += tagService.delete(Integer.parseInt(tagNo));
      }
    }

    if (count == 0) {
      throw new Exception("해당 태그가 존재하지 않습니다\n");
    } else {
      return "redirect:list";
    }
  }

  @RequestMapping("detail")
  public ModelAndView detail(int no) throws Exception {

    Tag tag = tagService.get(no);

    if (tag == null) {
      throw new Exception("해당 태그가 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("tag", tag);
    mv.setViewName("tag/detail");
    return mv;
  }

  @GetMapping("list")
  public ModelAndView list(
      // 기본 검색 파라미터
      String keyword,
      String no,
      String name
      ) throws Exception {
    ModelAndView mv = new ModelAndView();

    if (keyword != null) {
      HashMap<String,Object> keyMap = new HashMap<>();
      keyMap.put("keyword", keyword);
      keyMap.put("no", no);
      keyMap.put("name", name);

      mv.addObject("list", tagService.listBasicFilter(keyMap));
    } else {
      mv.addObject("list", tagService.list());
    }
    // jsp에 넘겨줄 값들
    Map<String,Object> chartSizeMap = new HashMap<>();
    tagService.getSizeInfo(chartSizeMap);
    tagService.getChartInfo(chartSizeMap);

    mv.addObject("chartSizeMap", chartSizeMap);
    mv.setViewName("tag/list");
    return mv;
  }

  @PostMapping("list")
  public ModelAndView list(
      // 상세 검색 파라미터
      String keywordNumber,
      String keywordTitle,
      String registeredDate,
      String startDate,
      String endDate,
      String startNumber,
      String endNumber,
      String active,
      String inactive
      ) throws Exception {
    ModelAndView mv = new ModelAndView();

    if (keywordNumber != null) {
      HashMap<String,Object> keywordMap = new HashMap<>();
      keywordMap.put("number", keywordNumber);
      keywordMap.put("title", keywordTitle);
      keywordMap.put("startNumber", startNumber);
      keywordMap.put("endNumber", endNumber);
      keywordMap.put("active", active);
      keywordMap.put("inactive", inactive);

      if(registeredDate != "") {
        String[] s = registeredDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("registeredDate", d);
      }
      if(startDate != "") {
        String[] s = startDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("startDate", d);
      }
      if(endDate != "") {
        String[] s = endDate.split("\n");
        java.sql.Date d = java.sql.Date.valueOf(s[0]);

        keywordMap.put("endDate", d);
      }
      mv.addObject("list", tagService.listDetailFilter(keywordMap));
    } else {
      mv.addObject("list", tagService.list());
    }

    Map<String,Object> chartSizeMap = new HashMap<>();
    tagService.getSizeInfo(chartSizeMap);
    tagService.getChartInfo(chartSizeMap);

    mv.addObject("chartSizeMap", chartSizeMap);
    mv.setViewName("tag/list");
    return mv;

  }

  //  @RequestMapping("search")
  //  protected ModelAndView search(String keyword, String selectedTagTitle) throws Exception {
  //    ModelAndView mv = new ModelAndView();
  //    if (keyword != null) {
  //      List<Tag> tagList = tagService.listByKeywordTitle(keyword);
  //      mv.addObject("tagList", tagList);
  //      mv.setViewName("/tag/tagSearch.jsp");
  //    }
  //    if (selectedTagTitle != null) {
  //      Tag selectedTag = tagService.get(selectedTagTitle);
  //      mv.addObject("selectedTag", selectedTag);
  //      mv.setViewName("/tagSearch.jsp");
  //    }
  //
  //    return mv;
  //  }

}
