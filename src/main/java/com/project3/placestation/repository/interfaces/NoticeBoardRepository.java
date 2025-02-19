package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.NoticeBoard;

@Mapper
public interface NoticeBoardRepository {
	
	
	
	// 공지사항리스트출력(페이징처리)
	public List<NoticeBoard> AdminNoticeBoardListAll(Criteria cri) throws Exception;
	
	//페이징처리 갯수세팅
	public int AdmincountNoticeBoard() throws Exception;
	
	//특정글조회(글번호사용)
	public NoticeBoard detailNoticeBoard(Integer nbno) throws Exception;
	
	//글조회수증가
	public void updateReadCnt(Integer nbno) throws Exception;
	
	
	//글등록(관리자)
	public Integer AdminInsertNotice(NoticeBoard noticeboard) throws Exception;
	
	//글수정(관리자)
	public Integer AdminUpdateNotice(NoticeBoard noticeboard) throws Exception;
	
	//글삭제(관리자)
	public Integer AdminDeleteNotice(NoticeBoard noticeboard) throws Exception;
	
	//공지사항리스트출력(검색,페이징처리)
	public List<NoticeBoard> AdminsearchNoticeBoardlist(Criteria cri) throws Exception;
	
	
	//공지사항숫자세기(검색,페이징처리)
	public int countAdminSearchNoticelist(Criteria cri) throws Exception;
	
	
	
}
