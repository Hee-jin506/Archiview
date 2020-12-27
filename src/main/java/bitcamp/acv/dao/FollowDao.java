package bitcamp.acv.dao;

import java.util.List;
import bitcamp.acv.domain.Follow;

public interface FollowDao {
  Follow findByNo(int no) throws Exception; // 멤버의 팔로우 상세(전체)
  List<Follow> findAll() throws Exception; // 멤버의 팔로우 리스트(전체)
  List<Follow> findAll2(int no) throws Exception; // 특정 멤버의 팔로우 리스트
  List<Follow> findAll3(int no) throws Exception; // 특정 멤버의 팔로워 리스트

  List<Follow> findByFollowingFeed(int no) throws Exception;

  int insertUser(Follow follow) throws Exception; // 유저 팔로우
  int deleteUser(Follow follow) throws Exception; // 유저 언팔로우
  int insertTag(Follow follow) throws Exception; // 태그 팔로우

  int active(int no) throws Exception; // 1. 팔로우상태로 변경
  int inactive(int no) throws Exception; // 2. 언팔로우상태로 변경
}
