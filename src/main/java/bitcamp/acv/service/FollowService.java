package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowService {
  int addUser(Follow follow) throws Exception; // 유저 팔로우
  int deleteUser(Follow follow) throws Exception; // 유저 언팔로우
  int addTag(Follow follow) throws Exception; // 태그 팔로우
  int deleteTag(Follow follow) throws Exception; // 유저 언팔로우

  int active(int no) throws Exception; // 1. 팔로우상태로 변경
  int inactive(int no) throws Exception; // 2. 언팔로우상태로 변경

  // 팔로우 전체
  List<Follow> list() throws Exception;

  List<Follow> listMyFollowingList(int no) throws Exception;
  List<Follow> listMyFollowerList(int no) throws Exception;
  List<Follow> getFollowingFeed(int no) throws Exception;
  Follow get(int no) throws Exception;
  Object getTarget(Follow follow) throws Exception;
}
