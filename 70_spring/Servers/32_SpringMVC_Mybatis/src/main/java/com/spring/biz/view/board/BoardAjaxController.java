package com.spring.biz.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

@Controller
public class BoardAjaxController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getJsonBoardList.do")
	@ResponseBody // 리스폰스바디 객체의 몸체에 데이터를 전달해준다. -> 이녀석이 제이슨으로 데이터 전달 어노테이션인가?
	public List<BoardVO> getAjaxBoardList () {
		List<BoardVO> boardList = boardService.getBoardList();
		System.out.println("보드리스트 : " + boardList);
		
		return boardList;
	}
	
	@RequestMapping(value = "/getJsonBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public BoardVO getOneOfJsonBoardDatas (@RequestBody BoardVO vo) { // 포스트방식일 때에만 리퀘스트바디로 잡아줘야 한다. 매개변수를.
		System.out.println("제이슨으로 하나만 데이터 받기 : " + vo);
		BoardVO getOne = boardService.getBoard(vo);
		System.out.println("결과 : " + getOne);
		
		return getOne;
	}
}















