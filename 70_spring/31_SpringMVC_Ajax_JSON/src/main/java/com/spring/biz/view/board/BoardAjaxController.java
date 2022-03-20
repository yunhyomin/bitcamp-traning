package com.spring.biz.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

@Controller
public class BoardAjaxController {
	@Autowired
	private BoardService boardService;	

	@RequestMapping("/getJsonBoardList.do")
	@ResponseBody // response 객체의 몸체(body)에 데이터 전달
	public List<BoardVO> getAjaxBoardList() {
		List<BoardVO> boardList = boardService.getBoardList();
		System.out.println("boardList : " + boardList);
		
		return boardList;
	}
	
	@RequestMapping("/getJsonBoard.do")
	@ResponseBody
	public BoardVO getJsonBoard(@RequestBody BoardVO vo) {//@RequestBody post방식 전달데이터 처리
		System.out.println("getJsonBoard() vo : " + vo);
		BoardVO board = boardService.getBoard(vo);
		System.out.println("getJsonBoard() board : " + board);
		
		return board;
	}
}








