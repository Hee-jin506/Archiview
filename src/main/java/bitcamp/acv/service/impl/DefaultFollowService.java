package bitcamp.acv.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.FollowDao;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Follow;
import bitcamp.acv.service.FollowService;
@Service
public class DefaultFollowService implements FollowService {

  FollowDao followDao;
  MemberDao memberDao;
  TagDao tagDao;

  public DefaultFollowService(FollowDao followDao,
      MemberDao memberDao,
      TagDao tagDao) {
    this.followDao = followDao;
    this.memberDao = memberDao;
    this.tagDao = tagDao;
  }

  @Override
  public int addUser(Follow follow) throws Exception {
    return followDao.insertUser(follow);
  }

  @Override
  public int deleteUser(Follow follow) throws Exception {
    return followDao.deleteUser(follow);
  }

  @Override
  public int addTag(Follow follow) throws Exception {
      return followDao.insertTag(follow);
  }

  @Override
  public List<Follow> list() throws Exception {
    return followDao.findAll();
  }

  @Override
  public Follow get(int no) throws Exception {
    return followDao.findByNo(no);
  }

  @Override
  public Object getTarget(Follow follow) throws Exception {
    if (follow.getFollowedType() == Follow.MEMBER) {
      return memberDao.findByNo(follow.getFollowedNo());
    } else if (follow.getFollowedType() == Follow.TAG) {
      return tagDao.findByNo(follow.getFollowedNo());
    }
    return null;
  }

  @Override
  public int active(int no) throws Exception {
    return followDao.active(no);
  }

  @Override
  public int inactive(int no) throws Exception {
    return followDao.inactive(no);
  }

  @Override
  public List<Follow> list2(int no) throws Exception {
    return followDao.findAll2(no);
  }

  @Override
  public List<Follow> list3(int no) throws Exception {
    return followDao.findAll3(no);
  }
}
