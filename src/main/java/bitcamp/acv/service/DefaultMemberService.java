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

  @Override
  public void add(Member member) throws Exception {
    memberDao.add(member);
  }

  @Override
  public Member get(int no) throws Exception {
    return memberDao.findByNo(no);
  }

  @Override
  public Member get(String email, String password) throws Exception {
    return memberDao.findByEmailPassword(email, password);
  }

  @Override
  public int update(Member member) throws Exception {
    return memberDao.update(member);
  }

  @Override
  public int delete(int no) throws Exception {
    return memberDao.delete(no);
  }

  @Override
  public int inactive(int no) throws Exception {
    return memberDao.inactive(no);
  }

  @Override
  public int active(int no) throws Exception {
    return memberDao.active(no);
  }


}
