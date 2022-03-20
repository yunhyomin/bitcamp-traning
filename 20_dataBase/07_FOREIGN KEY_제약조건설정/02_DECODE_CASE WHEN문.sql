/* DECODE, CASE WHEN : SQL�� ������ IF�� ����(CASE : ǥ��SQL)
DECODE : ����񱳸� ����(���� ������ Ȯ��) : �ڹ��� if-else ������ ���� 
DECODE(���, �񱳰�, ������ ó����, �ٸ��� ó����);
DECODE(���, �񱳰�, DECODE(), DECODE());
DECODE(���, �񱳰�1, ó����1
          , �񱳰�2, ó����2
          , ...
          , �񱳰�n, ó����n
          , ó����n+1)
**************************************/
select * from customer order by name;
--if���常�ִ� ���̽� else�κ��� �Էµ��� �ʾ����Ƿ� nulló�� 
select name, decode(name, '�迬��','��~�迬�ƴ�!!!')
 from customer order by name;
--if-else���� 
select name, decode(name, '�迬��','��~�迬�ƴ�!!!','�׳ɻ��')
 from customer order by name;

--�̸��� �������̸� '�౸����' �ƴϸ� '�����'
select name, decode(name, '������','�౸����','�����')
 from customer order by name;
--�̸��� �迬�Ƹ� '�ǰܽ�������', �ڼ����� '����', �������̸� '�౸'
---������ '�����'
select name, 
        decode(name, '�迬��','�ǰܽ�������',
                     '�ڼ���','����',
                     '������','�౸',
                     '�����') name_decode
from customer 
order by name;
-------------------------
--decode ���� �ȿ� decode�� ��� 
--DECODE(���, �񱳰�, DECODE(), DECODE());
select name,
        decode(name, '�迬��','�ǰܽ�������',
            decode(name, '�ڼ���','����',
                 decode(name, '������','�౸����',
                   '�����')
            )
        )as "�"
 from customer
order by name;
    
--===============================================
/***** CASE WHEN �� ************
����1 : SWITCH CASEó��(DECODE�� ó��)
CASE �÷�(���ذ�)
     WHEN �񱳰�1 THEN ��ġ�ϸ� ó���� ����
     WHEN �񱳰�2 THEN ��ġ�ϸ� ó���� ����
     ...
     WHEN �񱳰�n THEN ��ġ�ϸ� ó���� ����
     ELSE ���� ��ġ�ϴ� ��찡 ������ ������ ����
END
--------
����2 : IF THEN ELSE ó�� ���(�ε�� ó�� ����)**********decode�� ������***********
--CASE�� ���� ó�����忡�� CASE�ߺ� ��� ����
--�񱳱��� : =, <>, !=, >, <, >=, <=, AND, OR, NOT ��밡��
CASE WHEN �񱳱���
     THEN �񱳱��� ��� TRUE�� ��� ó������
     ELSE �񱳱��� ��� FALSE�� ��� ó������
END   
------
CASE WHEN �񱳱���(��: KOR > 90)
     THEN (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
     ELSE (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
END   
-----
CASE WHEN �񱳱��� THEN ó������
     WHEN �񱳱��� THEN ó������
     ....
     ELSE ���� �񱳱����� �ش���� �ʴ� ��� ó������
END 
***************************/
select * from customer order by name;
--�̸��� �������̸� '�౸����' �ƴϸ� '�����'
select name, 
        case name when '������' 
            then '�౸����' 
            else'�����' 
        end
 from customer 
order by name;
--------------------
--�̸� �迬��:�ǰܽ�������, �ڼ���:����, ������:�౸����, ������:�����
select name,
        case name 
            when '�迬��' then '�ǰܽ�������' 
            when '�ڼ���' then '����'
            when '������' then '�౸����'
            else '�����'
        end  name_case
 from customer 
order by name;
---------------------
--����(price)�� 10000 �̸��̸� '�δ�', 10000-20000 : �����ϴ�
--20000���� ũ�� '��δ�', 30000���� ũ�� '�ʹ���δ�'
select * from book;
select b.*,
        case when price< 10000 then '�δ�' else
             case when price <= 20000 then '�����ϴ�' else
                case when price <=30000 then '��δ�' 
                        else '�ʹ���δ�'   
                end
             end
        end as "������"
 from book b
order by price;
-------------------------
--�� �� �����ϰ� 
select b.*,
    case when price < 10000 then '�δ�'
        when price <= 20000 then '�����ϴ�'
        when price <= 30000 then '��δ�'
        else '�ʹ���δ�'
    end as"��"
 from book b
order by price;







