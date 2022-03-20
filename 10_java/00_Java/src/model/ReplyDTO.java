package model;

import java.util.Calendar;

//현재 게시판 프로그램에 댓글기능을 추가하시오
//댓글은 댓글 번호, 댓글이 달린 게시판 번호, 댓글을 단 사람의 번호, 
//댓글내용, 댓글입력시간의 정보가 필요합니다

//댓글의 경우, 수정은 할 수 없지만 해당 댓글을 쓴 사람은 댓글을 개별적으로 삭제 가능합니다.
//사용자 개인 정보보기 메뉴에서는 해당회원이 등록한 모든 댓글을 볼 수있는 기능이 존재

//또한, 로그인한 회원이 회원탈퇴를 할 시에는 
//그 회원이 등록한 댓글들은 모두 댓글의 작성자가 "탈퇴한 회원"이라고만 출력이 됩니다.

public class ReplyDTO {
    
    //필드 
    //댓글번호
    private int id;
    
    //댓글이 달린 게시판 번호
    private int boardId;
    
    //댓글을 단 사람의 번호 
    private int writerId;
    
    //댓글내용
    
    private String content;
    
    //댓글입력시간
    private Calendar WrittenDate;
    
   //getter setter
        public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public int getBoardId() {
        return boardId;
    }


    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }


    public int getWriterId() {
        return writerId;
    }


    public void setWriterId(int writerId) {
        this.writerId = writerId;
    }


    public String getContent() {
        return content;
    }


    public void setContent(String content) {
        this.content = content;
    }


    public Calendar getWrittenDate() {
        return WrittenDate;
    }


    public void setWrittenDate(Calendar writtenDate) {
        WrittenDate = writtenDate;
    }


    //override
    public boolean equals(Object o) {
        if(o instanceof ReplyDTO) {
            ReplyDTO c = (ReplyDTO)o;
            if(c.id == id) {
                return true;
            }
        }return false;
    }
   
    
}
