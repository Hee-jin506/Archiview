package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Member;

public interface MemberService {
  List<Member> list() throws Exception;
  void add(Member member) throws Exception;
  Member get(int no) throws Exception;
  Member get(String email, String password) throws Exception;
  int update(Member member) throws Exception;
  int delete(int no) throws Exception;
}
