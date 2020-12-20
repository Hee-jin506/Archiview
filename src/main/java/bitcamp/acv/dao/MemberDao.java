package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Member;

public interface MemberDao {
  List<Member> findAll(String keyword) throws Exception;
  int insert(Member member) throws Exception;

  Member findByNo(int no) throws Exception;

  //
  Member findByEmailPassword(Map<String,Object> params) throws Exception;

  int update(Member member) throws Exception;
  int delete(int no) throws Exception;
  int inactive(int no) throws Exception;
  int active(int no) throws Exception;
  int updatePassword(Member member) throws Exception;
  //
  List<Member> findByPop() throws Exception;
  List<Member> findByKeywordNickName(String keyword) throws Exception;
  Member findByEmail(String email) throws Exception;
}
