/***************************
     UNION, UNION ALL : ������ ó�� 
--UNION : �ߺ������͸� �����ϰ� ������ (�ߺ������ʹ� 1���� ǥ��)
--UNION ALL : �ߺ������͸� �����ؼ� ������(�ߺ������� ��� ���)
��, ��ȸ�ϴ� �÷��� �̸�, ����, ����, Ÿ���� ��ġ�ǵ��� �ۼ�
****************************/
--UNION ��� 
select custid, name from customer where custid in(1,2,3);
select custid, name from customer where custid in(3,4,5);

--UNION���� ���ϱ� : �ߺ������ʹ� �ϳ��� 
select custid, name from customer where custid in(1,2,3)
union
select custid, name from customer where custid in(3,4,5)
;

--UNION ALL�� ���ϱ� : �ߺ������͵� ��� ��� 
select custid, name from customer where custid in(1,2,3)
union all
select custid, name from customer where custid in(3,4,5)
order by name --order by ���� �������� �ۼ�(1����)
;
------------------------------
--MINUS : ������ ó��(���� ����)
select custid, name from customer where custid in(1,2,3)
minus
select custid, name from customer where custid in(3,4,5)
;
-------------------------------
--INTERSECT : ������(�ߺ������� ��ȸ) - ���ι��� ����� ����� ���� 
select custid, name from customer where custid in(1,2,3)
intersect
select custid, name from customer where custid in(3,4,5)
;
----���ι�(join��)
select *
 from (select custid, name from customer where custid in(1,2,3)) a
      inner join (select custid, name from customer where custid in(3,4,5)) b
   on a.custid = b.custid
;
select *
 from (select custid, name from customer where custid in(1,2,3)) a,
      (select custid, name from customer where custid in(3,4,5)) b
   where a.custid = b.custid
;      











