package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowService {
  int addUser(Follow follow) throws Exception; // 유저 팔로우
  int deleteUser(Follow follow) throws Exception; // 유저 언팔로우
  int addTag(Follow follow) throws Exception; // 태그 팔로우

  List<Follow> getFollowingUsers(int no) throws Exception; // 내가 팔로잉하는 사람들

  int active(int no) throws Exception; // 1. 팔로우상태로 변경
  int inactive(int no) throws Exception; // 2. 언팔로우상태로 변경

  // 팔로우 (관리자)용 전체
  List<Follow> list() throws Exception;
  Follow get(int no) throws Exception;
  Object getTarget(Follow follow) throws Exception;
}
