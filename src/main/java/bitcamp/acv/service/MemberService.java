package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Member;

public interface MemberService {
  List<Member> list(String keyword) throws Exception;

  void add(Member member) throws Exception;
  Member get(int no) throws Exception;
  Member get(String email, String password) throws Exception;
  Member get(String email) throws Exception;
  int update(Member member) throws Exception;
  int delete(int no) throws Exception;
  int inactive(int no) throws Exception;
  int active(int no) throws Exception;
  int updatePassword(Member member) throws Exception;
  List<Member> listByPop() throws Exception;
  List<Member> listByKeywordNickName(String keyword) throws Exception;
}
