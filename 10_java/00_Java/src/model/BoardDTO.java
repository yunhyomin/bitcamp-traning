package model;

import java.util.Calendar;

public class BoardDTO {
    // 필드
    // 글번호
    private int id;
    // 제목
    private String title;
    // 작성시간
    private Calendar writtenDate;
    // 수정시간
    private Calendar updateDate;
    // 작성자의 회원번호
    private int writerId;
    // 내용
    private String content;

    // getter setter
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

    public boolean equals(Object o) {
        if (o instanceof BoardDTO) {
            BoardDTO b = (BoardDTO) o;
            if (id == b.id) {
                return true;
            }
        }

        return false;
    }

}
