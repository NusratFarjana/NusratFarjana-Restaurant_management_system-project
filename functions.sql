--=======Functions==--
-------------------------------------------------------------------------------------
--function for purchase return number--

CREATE SEQUENCE PUR_R_NUMBER_seq;
/

CREATE OR REPLACE FUNCTION PUR_R_NUMBER_fn 
RETURN VARCHAR2
IS
    v_PUR_R_NUMBER   VARCHAR2(20);
    v_mmrr          VARCHAR2(4);
    v_serial_no     NUMBER(4);
BEGIN
    v_mmrr := TO_CHAR(SYSDATE, 'MMRR');
    v_serial_no := PUR_R_NUMBER_seq.NEXTVAL;
    v_PUR_R_NUMBER := 'R' || v_mmrr || LPAD(v_serial_no, 5, '0');   
RETURN v_PUR_R_NUMBER;
END;
/


--function for invoice number--

CREATE SEQUENCE INVOICE_NO_SEQ;
/ 

create or replace FUNCTION invoice_no_fn
RETURN VARCHAR2
IS
    v_invoice_no   VARCHAR2(20);
    v_mmrr          VARCHAR2(4);
    v_serial_no     NUMBER(4);
BEGIN
    v_mmrr := TO_CHAR(SYSDATE, 'MMRR');
    v_serial_no := INVOICE_NO_SEQ.NEXTVAL;
    v_invoice_no := 'I' || v_mmrr || LPAD(v_serial_no, 4, '0');
RETURN v_invoice_no;
END;
/


----function for purchase number--

CREATE SEQUENCE purchase_no_seq;
/

create or replace FUNCTION purchase_no_fn
RETURN VARCHAR2
IS
    v_purchase_no   VARCHAR2(20);
    v_mmrr          VARCHAR2(4);
    v_serial_no     NUMBER(4);
BEGIN
    v_mmrr := TO_CHAR(SYSDATE, 'MMRR');
    v_serial_no := purchase_no_seq.NEXTVAL;
    v_purchase_no := 'P' || v_mmrr || LPAD(v_serial_no, 4, '0');
RETURN v_purchase_no;
END;
/




----function for expense number--

CREATE SEQUENCE EXPENSE_NO_SEQ;
/

create or replace FUNCTION expense_no_fn
RETURN VARCHAR2
IS
    v_expense_no   VARCHAR2(20);
    v_mmrr          VARCHAR2(4);
    v_serial_no     NUMBER(4);
BEGIN
    v_mmrr := TO_CHAR(SYSDATE, 'MMRR');
    v_serial_no := EXPENSE_NO_SEQ.NEXTVAL;
    v_expense_no := 'E' || v_mmrr || LPAD(v_serial_no, 4, '0');
RETURN v_expense_no;
END;
/



