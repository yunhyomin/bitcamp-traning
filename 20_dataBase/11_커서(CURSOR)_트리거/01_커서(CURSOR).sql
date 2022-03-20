/* ******** CURSOR(커서) **************
데이터베이스 커서(Cursor)는 일련의 데이터에 순차적으로 액세스할 때 
검색 및 "현재 위치"를 포함하는 데이터 요소

묵시적커서 : SELECT, INSERT, UPDATE, DELETE 문장이 실행될 때
     DBMS가 CURSOR(커서)의 Open, Fetch, Close 자동 처리
명시적커서 : 프로그램내에서 명시적으로 커서(CURSOR)를 선언한 경우

<커서(CURSOR) 사용 절차>
1. 선언(CURSOR 커서명 IS SELECT문)
2. 커서오픈(OPEN 커서명)
3. 데이타추출(FETCH 커서명 INTO)
4. 커서닫기(CLOSE 커서명)
------------------------------------------
- SQL%ROWCOUNT : 행의 수
- SQL%FOUND : 1개 이상일 경우 (결과값이 있으면 true)
- SQL%NOTFOUND : 결과값이 하나도 없을때 true
- SQL%ISOPEN : 항상 false, 암시적 커서가 열려 있으면 true
**************************************/


select o.orderid
    ,get_custname(custid) as custname
    ,gey_bookname(bookid) as bookname
    ,o.saleprice,o.orderdate
from orders o
order by orderid desc
;

CREATE OR REPLACE PROCEDURE DISP_ORDERS 
AS 
    --1. 커서선언 (cursor 커서명 is select 문 )
    cursor c_orders is
    select o.orderid
        ,get_custname(custid) as custname
        ,get_bookname(bookid) as bookname
        ,o.saleprice,o.orderdate
    from orders o
    order by orderid desc;
    
    -- 사용할 변수 선언 
    v_orderid orders.orderid%type;
    v_custname customer.name%type;
    v_bookname book.bookname%type;
    v_saleprice orders.saleprice%type;
    v_orderdate orders.orderdate%type;
begin
    --커서사용 : 선택된 데이터를 화면출력 
    --2. 커서오픈(open 커서명)
    open c_orders;
    
    loop
        --3. 데이터 추출 (Fetch 커서명 into)
        fetch c_orders 
        into v_orderid,v_custname,v_bookname,v_saleprice,v_orderdate;
        
        exit when c_orders%notfound; -- 커서에 데이터가 없으면 반복종료 
        --커서에서 가져온 데이터 화면 출력 
    dbms_output.put_line(v_orderid||','||v_custname||','||v_bookname||','||
                            v_saleprice||','||v_orderdate);
    end loop;
    
    --4. 커서닫기 (close 커서명)
    close c_orders;
end;
