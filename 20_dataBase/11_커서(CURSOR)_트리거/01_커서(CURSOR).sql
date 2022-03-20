/* ******** CURSOR(Ŀ��) **************
�����ͺ��̽� Ŀ��(Cursor)�� �Ϸ��� �����Ϳ� ���������� �׼����� �� 
�˻� �� "���� ��ġ"�� �����ϴ� ������ ���

������Ŀ�� : SELECT, INSERT, UPDATE, DELETE ������ ����� ��
     DBMS�� CURSOR(Ŀ��)�� Open, Fetch, Close �ڵ� ó��
�����Ŀ�� : ���α׷������� ��������� Ŀ��(CURSOR)�� ������ ���

<Ŀ��(CURSOR) ��� ����>
1. ����(CURSOR Ŀ���� IS SELECT��)
2. Ŀ������(OPEN Ŀ����)
3. ����Ÿ����(FETCH Ŀ���� INTO)
4. Ŀ���ݱ�(CLOSE Ŀ����)
------------------------------------------
- SQL%ROWCOUNT : ���� ��
- SQL%FOUND : 1�� �̻��� ��� (������� ������ true)
- SQL%NOTFOUND : ������� �ϳ��� ������ true
- SQL%ISOPEN : �׻� false, �Ͻ��� Ŀ���� ���� ������ true
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
    --1. Ŀ������ (cursor Ŀ���� is select �� )
    cursor c_orders is
    select o.orderid
        ,get_custname(custid) as custname
        ,get_bookname(bookid) as bookname
        ,o.saleprice,o.orderdate
    from orders o
    order by orderid desc;
    
    -- ����� ���� ���� 
    v_orderid orders.orderid%type;
    v_custname customer.name%type;
    v_bookname book.bookname%type;
    v_saleprice orders.saleprice%type;
    v_orderdate orders.orderdate%type;
begin
    --Ŀ����� : ���õ� �����͸� ȭ����� 
    --2. Ŀ������(open Ŀ����)
    open c_orders;
    
    loop
        --3. ������ ���� (Fetch Ŀ���� into)
        fetch c_orders 
        into v_orderid,v_custname,v_bookname,v_saleprice,v_orderdate;
        
        exit when c_orders%notfound; -- Ŀ���� �����Ͱ� ������ �ݺ����� 
        --Ŀ������ ������ ������ ȭ�� ��� 
    dbms_output.put_line(v_orderid||','||v_custname||','||v_bookname||','||
                            v_saleprice||','||v_orderdate);
    end loop;
    
    --4. Ŀ���ݱ� (close Ŀ����)
    close c_orders;
end;
