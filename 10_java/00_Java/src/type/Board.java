package type;

//캡슐화를 구현하시오
// equals()를 구현하시오 
//상세보기를 할 메소드를 구현하시오
import java.text.SimpleDateFormat;
import java.util.Calendar;
public class Board {
    //id
	private int id;
	//제목
	private String title;
	//작성자
	private String writer;
	
	private int writerId;

    //내용
	private String content;
	//작성일
	private Calendar writtenDate;
	//수정일
	private Calendar updateDate;
	
	//getter/setter
	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
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
        return writtenDate;
    }
    public void setWrittenDate(Calendar writtenDate) {
        this.writtenDate = writtenDate;
    }
    public Calendar getUpdateDate() {
        return updateDate;
    }
    public void setUpdateDate(Calendar updateDate) {
        this.updateDate = updateDate;
    }
    
    
    public boolean equals(Object o) {
		if(o instanceof Board) {
			Board b = (Board)o;
			if(this.id == b.id) {//this는 좀더 명확하게 하기위해equals가 있는 필드의 id
				return true;
			}
		}
		return false;
	}
	
    public void printInfo() {
        SimpleDateFormat sdf = new SimpleDateFormat("y-M-d H:m:s");
        System.out.println("====================================");
        System.out.println("제목:"+title);
        System.out.println("------------------------------------");
        System.out.printf("번호:%03d 번 작성자: %s\n ",id,writer);
        System.out.println("작성일: "+  sdf.format(writtenDate.getTime()));
        System.out.println("수정일: "+ sdf.format(updateDate.getTime()));
        System.out.println("------------------------------------");
        System.out.println(content);
        System.out.println("====================================");
	}
	
}











































