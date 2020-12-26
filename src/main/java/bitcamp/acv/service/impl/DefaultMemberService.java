package bitcamp.acv.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@Service
public class DefaultMemberService implements MemberService {

  MemberDao memberDao;

  public DefaultMemberService(MemberDao memberDao) {
    this.memberDao = memberDao;
  }


  @Override
  public void add(Member member) throws Exception {
    memberDao.insert(member);
  }

  @Override
  public Member get(int no) throws Exception {
    return memberDao.findByNo(no);
  }

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String,Object> map = new HashMap<>();
    map.put("email", email);
    map.put("password", password);
    return memberDao.findByEmailPassword(map);
  }

  @Override
  public Member get(String email) throws Exception {
    return memberDao.findByEmail(email);
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

  // nickName에 keyword가 포함된 애들을 리턴
  @Override
  public List<Member> listByKeywordNickName(String keyword) throws Exception {
    return memberDao.findByKeywordNickName(keyword);
  }

  @Override
  public int updatePassword(Member member) throws Exception {
    return memberDao.updatePassword(member);
  }

  @Override
  public List<Member> listByPop() throws Exception {
    List<Member> members = memberDao.findByPop();
    for (int i = 0; i < members.size(); i++) {
      for (int j =  members.size() -1; j > i; j--) {
        int frontPop = members.get(j - 1).getFollowers() * 2 + members.get(j - 1).getLikers();
        int backPop = members.get(j).getFollowers() * 2 + members.get(j).getLikers();
        if (frontPop < backPop) {
          swap(members, j-1, j);
        }
      }
    }
    return members;
  }

  public void swap(List<Member> members, int a, int b) {
    Member temp = members.get(a);
    members.set(a, members.get(b));
    members.set(b, temp);
  }

  @Override
  public Member[] listByPop3() throws Exception {
    List<Member> members = memberDao.findByPop();
    for (int i = 0; i < members.size(); i++) {
      for (int j =  members.size() -1; j > i; j--) {
        int frontPop = members.get(j - 1).getFollowers() * 2 + members.get(j - 1).getLikers();
        int backPop = members.get(j).getFollowers() * 2 + members.get(j).getLikers();
        if (frontPop < backPop) {
          swap(members, j-1, j);
        }
      }
    }
    Member[] topMembers = new Member[3];
    for (int i = 0; i < 3; i++) {
      topMembers[i] = members.get(i);
    }
    return topMembers;
  }


  @Override
  public int updateHint(Member member) throws Exception {
    return memberDao.updateHint(member);
  }
}
