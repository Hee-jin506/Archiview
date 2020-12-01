package bitcamp.acv.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
  
  FilterConfig config;
  
  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    config = filterConfig;
  }

  @Override
  public void doFilter(
      ServletRequest request,
      ServletResponse response,
      FilterChain chain
      ) throws IOException, ServletException {

    // 나중에 인코딩이 바뀌더라도 소스코드엔 손을 대지 않고 web.xml의 value만 바꾸면 된다.
    request.setCharacterEncoding(config.getInitParameter("encoding"));
    response.setContentType(
        String.format("text/html;charset=%s", config.getInitParameter("encoding")));


    chain.doFilter(request, response);
  }
}
