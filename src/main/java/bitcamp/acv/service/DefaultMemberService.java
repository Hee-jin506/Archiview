package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.domain.Member;


public class DefaultMemberService implements MemberService {

  MemberDao memberDao;

  public DefaultMemberService(MemberDao memberDao) {
    this.memberDao = memberDao;
  }

  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }

}
