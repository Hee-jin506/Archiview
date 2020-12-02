package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Member;

public interface MemberDao {
  List<Member> findAll() throws Exception;
  int add(Member member) throws Exception;
  Member findByNo(int no) throws Exception;
  Member findByEmailPassword(String email, String password) throws Exception;
  int update(Member member) throws Exception;
  int delete(int no) throws Exception;

}
