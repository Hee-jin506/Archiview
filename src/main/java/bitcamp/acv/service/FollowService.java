package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowService {
  int addFollow(Follow follow) throws Exception; // 팔로우
  List<Follow> list() throws Exception;
  List<Follow> getByMemberNo() throws Exception;

  Follow get(int no) throws Exception;
  Object getTarget(Follow follow) throws Exception;
}
