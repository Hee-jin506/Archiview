package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowService {
  int addUser(Follow follow) throws Exception; // 유저 팔로우
  int addTag(Follow follow) throws Exception; // 태그 팔로우
  int deleteUser(Follow follow) throws Exception; // 유저 언팔로우


  List<Follow> list() throws Exception;
  List<Follow> getByMemberNo() throws Exception;

  Follow get(int no) throws Exception;
  Object getTarget(Follow follow) throws Exception;
}
