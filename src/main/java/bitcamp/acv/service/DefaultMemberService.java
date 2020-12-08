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

  @Override
  public List<Member> list(String keyword) throws Exception {
    return memberDao.findAll(keyword);
  }

  @Override
  public int updatePassword(Member member) throws Exception {
    return memberDao.updatePassword(member);
  }

  @Override
  public List<Member> listByPop() throws Exception {
    List<Member> members = memberDao.findByPop();
    //    int i, j;
    //    for (i = members.size() - 1; i>0; i--)
    //      for (j = 0; j<i; j++)
    //        if (arr[j]<arr[j + 1])
    //          swap(&arr[j], &arr[j + 1]);
    return null;
  }

}
