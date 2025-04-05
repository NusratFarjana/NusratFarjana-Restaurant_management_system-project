--------------------------------------------------------------------------------------
-- Name	       : Restaurent Management System
--------------------------------------------------------------------------------------

-- USER CREATION --

conn sys/Oracle123 as sysdba;
--drop user rms cascade;
CREATE USER rms IDENTIFIED BY rms;
GRANT CONNECT, RESOURCE, DBA TO rms;
GRANT UNLIMITED TABLESPACE TO rms;
conn rms/rms;
show user;

--------------------------------------------------------------------------------------
-- Table Names:-
-- RESTAURENT
-- JOBS 
-- EMPLOYEES 
-- USERS 
-- Expense_Master
-- Expense_Type
-- Expense_Detail
-- CUSTOMERS 
-- TABLES
-- MEAL_TYPE
-- MENU_TYPE
-- MENU
-- ORDER_MASTER
-- ORDER_DETAIL
-- Payment_type
-- Invoice
-- Product_category
-- Products
-- Recipe_Master
-- Recipe_Detail
-- Stock
-- supplier
-- Purchase_Master
-- Purchase_Detail
-- Payment
-- Purchase_return_master
-- Purchase_return_detail
-- Purchase_return_payment
-- Advance_payment
-- Customer_Feedback
-- Recipe_master
-- Recipe_master2
-- RECIPE_MENU
-- RECIPE_MENU2
-- SUPPLIER_DUE
-- INGREDIENTS_DETAILS 
-- INGREDIENTS_DETAILS2

--Creation of tables---

CREATE TABLE RMS_RESTAURENT
 (RESTAURENT_Id 	NUMBER(10) constraint  RMS_RESTAURENT_Id_pk PRIMARY KEY,
  RESTAURENT_NAME  	VARCHAR2(20),
  PHONE_NO  		VARCHAR2(20) NOT NULL,
  EMAIL  		VARCHAR2(25),
  ADDRESS  		VARCHAR2(25),
  Delete_status CHAR(1) DEFAULT 'N');

CREATE TABLE RMS_JOBS 
 (JOB_ID  	NUMBER(10) constraint job_id_pk PRIMARY KEY,
  JOB_TITLE  	VARCHAR2(20),
  Delete_status CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_EMPLOYEES 
 (EMPLOYEE_Id  	NUMBER(10) constraint emp_id_pk PRIMARY KEY,
  FIRST_NAME  	VARCHAR2(20),
  LAST_NAME  	VARCHAR2(20) NOT NULL,
  PHONE_NO  	VARCHAR2(20) NOT NULL,
  EMAIL  	VARCHAR2(25),
  ADDRESS  	VARCHAR2(25),
  HIRE_DATE  	DATE DEFAULT SYSDATE NOT NULL,
  SALARY  	NUMBER(10,2),
  JOB_TYPE  	VARCHAR2(30),
  GENDER  	VARCHAR2(10),
  EMP_IMAGE  	BLOB,
  JOB_ID  	NUMBER(10) constraint emp_job_id_fk REFERENCES RMS_JOBS(JOB_Id),
  constraint emp_phone_uk unique(PHONE_NO),
  constraint emp_sal_ck check(salary > 15000),
  Delete_status CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_USERS 
 (USER_Id  	NUMBER(10) constraint user_id_pk PRIMARY KEY,
  User_name 	VARCHAR2(20),
  ROLL_NAME  	VARCHAR2(20) NOT NULL,
  PASSWORD  	VARCHAR2(25) NOT NULL,
  STATUS  	VARCHAR2(25) default 'ACTIVE',
  constraint users_pass_uk unique( PASSWORD),
  CREATE_DATE    DATE     DEFAULT SYSDATE,
  EMPLOYEE_ID NUMBER(10) constraint users_emp_id_fk REFERENCES RMS_EMPLOYEES(EMPLOYEE_Id),
  Delete_status CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_Expense_Master
   (Exp_m_id         NUMBER(10) CONSTRAINT exp_m_id_pk  PRIMARY KEY,
    Exp_date         DATE DEFAULT SYSDATE NOT NULL,
    Exp_Total        NUMBER(10,2),
    EMPLOYEE_ID      NUMBER(10) CONSTRAINT emp_id_fk  REFERENCES RMS_Employees(EMPLOYEE_ID),
    Delete_status    CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_Expense_Type
   (Exp_type_id        NUMBER(20) CONSTRAINT exp_type_id_pk PRIMARY KEY,
    Exp_type_name      VARCHAR2(20),
    Delete_status   	CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_Expense_Detail
    (Exp_d_id       NUMBER(10) CONSTRAINT exp_d_id_pk PRIMARY KEY,
     Total_Bill     NUMBER(10,2),
     Exp_m_id       NUMBER(10) CONSTRAINT exp_m_id_fk REFERENCES RMS_Expense_Master(Exp_m_id),
     Exp_Type_id    NUMBER(20) CONSTRAINT exp_type_id_fk REFERENCES RMS_Expense_Type(Exp_type_id ),
     Delete_status  CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_CUSTOMERS 
 (CUSTOMER_ID  	NUMBER(20) constraint con_cust_id_pk PRIMARY KEY,
  CUST_NAME 	VARCHAR2(20) NOT NULL, 
  PHONE_NO  	VARCHAR2(20) NOT NULL,
  EMAIL  	VARCHAR2(25),
  ADDRESS  	VARCHAR2(25),
  constraint cust_phone_uk unique(PHONE_NO) ,
  Delete_status CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_TABLES
 (TABLE_ID  	      NUMBER(10) constraint table_id_pk PRIMARY KEY,
  TABLE_NO  	      NUMBER(10) NOT NULL,
  TABLE_Section       VARCHAR2(25),
  STATUS  	      VARCHAR2(20) DEFAULT 'Available',
  Delete_status       CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_MEAL_TYPE 
 (MEAL_TYPE_ID  	NUMBER(10) constraint meal_type_id_pk PRIMARY KEY,
  MEAL_TYPE_NAME  	VARCHAR2(50),
  Delete_status  	CHAR(1) DEFAULT 'N');



CREATE TABLE RMS_MENU_TYPE 
 (MENU_TYPE_ID  	NUMBER(10) constraint menu_type_id_pk PRIMARY KEY,
  MENU_TYPE_NAME  	VARCHAR2(20),
  MEAL_TYPE_ID  	NUMBER(20) constraint meal_type_id_fk REFERENCES RMS_MEAL_TYPE(MEAL_TYPE_ID),
  Delete_status  	CHAR(1) DEFAULT 'N');



CREATE TABLE RMS_MENU 
 (MENU_ID  	   	NUMBER(10) constraint men_id_pk PRIMARY KEY,
  MENU_NAME  	   	VARCHAR2(50),
  DESCRIPTION  	   	VARCHAR2(50),
  PICTURE  	    	BLOB,
  STATUS  	 	VARCHAR2(20) DEFAULT 'Available',
  PRICE 		NUMBER(10,2),
  MENU_TYPE_ID     	NUMBER(10) constraint menu_typ_id_fk REFERENCES RMS_MENU_TYPE(MENU_TYPE_ID),
  Delete_status  	CHAR(1) DEFAULT 'N');



CREATE TABLE RMS_CUSTOMER_FEEDBACK
 ( ID  	   		NUMBER(10) constraint custfd_id_pk PRIMARY KEY,
  FEEDBACK	   	VARCHAR2(100),
  COMMENTS	   	VARCHAR2(100),
  CUSTOMER_ID		NUMBER(10) constraint cust_id_fk REFERENCES RMS_CUSTOMERS ( CUSTOMER_ID ),
  MENU_ID		NUMBER(10) constraint menu_id_fk REFERENCES RMS_MENU (MENU_ID ),
  Delete_status  	CHAR(1) DEFAULT 'N');



CREATE TABLE RMS_ORDER_MASTER
 (ORDER_M_ID  	 	NUMBER(10) constraint con_order_id_pk PRIMARY KEY,
  ORDER_DATE  	 	DATE DEFAULT SYSDATE,
  ORDER_TYPE_NAME  	VARCHAR2(20),
  STATUS  	 	VARCHAR2(20) DEFAULT 'Pending',
  EMPLOYEE_ID 	 	NUMBER(10) constraint order_emp_id_fk REFERENCES RMS_EMPLOYEES(EMPLOYEE_ID),
  CUSTOMER_ID  	 	NUMBER(20) constraint order_cust_id_fk REFERENCES RMS_CUSTOMERS(CUSTOMER_ID),
  TABLE_ID  	 	NUMBER(10) constraint order_table_id_fk REFERENCES RMS_TABLES(TABLE_ID),
  Delete_status  	CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_ORDER_DETAIL
 (ORDER_D_ID  	 	NUMBER(10) constraint ord_detail_id_pk PRIMARY KEY,
  QUANTITY  		NUMBER(10),
  PRICE  		NUMBER(10,2),
  VAT  			NUMBER(10,2),
  DISCOUNT 		NUMBER(10,2),
  TOT_PRICE 		NUMBER(10,2),
  ORDER_M_ID	 	NUMBER(10) constraint order_master_id_fk REFERENCES RMS_ORDER_MASTER(ORDER_M_ID),
  MENU_ID  		NUMBER(10) constraint menu_id_fk2 REFERENCES RMS_MENU(MENU_ID),
  Delete_status  	CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_Payment_type
    (Pay_type_id      NUMBER(10) CONSTRAINT pay_type_id_pk  PRIMARY KEY,
     Type_name        VARCHAR2(25),
     Delete_status    CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_Invoice
   (invoice_id           NUMBER(10) CONSTRAINT invo_id_pk PRIMARY KEY,
    invoice_Date         DATE default sysdate,
    invoice_no    	 VARCHAR2(20),
    Total_amount         NUMBER(12,2),
    Discount      	 NUMBER(10,2),
    Vat 		 NUMBER(10,2),
    Net_amount    	 NUMBER(12,2),
    TOTAL_PAID    	 NUMBER(12,2),
    Change  		 NUMBER(12,2),
    DUE                  NUMBER(10,0),
    PAYMENT_STATUS       VARCHAR2(20),
    ORDER_M_ID           NUMBER(10) CONSTRAINT order_m_id_fk REFERENCES RMS_ORDER_MASTER(ORDER_M_ID),
    PAY_TYPE_ID          NUMBER(10) CONSTRAINT pay_type_fk REFERENCES RMS_PAYMENT_TYPE(PAY_TYPE_ID),
    Delete_status  	 CHAR(1) DEFAULT 'N');



create table RMS_product_category
  	(pro_cat_id  	number(10) constraint pro_cat_id_pk primary key,
	 pro_cat_name  	varchar2(40), 
	 Delete_status  char(1) default 'N');



create table RMS_PRODUCTS
 	( pro_id  	number(10) constraint pro_id_pk primary key,
 	 pro_name  	varchar2(40) not null,
      	 Pro_price  	number(10,2),
 	 U_OF_M 	VARCHAR2(20),
 	 Image 		BLOB,		
         Status         VARCHAR2(20),
  	 pro_cat_id  	constraint pro_cat_id_fk references RMS_product_category(pro_cat_id),
	 Delete_status  char(1) default 'N');




 CREATE TABLE RMS_RECIPE_MASTER 
  	(RECIPE_M_Id  	 	NUMBER(10) constraint recp_m_id_pk PRIMARY KEY,
   	 STATUS  	 	VARCHAR2(15) DEFAULT 'PENDING',
	 COMMENTS		VARCHAR2(100),
    	 EMPLOYEE_ID  		NUMBER(10) constraint recp_m_emp_id_fk REFERENCES RMS_EMPLOYEES(EMPLOYEE_ID),
 	 Delete_status   	CHAR(1) DEFAULT 'N');


CREATE TABLE RMS_RECIPE_MASTER2
  	(RECIPE_M_Id  	 	NUMBER(10) constraint recp_m_id2_pk PRIMARY KEY,
   	 STATUS  	 	VARCHAR2(15) DEFAULT 'PENDING',
	 COMMENTS		VARCHAR2(100),
    	 EMPLOYEE_ID  		NUMBER(10) constraint recp_m_emp_id2_fk REFERENCES RMS_EMPLOYEES(EMPLOYEE_ID),
 	 Delete_status   	CHAR(1) DEFAULT 'N');




CREATE TABLE RMS_RECIPE_MENU
 	( RECIPE_MENU_ID	 NUMBER(10) constraint recp_menu_id_pk PRIMARY KEY,
	  QUANTITY		 NUMBER(20),
	 COMMENTS		 VARCHAR2(100),
	 MENU_ID 		 NUMBER(10) constraint recp_men_id_fk REFERENCES RMS_MENU( MENU_ID ),
    	 RECIPE_M_ID		 NUMBER(10) constraint recp_m_id_fk REFERENCES RMS_RECIPE_MASTER( RECIPE_M_ID),
 	 Delete_status   	 CHAR(1) DEFAULT 'N');




CREATE TABLE RMS_RECIPE_MENU2
 	( RECIPE_MENU_ID	 NUMBER(10) constraint recp_menu2_id_pk PRIMARY KEY,
	 QUANTITY		 NUMBER(20),
	 COMMENTS		 VARCHAR2(100),
	 MENU_ID 		 NUMBER(10) constraint recp_men_id2_fk REFERENCES RMS_MENU( MENU_ID ),
    	 RECIPE_M_ID		 NUMBER(10) constraint recp_m_id2_fk REFERENCES RMS_RECIPE_MASTER2( RECIPE_M_ID),
 	 Delete_status   	 CHAR(1) DEFAULT 'N');



CREATE TABLE RMS_INGREDIENTS_DETAILS 
   (	IN_D_ID			 NUMBER(10) constraint ING_D_ID_PK PRIMARY KEY, 
	DESCRIPTION		 VARCHAR2(100),
	QUANTITY		 NUMBER(20,0),
	COMMENTS  		 VARCHAR2(100),
	MENU_ID 		 NUMBER(10) constraint ING_men_id_fk REFERENCES RMS_MENU ( MENU_ID ),
	PRO_ID			 NUMBER(10) constraint ING_PRO_id_fk REFERENCES RMS_PRODUCTS ( pro_id  ),
	RECIPE_M_ID		 NUMBER(10) constraint ING_D_R_M_ID_FK REFERENCES RMS_RECIPE_MASTER ( RECIPE_M_ID),
 	Delete_status   	 CHAR(1) DEFAULT 'N'
   ) ;



CREATE TABLE RMS_INGREDIENTS_DETAILS2
   (	IN_D_ID			 NUMBER(10) constraint ING_D_ID_PK2 PRIMARY KEY, 
	DESCRIPTION		 VARCHAR2(100),
	QUANTITY		 NUMBER(20,0),
	COMMENTS  		 VARCHAR2(100),
	PRO_ID			 NUMBER(10) constraint ING_PRO_id_fk2 REFERENCES RMS_PRODUCTS ( pro_id  ),
	RECIPE_MENU_ID		NUMBER(10) constraint ING_D_ID_FK2 REFERENCES RMS_RECIPE_MENU2 ( RECIPE_MENU_ID ),
 	Delete_status   	 CHAR(1) DEFAULT 'N'
   ) ;




create table RMS_STOCK
 	(STOCK_ID 	number(10) constraint stock_id_pk primary key,
 	 STOCK_QTY 	number (20),
 	 PRO_ID    	NUMBER(10) constraint pro_id_fk references RMS_products(pro_id),
	 Delete_status  char(1) default 'N');



create table RMS_supplier
 	(sup_id 	number(10) constraint supp_id_pk primary key,
 	 supplier_name  varchar2(20),
 	 Phone_no 	varchar2(20),
   	 Email  	varchar2(20),
	 Address 	varchar2(20),
 	 company_name 	varchar2(20),
 	 Delete_status  char(1) default 'N');



create table RMS_Purchase_Master
 	(pur_m_id 	  	number(10) constraint Pur_M_id_pk primary key, 
 	 pur_date  	  	date default sysdate,
 	 pur_number   	  	VARCHAR2(20),
 	 sup_bill 		VARCHAR2(50),
 	 Pur_type_name 	  	VARCHAR2(25),
 	 sup_id 	  	number(20) constraint pur_m_sup_id_fk references RMS_supplier(sup_id),
 	 employee_id 	  	number(20) constraint pur_m_emp_id_fk references RMS_employees(EMPLOYEE_Id),
  	 Delete_status 	    	char(1) default 'N');


create table RMS_Purchase_Detail
 	(pur_d_id 	number(10) constraint pur_d_id_pk primary key,
 	 pur_Qty 	number(20),
 	 unit_price 	number (10,2),
 	 vat 		number (10,2),
 	 discount 	number (10,2),
 	 pur_m_id 	number(10) constraint pur_m_id_fk references RMS_Purchase_Master(pur_m_id),
  	 PRO_ID         NUMBER(10) constraint pur_d_pro_id_fk REFERENCES RMS_PRODUCTS(PRO_ID ),
         Delete_status 	char(1) default 'N');


CREATE TABLE RMS_Payment
   (Pay_ID          	NUMBER(10) constraint pay_id_pk PRIMARY KEY,
    Pay_DATE        	DATE,
    Total_amount    	NUMBER(10,2),
    Discount            NUMBER(8,2),
    Vat                 NUMBER(8,2),
    Net_amount      	NUMBER(12,2),
    Advance_amount  	NUMBER(10,2),
    Paid_amount     	NUMBER(12,2),
    Due_amount      	NUMBER(12,2),
    PAID_FROM_ADVANCE   NUMBER(12,2),
    pur_m_id 		number(10) constraint pur_m_id_fk2 references RMS_Purchase_Master(pur_m_id),
    pay_type_id       	NUMBER(10) constraint paym_type_id_fk REFERENCES RMS_Payment_type(Pay_type_id),
    Delete_status  	CHAR(1) DEFAULT 'N'
);


create table RMS_SUPPLIER_DUE
 	( SUP_DUE_ID		number(10) constraint SUP_DUE_ID_PK primary key,
 	  PUR_NUMBER 		VARCHAR2(30),
 	  PAYMENT_DATE 		DATE,
   	  REMAINING_DUE		NUMBER(20,0),
	  PAY_AMOUNT	 	NUMBER(20,0),
	  TOTAL_DUE	 	NUMBER(20,0),
	  PAY_ID		NUMBER(20) constraint sup_due_Pay_id_fk references RMS_PAYMENT( PAY_ID ),
	  PAY_TYPE_ID	        NUMBER(20,0) constraint sup_due_Pay_type_fk references RMS_PAYMENT_TYPE( PAY_TYPE_ID ),
 	  Delete_status  	char(1) default 'N');



  CREATE TABLE RMS_PURCHASE_RETURN_MASTER 
       (PUR_RE_M_ID  	  	NUMBER(10) constraint PUR_RE_M_ID_PK  PRIMARY KEY, 
	PUR_RE_DATE 	  	DATE DEFAULT sysdate, 
 	pur_number   	  	VARCHAR2(20),
	RETURN_NUMBER	  	VARCHAR2(20), 
	PUR_TYPE_NAME     	VARCHAR2(20), 
	SUP_ID           	NUMBER(20) constraint pur_m_r_sup_id_fk REFERENCES RMS_SUPPLIER(SUP_ID ),
	EMPLOYEE_ID  		NUMBER(20) constraint pur_m_r_emp_id_fk REFERENCES RMS_EMPLOYEES(EMPLOYEE_ID),
 	pur_m_id 		number(10) constraint r_pur_m_id_fk2 references RMS_Purchase_Master(pur_m_id),
	Delete_status 	 	char(1) default 'N');



 CREATE TABLE  RMS_PURCHASE_RETURN_DETAIL 
        (PUR_R_D_ID  	  	 NUMBER(10) constraint PUR_R_D_ID_PK  PRIMARY KEY,
	 PUR_R_QTY        	 NUMBER(20), 
	 unit_price 	  	 number (10,2),
 	 vat 		 	 number (10,2),
 	 discount 		 number (10,2),
 	 PUR_RE_M_ID 	 	 number(10) constraint pur_r_M_id_fk references RMS_PURCHASE_RETURN_MASTER (PUR_RE_M_ID ),
  	 PRO_ID          	 NUMBER(10) constraint pur_re_d_pro_id_fk REFERENCES RMS_PRODUCTS(PRO_ID ),
         Delete_status 	 	 char(1) default 'N');



CREATE TABLE  RMS_PURCHASE_RETURN_PAYMENT 
        (ID  	  	         NUMBER constraint PUR_R_PAY_ID_PK  PRIMARY KEY,
	 PUR_RE_M_ID  	 	 NUMBER constraint pur_r_PAY_id_fk references RMS_PURCHASE_RETURN_MASTER (PUR_RE_M_ID ),
         Pay_type_id  	 	 NUMBER constraint P_R_PAY_Ty_FK references RMS_PAYMENT_TYPE(PAY_TYPE_ID),
         RETURN_AMOUNT       	 NUMBER(10,2),
         RECEIVED_AMOUNT     	 NUMBER(10,2),
         DUE_AMOUNT       	 NUMBER(10,2),
         Delete_status 	         char(1) default 'N');


create table RMS_ADVANCE_PAYMENT
 	(ID 	         	number(10) constraint adv_pay_id_pk primary key,
 	 ADVANCE_PAYMENT 	number (20,2),
 	 SUP_ID           	NUMBER(20) constraint adv_pay_sup_id_fk REFERENCES RMS_SUPPLIER(SUP_ID ),
         Pay_type_id            NUMBER(10) CONSTRAINT payt_type_id_fk  REFERENCES RMS_Payment_type(Pay_type_id),
	 Delete_status   	char(1) default 'N');




----End of tables--

--Creation of Sequences--


CREATE SEQUENCE jobs_seq
 		START WITH 	10
 		INCREMENT BY 	10;

CREATE SEQUENCE emp_seq
 		START WITH 	10
 		INCREMENT BY 	10;

CREATE SEQUENCE users_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE exp_M_seq
		START with 10
		INCREMENT BY 10;


CREATE SEQUENCE exp_type_seq
		START with 10
		INCREMENT BY 10;


CREATE SEQUENCE exp_de_seq
		START with 10
		INCREMENT BY 10;


CREATE SEQUENCE cust_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE table_seq
		START with 10
		INCREMENT BY 10;


CREATE SEQUENCE order_m_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE meal_type_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE menu_type_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE menu_seq
 		START WITH 	10
 		INCREMENT BY 	10;



CREATE SEQUENCE order_d_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE pay_type_seq
		START with 10
		INCREMENT BY 10;



CREATE SEQUENCE pay_seq
		START with 10
		INCREMENT BY 10;



CREATE SEQUENCE invoice_seq
		START with 10
		INCREMENT BY 10;


create sequence product_cat_seq
		start with 10
		increment by 10;


create sequence products_seq
		start with 10
		increment by 10;


CREATE SEQUENCE recipe_master_seq
 		START WITH 	10
 		INCREMENT BY 	10;


CREATE SEQUENCE recipe_detail_seq
 		START WITH 	10
 		INCREMENT BY 	10;



create sequence stock_seq
		start with 10
		increment by 10;


create sequence supplier_seq
		start with 10
		increment by 10;


create sequence Pur_Master_seq
		start with 10
		increment by 10;


create sequence Pur_Detail_seq
		start with 10
		increment by 10;


create sequence Pur_re_Master_seq
		start with 10
		increment by 10;


create sequence Pur_re_Detail_seq
		start with 10
		increment by 10;


create sequence Pur_re_pay_seq
		start with 10
		increment by 10;


create sequence adv_pay_seq
		start with 10
		increment by 10;


create sequence GEN_FEEDBACK_ID
		start with 1
		increment by 1;


create sequence INGREDIENTS_DETAILS_SEQ
		start with 10
		increment by 10;


create sequence SUP_DUE_SEQ
		start with 10
		increment by 10;


create sequence recipe_MENU_seq
		start with 10
		increment by 10;



--End of Sequences--


--Start of Triggers--


create or replace trigger JOB_ID_id_trg
before insert
on RMS_JOBS
for each row
when (new.JOB_ID is null)
begin
 :new.JOB_ID := jobs_seq.nextval;
end;
/


create or replace trigger EMPLOYEE_id_trg
before insert
on RMS_EMPLOYEES  
for each row
when (new.EMPLOYEE_id is null)
begin
 :new.EMPLOYEE_id :=  emp_seq.nextval;
end;
/



create or replace trigger  USER_id_trg
before insert
on  RMS_USERS   
for each row
when (new.USER_id is null)
begin
 :new.USER_id := users_seq.nextval;
end;
/




CREATE OR REPLACE TRIGGER exp_m_trg
   BEFORE  INSERT ON RMS_Expense_Master
   FOR EACH ROW
   WHEN (NEW.exp_m_id IS NULL)
BEGIN
    :NEW.exp_m_id := exp_M_seq.NEXTVAL;
END;
/




CREATE OR REPLACE TRIGGER exp_Type_trg
   BEFORE  INSERT ON RMS_Expense_Type
   FOR EACH ROW
   WHEN (NEW.exp_type_id  IS NULL)
BEGIN
    :NEW.exp_type_id  :=  exp_type_seq.NEXTVAL;
END;
/





CREATE OR REPLACE TRIGGER expense_d_trg
   BEFORE  INSERT ON RMS_Expense_Detail
   FOR EACH ROW
   WHEN (NEW.exp_d_id IS NULL)
BEGIN
    :NEW.exp_d_id :=  exp_de_seq.NEXTVAL;
END;
/


create or replace trigger CUSTOMER_ID_trg
before insert
on RMS_CUSTOMERS  
for each row
when (new.CUSTOMER_ID is null)
begin
 :new.CUSTOMER_ID :=  cust_seq.nextval;
end;
/


create or replace trigger TABLE_ID_trg
before insert
on RMS_TABLES
for each row
when (new.TABLE_ID is null)
begin
 :new.TABLE_ID :=  table_seq.nextval;
end;
/



create or replace trigger ORDER_M_ID_trg
before insert
on RMS_ORDER_MASTER
for each row
when (new.ORDER_M_ID is null)
begin
 :new.ORDER_M_ID:=  order_m_seq.nextval;
end;
/



create or replace trigger MEAL_TYPE_ID_trg
before insert
on RMS_MEAL_TYPE
for each row
when (new.MEAL_TYPE_ID is null)
begin
 :new.MEAL_TYPE_ID:=  meal_type_seq.nextval;
end;
/


create or replace trigger MENU_TYPE_ID_trg
before insert
on RMS_MENU_TYPE
for each row
when (new.MENU_TYPE_ID is null)
begin
 :new.MENU_TYPE_ID:=  menu_type_seq.nextval;
end;
/



create or replace trigger MENU_ID_trg
before insert
on RMS_MENU
for each row
when (new.MENU_ID is null)
begin
 :new.MENU_ID:=  menu_seq.nextval;
end;
/



create or replace trigger ORDER_DETAIL_ID_trg
before insert
on RMS_ORDER_DETAIL
for each row
when (new.ORDER_D_ID is null)
begin
 :new.ORDER_D_ID:=  order_d_seq.nextval;
end;
/



CREATE OR REPLACE TRIGGER payment_type_trg
   BEFORE  INSERT ON RMS_Payment_type
   FOR EACH ROW
   WHEN (NEW.pay_type_id IS NULL)
BEGIN
    :NEW.pay_type_id := pay_type_seq.NEXTVAL;
END;
/



CREATE OR REPLACE TRIGGER payment_trg
   BEFORE  INSERT ON RMS_Payment
   FOR EACH ROW
   WHEN (NEW.pay_ID IS NULL)
BEGIN
    :NEW.pay_ID := pay_seq.NEXTVAL;
END;
/



CREATE OR REPLACE TRIGGER Invoice_trg
   BEFORE  INSERT ON RMS_Invoice
   FOR EACH ROW
   WHEN (NEW.invoice_id IS NULL)
BEGIN
    :NEW.invoice_id :=  invoice_seq.NEXTVAL;
END;
/



create or replace trigger PRO_CAT_ID_trg
before insert
on RMS_product_category
for each row
when (new.PRO_CAT_ID is null)
begin
 :new.PRO_CAT_ID := product_cat_seq.nextval; 
end;
/


create or replace trigger pro_id_trg
before insert
on RMS_products
for each row
when (new.pro_id is null)
begin
 :new.pro_id := products_seq.nextval;
end;
/


create or replace trigger RECIPE_M_Id_trg
before insert
on RMS_RECIPE_MASTER   
for each row
when (new.RECIPE_M_Id is null)
begin
 :new.RECIPE_M_Id := recipe_master_seq.nextval;
end;
/



create or replace trigger stock_id_trg
before insert
on RMS_stock
for each row
when (new.stock_id is null)
begin
 :new.stock_id := stock_seq.nextval;
end;
/


create or replace trigger supplier_id_trg
before insert
on RMS_supplier
for each row
when (new.sup_id  is null)
begin
 :new.sup_id  := supplier_seq.nextval;
end;
/


create or replace trigger purchase_m_id_trg
before insert
on RMS_Purchase_Master
for each row
when (new.pur_m_id  is null)
begin
 :new.pur_m_id  := Pur_Master_seq.nextval;
end;
/



create or replace trigger purchase_d_id_trg
before insert
on RMS_Purchase_Detail
for each row
when (new.pur_d_id is null)
begin
 :new.pur_d_id := Pur_Detail_seq.nextval;
end;
/



create or replace trigger PUR_RE_M_ID_trg
before insert
on RMS_PURCHASE_RETURN_MASTER 
for each row
when (new.PUR_RE_M_ID  is null)
begin
 :new.PUR_RE_M_ID  := Pur_re_Master_seq.nextval;
end;
/



create or replace trigger PUR_R_D_ID_trg
before insert
on RMS_PURCHASE_RETURN_DETAIL
for each row
when (new.PUR_R_D_ID  is null)
begin
 :new.PUR_R_D_ID  := Pur_re_Detail_seq.nextval;
end;
/



create or replace trigger PUR_R_pay_ID_trg
before insert
on  RMS_PURCHASE_RETURN_PAYMENT
for each row
when (new.ID is null)
begin
 :new.ID := Pur_re_pay_seq.nextval;
end;
/




create or replace trigger ADVANCE_PAYMENT_id_trg
before insert
on RMS_ADVANCE_PAYMENT
for each row
when (new.ID is null)
begin
 :new.ID := adv_pay_seq.nextval;
end;
/


create or replace trigger RE_Ings_d_trg
before insert
on RMS_Ingredients_details   
for each row
when (new.in_d_Id  is null)
begin
 :new.in_d_Id  := Ingredients_details_seq.nextval;
end;
/



create or replace TRIGGER SUP_DUE_ID_TRG
before insert
on RMS_SUPPLIER_DUE
for each row
when (new.SUP_DUE_ID  is null)
begin
 :new.SUP_DUE_ID  := SUP_DUE_seq.nextval;
end;
/


create or replace trigger RECIPE_menu_Id_trg
before insert
on RMS_RECIPE_MENU    
for each row
when (new.RECIPE_Menu_Id is null)
begin
 :new.RECIPE_Menu_Id := recipe_MENU_seq.nextval;
end;
/



--End of Triggers---




