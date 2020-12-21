package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowDao {
  List<Follow> findAll() throws Exception; // 팔로우 리스트(전체)
  List<Follow> findByMemberNo() throws Exception;

  Follow findByNo(int no) throws Exception; // 팔로우 상세
  int follow(Follow follow) throws Exception; // 팔로우 등록
}
