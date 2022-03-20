package controller;

import java.util.ArrayList;
import java.util.Calendar;

import model.ReplyDTO;
//ReplyDTO에는 하나의 객체만 들어감.(id, writerId, boardId등등)
//ArrayList<ReplyDTO>에는 여러 객체들이 들어갈수있음.
public class ReplyController {
    // 데이터베이스역할을 해줄 ArrayList만들기
    private ArrayList<ReplyDTO> list;
    // 다음 추가될 댓글의 번호를 저장할 내부필드
    private int nextId;

    public ReplyController() {
        list = new ArrayList<>();// 객체생성

        nextId = 1;

    }

    // 파라미터로 들어온 CommentDTO객체를 list에 추가하는 insert()
    public void insert(ReplyDTO r) {
        r.setId(nextId++);
        r.setWrittenDate(Calendar.getInstance());

        list.add(r);
    }

    // 파라미터로 들어온 id값과 일치하는 ReplyDTO객체를
    // 리턴해주는 selectOne()
    public ReplyDTO selectOne(int id) {
//        for(int i=0; i<list.size(); i++) {//이 두줄을 줄여서 쓸수있다 for(ReplyDTO c : list)
//            ReplyDTO r = list.get(i);   //뜻: 1씩늘어나는 index i에 들어있는 객체들을 r에 넣어준다.
        ReplyDTO r = new ReplyDTO();//객체생성
        r.setId(id);
        if(list.contains(r)) {
           int index = list.indexOf(r);
            return list.get(index);
        }
        return null;
    }

    // selectAll()
    public ArrayList<ReplyDTO> selectAll() {
        return list;
    }

    // 해당 게시글번호(boardId)를가진 댓글을 리스트(list)에 담아서 리턴하는메소드
    // selectbyBoardId()
    public ArrayList<ReplyDTO> selectByBoardId(int boardId) {

        ArrayList<ReplyDTO> temp = new ArrayList<>();// 해당게시글번호를 가진 댓글들을 담을 객체생성
        for (int i = 0; i < list.size(); i++) {
            ReplyDTO r = list.get(i);// list에 i번째에 있는 정보를 r 에 저장.
            if (r.getBoardId() == boardId) {
                temp.add(r);
            }
        }
        return temp;
    }
    //해당 writerId를 가진 댓글을 어레이 리스트에 담아 리턴하는 
    //selectByWriterId()
    public ArrayList<ReplyDTO> selectByWriterId(int writerId) {
        ArrayList<ReplyDTO> temp = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {//두줄을 하나로 만들면 for(ReplyDTO r : list)
            ReplyDTO r = list.get(i);
            if (r.getWriterId() == writerId) {
                temp.add(r);
            }

        }
        return temp;

    }
    // delete()
    public void delete(int id) {
        ReplyDTO temp = new ReplyDTO();//삭제할 댓글번호(id)를 담을 객체 ReplyDTO temp생성
        temp.setId(id);//temp에 파라미터로 들어온 id를 저장.
        list.remove(temp);//list에서 temp 를 삭제.
    }
    //탈퇴한 회원번호와 일치하는 RelpyDTO객체를 리턴하는 메소드
    //update
    public void update(int writerId) {
       for(int i = 0; i<list.size(); i++) {
           ReplyDTO r = list.get(i);
           if(r.getWriterId() == writerId) {
              r.setWriterId(0);
           }
       }
        
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    