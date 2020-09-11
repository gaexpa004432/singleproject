package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import common.ConnectionManager;



public class HumanDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt; // PreparedStatement는 Statement와 같은 기능을 수행하지만 가독성이 좋고 더 빠르다. ?기호 사용가능
	ResultSet rs = null; // ResultSet은 결과의 집합이라 select할때 사용하기. 초기값 필요하다
	
	// 싱글톤
	static HumanDAO instance;
	public static HumanDAO getInstance() {
		if(instance == null)
			instance = new HumanDAO();
			return instance;
	}
	public void insert(HumanVO human) {
		int r=0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into human values(?,?,?)";
					 
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, human.getId());
			psmt.setString(2, human.getPw());
			psmt.setString(3, human.getName());
			r = psmt.executeUpdate();
			
			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}

	}
	public HumanVO selectOne(HumanVO human) {
		HumanVO humanid = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from human"
					+ " where id=?"; // 컨+쉬+x 대문자, 컨+쉬+y 소문자 변환가능. 쿼리 엔터해서 쓸거면 앞에 공백 붙이기
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			pstmt.setString(1, human.getId()); // ?의 첫번째 자리에 올 값 지정
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			if (rs.next()) { // 단건조회라서 next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
				humanid = new HumanVO();
				humanid.setId(rs.getString(1)); // 컬럼이 첫번째 자리라서 1을 입력한거임
				humanid.setPw(rs.getString("pw"));
				humanid.setName(rs.getString("name")); // 컬럼명에다가 별칭있으면 별칭을 넣어줘야함
			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return humanid; // 값을 리턴해줌
	}
	
	public List<HumanVO> selectAll() { // 조회가 여러건이면 DeptVO를 list에 담음
		List<HumanVO> list = new ArrayList<HumanVO>(); // 결과값을 저장할 list 변수 객체 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from goods"
					+ " ORDER BY 1"; // 컨+쉬+x 대문자, 컨+쉬+y 소문자 변환가능. 쿼리 엔터해서 쓸거면 앞에 공백 붙이기
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			while (rs.next()) { // 여러건 조회라서 while를 사용. next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
				HumanVO goods = new HumanVO(); // 레코드 한건을 resultVO에 담음
//				goods.setGoods_id(rs.getInt(1)); 
				goods.setName(rs.getString(2)); 
//				goods.setUnit(rs.getString(3)); 
				list.add(goods); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}
	
}