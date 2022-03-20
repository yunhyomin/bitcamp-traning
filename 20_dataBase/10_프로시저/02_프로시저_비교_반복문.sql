/*�񱳱��� (�б�ó��) IF�� 
IF (���ǽ�) THEN ~ END IF;
IF (���ǽ�) THEN ~ ELSE ~ END IF;
IF (���ǽ�) THEN ~ ELSIF ...ELSIF...ELSE ~ END IF;
***********************/
--Ȧ��, ¦�� �Ǻ� 
CREATE OR REPLACE PROCEDURE PRC_IF (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUT.PUT_LINE('>>�Է°� : '||IN_NUM);
  
  --Ȧ,¦ �Ǻ� 
  IF(MOD(IN_NUM,2)=0) THEN 
     DBMS_OUTPUT.PUT_LINE('IN_NUM :'||'¦��');   
  ELSE
     DBMS_OUTPUT.PUT_LINE('IN_NUM :'||'Ȧ��');
  END IF;
END PRC_IF;

--------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_IF2 (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUR.PUT_LINE('>>�Է°� :'||IN_NUM);
  
  --4�� ���� ������ �� Ȯ�� 
  IF ( MOD(IN_NUM,4)=0) THEN
    DBMS_OUTPUT.PUT_LINE('>>4�� ���������� 0');
  ELSIF ( MOD(IN_NUM,4)=1) THEN 
    DBMS_OUTPUT.PUT_LINE('>>4�� ���������� 1');
  ELSIF ( MOD(IN_NUM,4)=2) THEN 
    DBMS_OUTPUT.PUT_LINE('>>4�� ���������� 2');
  ELSE
    DBMS_OUTPUT.PUT_LINE('>>4�� ���������� 3');
  END IF;
  
END PRC_IF2;

--===========================================
--�ݺ��� : for, while
--for�� 
------for ���� in �ʱⰪ ....������ loop ~ end loop;
------------------
--����(n)�� �ϳ� �Է¹޾Ƽ� �հ踦 ��� (1~n ������ ��)

CREATE OR REPLACE PROCEDURE PRC_FOR_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0; -- �հ� ���庯��(�ʱⰪ 0)
BEGIN
    --�Է¹��� �� ��� 
    DBMS_OUTPUT.PUT_LINE('�Է°�:'||IN_NUM);
    
    --�Է¹��� ���ڱ����� �հ豸�ϱ�
    -----FOR������ �ݺ�ó�� 
    FOR I IN 1 .. IN_NUM LOOP
        V_SUM := V_SUM+I;
        DBMS_OUTPUT.PUT_LINE('>>I :'||I||' ��:'||V_SUM);
    END LOOP;
    DBMS_OUTPUT.PUT('1����'||IN_NUM||'������ �հ�:');--�ڹ��� print(�ٹٲ�ó�� ����)
    DBMS_OUTPUT.PUT_LINE(V_SUM);--�ڹ��� println(�ٹٲ�ó��)

END PRC_FOR_SUM;

-----------------------------------
--FOR �� REVERSE �ɼ� (����)
--�Էµ� ������ ~ 1���� 
CREATE OR REPLACE PROCEDURE PRC_FOR_REVERSE (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  FOR I IN REVERSE 1..IN_NUM LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END PRC_FOR_REVERSE;
--=======================================================
-- WHILE ��
-- WHILE (���ǽ�) LOOP ~ END LOOP;
-----------------
-- ����(N)�� �ϳ� �Է� �޾Ƽ� �հ� ���(1~N ������ ��)

CREATE OR REPLACE PROCEDURE PRC_WHILE_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    I NUMBER := 1;
BEGIN
    --�Է°� Ȯ�� ��� 
    DBMS_OUTPUT.PUT_LINE('�Է°� :'||IN_NUM);
    
    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM + I;
        I := I+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1~'||IN_NUM||'������ �հ�:'||V_SUM);
END PRC_WHILE_SUM;
------------------------------------

/* LOOP ~ END LOOP; (�ڹ��� WHILE(TRUE)���¿� ����)
LOOP
    EXIT WHEN (�������ǽ�);
END LOOP;
***************************************************/
CREATE OR REPLACE PROCEDURE LOOP1 
AS 
    I NUMBER :=1;
BEGIN
  LOOP 
    DBMS_OUTPUT.PUT_LINE('I:'|| I);
    EXIT WHEN (I>=10);
    I:= I+1;
  END LOOP;
END LOOP1;
--===========================================
/* (�ǽ�) ���ڸ� �ϳ� �Է¹޾Ƽ� 1~���ڱ����� �հ� ���ϱ� 
���ν��� �� : PRC_SUM_EVENODD
-- �Է°��� Ȧ���� Ȧ������ ���ϰ� 
-- �Է°��� ¦���� ¦������ ���ؼ� 
�����հ谪�� ȭ�� ��� 
<�������>
-- �Է¼��� : �Է°�, Ȧ��/¦��, �հ� : �հ谪 
   ��¿�) �Է¼��� : 4, ¦��, �հ� : 6
*****************************************/
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD(
    IN_NUM IN NUMBER 
)
AS
    V_SUM NUMBER := 0;
    I NUMBER := 0;
    V_EVEN_ODD VARCHAR2(6);
BEGIN
   
    WHILE(I <= IN_NUM) LOOP
     IF(MOD(IN_NUM,2)=0) AND (MOD(I,2)=0) THEN -- ¦���϶�  
         V_SUM := V_SUM + I;
         I := I + 2;
         V_EVEN_ODD := '¦��';
     ELSIF (MOD(IN_NUM,2)=1) AND (MOD(I,2)=1) THEN  -- Ȧ���϶� 
         V_SUM := V_SUM + I;
         I := I + 2;
         V_EVEN_ODD := 'Ȧ��';
     END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('�Է¼���:'||IN_NUM||','||V_EVEN_ODD||', '||V_SUM);
END;
------------------------ 
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD2 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--Ȧ��, ¦�� 
    V_MODE NUMBER(1);
BEGIN
    --�Է°� Ȧ/¦ �Ǻ��� Ȧ���� ��� Ȧ����, ¦���� ��� ¦���� ���ϱ� 
    V_MODE := MOD(IN_NUM,2);
    IF (V_MODE = 0) THEN
        V_EVEN_ODD := '¦��';
    ELSE
        V_EVEN_ODD := 'Ȧ��';
    END IF;
    
    --Ȧ���� �Ǵ� ¦���� ���ϱ� 
    FOR I IN 1.. IN_NUM LOOP
        IF(MOD(I,2)= V_MODE) THEN 
            V_SUM := V_SUM+I;
        
        END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('�Է¼���:'||IN_NUM||','||V_EVEN_ODD||', '||V_SUM);
END PRC_SUM_EVENODD2;

-----------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD3 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--Ȧ��, ¦�� 
    I NUMBER := 0;
BEGIN
    --�Է°� Ȧ/¦ �Ǻ��� Ȧ���� ��� Ȧ����, ¦���� ��� ¦���� ���ϱ� 
   
    IF (MOD(IN_NUM,2) =0) THEN --¦��
        I := 2; V_EVEN_ODD := '¦��';
    ELSE
        I := 1; V_EVEN_ODD := 'Ȧ��';
    END IF;
    --Ȧ���� �Ǵ� ¦���� ���ϱ� 
    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM +I;
        I := I+2;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('�Է¼���:'||IN_NUM||', '||V_EVEN_ODD||', '||V_SUM);
END PRC_SUM_EVENODD3;
--------------------------------------
create or replace PROCEDURE PRC_SUM_EVENODD4 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--Ȧ��, ¦�� 
BEGIN
    --�Է°� Ȧ/¦ �Ǻ��� Ȧ���� ��� Ȧ����, ¦���� ��� ¦���� ���ϱ� 
    IF (MOD(IN_NUM,2)=0) THEN
        V_EVEN_ODD := '¦��';
    ELSE
        V_EVEN_ODD := 'Ȧ��';
    END IF;
    --Ȧ���� �Ǵ� ¦���� ���ϱ� 
    FOR I IN 1.. IN_NUM LOOP
        IF(MOD(I,2)=0 AND V_EVEN_ODD = '¦��') THEN 
            V_SUM := V_SUM+I;
        ELSIF (MOD(I,2)=1 AND V_EVEN_ODD = 'Ȧ��')THEN
            V_SUM := V_SUM+I;
        END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('�Է¼���:'||IN_NUM||', '||V_EVEN_ODD||', '||V_SUM);
END /*PRC_SUM_EVENODD4*/;





