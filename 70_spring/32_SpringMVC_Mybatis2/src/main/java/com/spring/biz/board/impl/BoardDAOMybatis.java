package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardVO;

@Repository
public class BoardDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//글입력
		public void insertBoard(BoardVO vo) {
			System.out.println("===> mybatis로 insertBoard() 실행");
			
			mybatis.insert("boardDAO.insertBoard",vo);
		}

		//글수정
		public void updateBoard(BoardVO vo) {
			System.out.println("===> mybatis로 updateBoard() 실행");
			mybatis.update("boardDAO.updateBoard",vo);
		}

		//글삭제
		public void deleteBoard(BoardVO vo) {
			System.out.println("===> mybatis로 deleteBoard() 실행");
			mybatis.delete("boardDAO.deleteBoard",vo);
		}

		//글 하나조회
		public BoardVO getBoard(BoardVO vo) {
			System.out.println("===> mybatis로 getBoard() 실행");
			return mybatis.selectOne("boardDAO.getBoard", vo);
		}

		//글 목록 조회
		public List<BoardVO> getBoardList() {
			System.out.println("===> mybatis로 getBoardList() 실행");
			return null;
		}

		public List<BoardVO> getBoardList(BoardVO vo) {
			System.out.println("===> mybatis로 getBoardList(vo) 실행");
			//검색조건 값이 없을 때 기본값 설정
			return mybatis.selectList("boardDAO.getBoardList",vo);
		}
}
