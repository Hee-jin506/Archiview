package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Member;

public interface MemberDao {
  List<Member> findAll() throws Exception;
}
