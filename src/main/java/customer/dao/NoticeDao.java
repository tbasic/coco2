package customer.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.Soundbank;

import customer.db.DBCon;
import customer.vo.Notice;

public class NoticeDao {
	
	
	public List<Notice> noticeSelAll(String field,String query) throws Exception {
//		String sql="select seq,title,writer,content,"
//		+"regdate,hit from notices order by to_number(seq) desc";
//		
		String sql="select seq,title,writer,content,regdate,"
				+"hit from notices where "+field+" like ?"
				+" order by to_number(seq) desc";
 
		//dbcon
		Connection con=DBCon.getConnection();
		//실행
//		Statement stmt=con.createStatement();
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, "%"+query+"%");
		ResultSet rs=pstmt.executeQuery();

		List<Notice> list=new ArrayList<Notice>();
		while (rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			list.add(n);
		}
		return list;
	}
	

}
