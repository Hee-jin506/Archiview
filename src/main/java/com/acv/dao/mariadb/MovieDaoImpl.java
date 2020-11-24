package com.acv.dao.mariadb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import com.acv.dao.MovieDao;
import com.acv.domain.Movie;

public class MovieDaoImpl implements MovieDao {

  Connection con;

  public MovieDaoImpl(Connection con) {
    this.con = con;
  }

  @Override
  public int insert(Movie movie) throws Exception {

    // 커넥션 객체에서 수행하는 작업을 수동 커밋하도록 설정한다.
    con.setAutoCommit(false);

    try {
      try (PreparedStatement stmt = con.prepareStatement(
          "insert into acv_mov(mvno,title,dir,eng_title,runtime,odt,actors,syn,nation,stat)"
              + " values(?,?,?,?,?,?,?,?,?,?)",
              Statement.RETURN_GENERATED_KEYS)) {

        stmt.setInt(1, movie.getNo());
        stmt.setString(2, movie.getTitle());
        stmt.setString(3, movie.getDirectors());
        stmt.setString(4, movie.getEnglishTitle());
        stmt.setInt(5, movie.getRuntime());
        stmt.setDate(6, movie.getOpenDate());
        stmt.setString(7, movie.getActors());
        stmt.setString(8, movie.getSynopsis());
        stmt.setString(9, movie.getNation());
        stmt.setInt(10, movie.getStatus());
        stmt.executeUpdate();

        // 금방 입력한 프로젝트의 no 값을 가져오기
        try (ResultSet keyRs = stmt.getGeneratedKeys()) {
          keyRs.next();
          movie.setNo(keyRs.getInt(1));
        }
      }

      //      // 스틸컷
      //      try (PreparedStatement stmt2 = con.prepareStatement(
      //          "insert into acv_stc(mvno, stc_url) values(?,?)")) {
      //        for (String stc : movie.getStillCuts()) {
      //          stmt2.setInt(1, movie.getNo());
      //          stmt2.setString(2, stc);
      //          stmt2.executeUpdate();
      //        }
      //      }
      //
      //      // 포스터
      //      try (PreparedStatement stmt3 = con.prepareStatement(
      //          "insert into acv_pstr(mvno,ps_url,main_ps) values(?,?,?)")) {
      //        for (String pstr : movie.getPosters()) {
      //          stmt3.setInt(1, movie.getNo());
      //          stmt3.setString(2, pstr);
      //          stmt3.executeUpdate();
      //        }
      //      }

      // 프로젝트 멤버의 등록까지 예외없이 정상적으로 실행되었다면,
      // DBMS 서버에게 작업 내용을 실제 테이블에 반영하라고 요구한다.
      con.commit();

      return 1;

    } catch (Exception e) {
      // 작업을 수행하는 중에 예외가 발생하면
      // 이전에 수행했던 작업도 되돌린다.
      // 즉 마지막 커밋 상태로 되돌린다.
      con.rollback();

      // 예외가 발생하면 여기서 처리하지 말고 호출자에게 떠넘긴다.
      throw e;

    } finally {
      // 정상적으로 실행하거나 또는 예외가 발생해도
      // DB 커넥션은 다시 원래의 auto commit 상태로 만든다.
      con.setAutoCommit(true);
    }
  }

  @Override
  public List<Movie> findAll(String keyword) throws Exception {
//    try (PreparedStatement stmt = con.prepareStatement(
//        "select p.no, p.title, p.sdt, p.edt, m.no owner_no, m.name owner_name"
//            + " from pms_project p inner join pms_member m on p.owner=m.no"
//            + " order by p.no desc")) {
//
//      try (ResultSet rs = stmt.executeQuery()) {
//        ArrayList<Project> projects = new ArrayList<>();
//        while (rs.next()) {
//          Project project = new Project();
//          project.setNo(rs.getInt("no"));
//          project.setTitle(rs.getString("title"));
//          project.setStartDate(rs.getDate("sdt"));
//          project.setEndDate(rs.getDate("edt"));
//
//          Member owner = new Member();
//          owner.setNo(rs.getInt("owner_no"));
//          owner.setName(rs.getString("owner_name"));
//          project.setOwner(owner);
//
//          ArrayList<Member> members = new ArrayList<>();
//          try (PreparedStatement stmt2 = con.prepareStatement(
//              "select mp.member_no, m.name"
//                  + " from pms_member_project mp"
//                  + " inner join pms_member m on mp.member_no=m.no"
//                  + " where mp.project_no=" + rs.getInt("no"));
//              ResultSet memberRs = stmt2.executeQuery()) {
//
//            while (memberRs.next()) {
//              Member member = new Member();
//              member.setNo(memberRs.getInt("member_no"));
//              member.setName(memberRs.getString("name"));
//              members.add(member);
//            }
//          }
//          project.setMembers(members);
//          projects.add(project);
//        }
//        return projects;
//      }
//    }
    return null;
  }
}

