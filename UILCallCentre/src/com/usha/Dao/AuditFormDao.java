package com.usha.Dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;

import com.usha.Model.AuditFormHeader;
import com.usha.Model.AuditScoreObd;
import com.usha.Model.AuditScoreIbd;
import com.usha.Util.ConnectionUtil;

public class AuditFormDao {

	public String insertData(AuditFormHeader headerData, AuditScoreIbd ibds) {
		//ConnectionUtil con = new ConnectionUtil();
		String queryHdrDtl = "INSERT INTO auditheaderdata (Zcid,Name,tl,doa,callType,campaign,deskType,complainId,Contact,callDate,callDur,Pdt,AgentScore,TotalScore) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String queryibdScore = "Insert into audit_ibds (Zcid,CallDate,ComplainId,0a,0b,0c,0d,1a,1b,2a,2b,2c,3a,3b,3c,3d,3e,3f,4a,4b,4c,4d,5a,6a,7a,7b,7c,7d) Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = ConnectionUtil.getConnection().prepareStatement(queryHdrDtl);
			int ascore,tscore;
			pst.setInt(1, headerData.getZcentrixid());
			pst.setString(2, headerData.getAname());
			pst.setString(3, headerData.getTl());
			pst.setString(4, headerData.getDoa());
			pst.setString(5, headerData.getCall_type());
			pst.setString(6, headerData.getCampaign());
			pst.setString(7, headerData.getDesk_type());
			pst.setString(8, headerData.getComplain_id());
			pst.setString(9, headerData.getContact_num());
			pst.setString(10, headerData.getCall_date());			
			pst.setString(11, headerData.getCall_duration());
			pst.setString(12, headerData.getProduct());	
			ascore = ibds.getSix_a() + ibds.getFive_a() + ibds.getFour_a() + ibds.getFour_b() + ibds.getFour_c() +  ibds.getFour_d() + ibds.getThree_a() + ibds.getThree_b() + ibds.getThree_c() + ibds.getThree_d() + ibds.getThree_e() + ibds.getThree_f() + ibds.getTwo_a() + ibds.getTwo_b() + ibds.getTwo_c() + ibds.getOne_a() + ibds.getOne_b() + ibds.getZero_b() + ibds.getZero_c() + ibds.getZero_d() ;
			pst.setInt(13, ascore);
			if(ibds.getFatal_a().equalsIgnoreCase("Yes") || ibds.getFatal_b().equalsIgnoreCase("Yes") || ibds.getFatal_c().equalsIgnoreCase("Yes") || ibds.getFatal_d().equalsIgnoreCase("Yes")){
			tscore = 0 ;	
			}else{
				tscore = ascore ;	
			}
			pst.setInt(14, tscore);
			pst.executeUpdate();	
			
			PreparedStatement pst2 = ConnectionUtil.getConnection().prepareStatement(queryibdScore);
			pst2.setInt(1, headerData.getZcentrixid());
			pst2.setString(2, headerData.getCall_date());
			pst2.setString(3, headerData.getComplain_id());
			pst2.setString(4, ibds.getZero_a());
			pst2.setInt(5, ibds.getZero_b());
			pst2.setInt(6, ibds.getZero_c());
			pst2.setInt(7, ibds.getZero_d());
			pst2.setInt(8, ibds.getOne_a());
			pst2.setInt(9, ibds.getOne_b());
			pst2.setInt(10, ibds.getTwo_a());
			pst2.setInt(11, ibds.getTwo_b());
			pst2.setInt(12, ibds.getTwo_c());
			pst2.setInt(13, ibds.getThree_a());
			pst2.setInt(14, ibds.getThree_b());
			pst2.setInt(15, ibds.getThree_c());
			pst2.setInt(16, ibds.getThree_d());
			pst2.setInt(17, ibds.getThree_e());
			pst2.setInt(18, ibds.getThree_f());
			pst2.setInt(19, ibds.getFour_a());
			pst2.setInt(20, ibds.getFour_b());
			pst2.setInt(21, ibds.getFour_c());
			pst2.setInt(22, ibds.getFour_d());
			pst2.setInt(23, ibds.getFive_a());
			pst2.setInt(24, ibds.getSix_a());
			pst2.setString(25, ibds.getFatal_a());
			pst2.setString(26, ibds.getFatal_b());
			pst2.setString(27, ibds.getFatal_c());
			pst2.setString(28, ibds.getFatal_d());
			pst2.executeUpdate();	
			return "Y" ;
		} catch (Exception e) {
			System.out.println(e);
			return "N" ;
		}
	}


	public String insertData(AuditFormHeader headerData, AuditScoreObd obds) {
		//ConnectionUtil con = new ConnectionUtil();
		String query = "INSERT INTO auditheaderdata (Zcid,Name,tl,doa,callType,campaign,deskType,complainId,Contact,callDate,callDur,Pdt,AgentScore,TotalScore) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String queryobdScore = "Insert into audit_obds (Zcid,CallDate,ComplainId,0a,0b,0c,0d,1a,1b,1c,1d,2a,2b,2c,3a,3b,3c,3d,3e,3f,4a,4b,4c,5a,6a,7a,7b,7c,7d) Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = ConnectionUtil.getConnection().prepareStatement(query);
			int ascore,tscore;
			pst.setInt(1, headerData.getZcentrixid());
			pst.setString(2, headerData.getAname());
			pst.setString(3, headerData.getTl());
			pst.setString(4, headerData.getDoa());
			pst.setString(5, headerData.getCall_type());
			pst.setString(6, headerData.getCampaign());
			pst.setString(7, headerData.getDesk_type());
			pst.setString(8, headerData.getComplain_id());
			pst.setString(9, headerData.getContact_num());
			pst.setString(10, headerData.getCall_date());			
			pst.setString(11, headerData.getCall_duration());
			pst.setString(12, "Fans");	
			ascore = obds.getSix_a() +  obds.getFive_a() + obds.getFour_a() + obds.getFour_b() + obds.getFour_c() +  obds.getThree_a() + obds.getThree_b() + obds.getThree_c() + obds.getThree_d() + obds.getThree_e() + obds.getThree_f() + obds.getTwo_a() + obds.getTwo_b() + obds.getTwo_c() + obds.getOne_a() + obds.getOne_b() + obds.getOne_c() + obds.getOne_d() + obds.getZero_b() + obds.getZero_c() + obds.getZero_d() ;
			pst.setInt(13, ascore);
			if(obds.getFatal_a().equalsIgnoreCase("Yes") || obds.getFatal_b().equalsIgnoreCase("Yes") || obds.getFatal_c().equalsIgnoreCase("Yes") || obds.getFatal_d().equalsIgnoreCase("Yes")){
			tscore = 0 ;	
			}else{
				tscore = ascore ;	
			}
			pst.setInt(14, tscore);
			pst.executeUpdate();	
			PreparedStatement pst2 = ConnectionUtil.getConnection().prepareStatement(queryobdScore);
			pst2.setInt(1, headerData.getZcentrixid());
			pst2.setString(2, headerData.getCall_date());
			pst2.setString(3, headerData.getComplain_id());
			pst2.setString(4, obds.getZero_a());
			pst2.setInt(5, obds.getZero_b());
			pst2.setInt(6, obds.getZero_c());
			pst2.setInt(7, obds.getZero_d());
			pst2.setInt(8, obds.getOne_a());
			pst2.setInt(9, obds.getOne_b());
			//pst2.setInt(10, obds.getOne_c());
			//pst2.setInt(11, obds.getOne_d());
			pst2.setInt(12, obds.getTwo_a());
			pst2.setInt(10, 0);
			pst2.setInt(11, 0);
			pst2.setInt(13, obds.getTwo_b());
			pst2.setInt(14, obds.getTwo_c());
			pst2.setInt(15, obds.getThree_a());
			pst2.setInt(16, obds.getThree_b());
			pst2.setInt(17, obds.getThree_c());
			pst2.setInt(18, obds.getThree_d());
			pst2.setInt(19, obds.getThree_e());
			pst2.setInt(20, obds.getThree_f());
			pst2.setInt(21, obds.getFour_a());
			pst2.setInt(22, obds.getFour_b());
			pst2.setInt(23, obds.getFour_c());			
			pst2.setInt(24, obds.getFive_a());
			pst2.setInt(25, obds.getSix_a());
			pst2.setString(26, obds.getFatal_a());
			pst2.setString(27, obds.getFatal_b());
			pst2.setString(28, obds.getFatal_c());
			pst2.setString(29, obds.getFatal_d());
			pst2.executeUpdate();	
			return "Y" ;
		} catch (Exception e) {
			System.out.println(e);
			return "N" ;
		}



	}

}
