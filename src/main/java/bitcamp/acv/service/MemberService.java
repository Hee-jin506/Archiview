package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Member;

public interface MemberService {
  List<Member> list() throws Exception;
}
