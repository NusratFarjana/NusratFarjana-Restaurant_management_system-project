
-- PROCEDURES CREATION FOR SAMPLE DATA ENTRY --


--Insertion of RMS_jobs TABLE---

CREATE OR REPLACE PROCEDURE insert_jobs_procd ( 
p_job VARCHAR2 ) IS 
BEGIN
INSERT INTO RMS_jobs ( job_title )
VALUES ( p_job );
END;
/


--Insertion of RMS_EMPLOYEES TABLE---

CREATE OR REPLACE PROCEDURE insert_emp_procd ( 
p_fname VARCHAR2,
p_lname VARCHAR2,
p_ph_number VARCHAR2,
p_email VARCHAR2,
p_address VARCHAR2,
p_hire_date DATE,
p_sal NUMBER,
p_job_type VARCHAR2,
p_gender VARCHAR2,
p_job NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_EMPLOYEES ( FIRST_NAME , LAST_NAME, PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID )
VALUES ( p_fname ,
p_lname ,
p_ph_number ,
p_email ,
p_address ,
p_hire_date ,
p_sal ,
p_job_type ,
p_gender ,
p_job );
END;
/



--Insertion of RMS_USERS TABLE---

CREATE OR REPLACE PROCEDURE insert_user_procd ( 
p_name VARCHAR2,
p_roll_name VARCHAR2,
p_pass VARCHAR2,
p_status VARCHAR2,
p_emp_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_USERS ( USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID )
VALUES (
p_name ,
p_roll_name ,
p_pass ,
p_status ,
p_emp_id );
END;
/


--Insertion of RMS_Expense_Master TABLE---

CREATE OR REPLACE PROCEDURE insert_exp_procd ( 
p_date date ,
p_exp_tot number,
p_emp_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Expense_Master ( Exp_date, Exp_Total, employee_id )
VALUES (
p_date ,
p_exp_tot ,
p_emp_id );
END;
/



--Insertion of RMS_Expense_Type TABLE---

CREATE OR REPLACE PROCEDURE insert_exp_type_procd ( 
p_exp_name VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_Expense_Type ( exp_type_name )
VALUES (
p_exp_name );
END;
/



--Insertion of RMS_Expense_Detail TABLE---

CREATE OR REPLACE PROCEDURE insert_exp_d_procd ( 
p_bill NUMBER,
p_m_id NUMBER,
p_type_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Expense_Detail ( Total_Bill, Exp_m_id, Exp_Type_id )
VALUES (
p_bill ,
p_m_id ,
p_type_id );
END;
/


--Insertion of RMS_Customers TABLE---

CREATE OR REPLACE PROCEDURE insert_cust_procd ( 
p_name VARCHAR2,
p_phone_number VARCHAR2,
p_email VARCHAR2,
p_address VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_Customers ( CUST_NAME, PHONE_NO, EMAIL, ADDRESS )
VALUES (
p_name ,
p_phone_number ,
p_email ,
p_address
);
END;
/





--Insertion of RMS_TABLES TABLE---

CREATE OR REPLACE PROCEDURE insert_table_procd ( 
p_no NUMBER ,
p_sec VARCHAR2,
p_status VARCHAR2

 ) IS 
BEGIN
INSERT INTO RMS_TABLES ( table_no, TABLE_Section,Status )
VALUES (
p_no ,
p_sec ,
p_status );
END;
/



--Insertion of RMS_MEAL_TYPE TABLE---

CREATE OR REPLACE PROCEDURE insert_meal_t_procd ( 
p_meal_tname VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_MEAL_TYPE ( MEAL_TYPE_NAME )
VALUES (
p_meal_tname );
END;
/


--Insertion of RMS_MENU_TYPE TABLE---

CREATE OR REPLACE PROCEDURE ins_menu_t_procd ( 
p_menu_tname VARCHAR2,
p_meal_tid NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_MENU_TYPE ( MENU_TYPE_NAME,MEAL_TYPE_ID )
VALUES (
p_menu_tname ,
p_meal_tid );
END;
/


--Insertion of RMS_MENU TABLE---

CREATE OR REPLACE PROCEDURE insert_menu_procd ( 
p_menu_name VARCHAR2,
p_price NUMBER ,
p_mt_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_MENU ( MENU_NAME, PRICE, MENU_TYPE_ID )
VALUES (
p_menu_name ,
p_price ,
p_mt_id );
END;
/



--Insertion of RMS_ORDER_MASTER TABLE---

CREATE OR REPLACE PROCEDURE insert_om_procd ( 
p_date DATE,
p_ty_name VARCHAR2 ,
p_status VARCHAR2 ,
p_emp_id NUMBER ,
p_cust_id NUMBER ,
p_table_id NUMBER 
 ) IS 
BEGIN
INSERT INTO RMS_ORDER_MASTER ( ORDER_DATE, ORDER_TYPE_NAME, STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID )
VALUES (
p_date ,
p_ty_name ,
p_status ,
p_emp_id ,
p_cust_id ,
p_table_id );
END;
/


--Insertion of RMS_ORDER_DETAIL TABLE---

CREATE OR REPLACE PROCEDURE insert_od_procd ( 
p_qty NUMBER,
p_price NUMBER ,
p_vat NUMBER,
p_om_id NUMBER ,
p_menu_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_ORDER_DETAIL ( QUANTITY, PRICE, VAT, ORDER_M_ID, MENU_ID )
VALUES (
p_qty ,
p_price ,
p_vat ,
p_om_id ,
p_menu_id );
END;
/


--Insertion of RMS_Payment_type TABLE---

CREATE OR REPLACE PROCEDURE ins_pt_procd ( 
p_ty_name  VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_Payment_type ( type_name )
VALUES (
p_ty_name  );
END;
/


--Insertion of RMS_Invoice TABLE---

CREATE OR REPLACE PROCEDURE insert_inv_procd ( 
p_inv_no VARCHAR2,
p_tot_amt NUMBER ,
p_dis NUMBER ,
p_net_amt NUMBER ,
p_om_id NUMBER ,
p_pt_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Invoice ( INVOICE_NO, Total_amount, Discount, net_amount, Order_m_id , PAY_TYPE_ID )
VALUES (
p_inv_no ,
p_tot_amt  ,
p_dis ,
p_net_amt  ,
p_om_id ,
p_pt_id );
END;
/


--Insertion of RMS_Payment_type TABLE---

CREATE OR REPLACE PROCEDURE ins_pt_procd ( 
p_ty_name  VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_Payment_type ( type_name )
VALUES (
p_ty_name  );
END;
/


--Insertion of RMS_PRODUCT_CATEGORY TABLE---

CREATE OR REPLACE PROCEDURE ins_pro_cat_procd ( 
p_pro_cat VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_PRODUCT_CATEGORY ( PRO_CAT_NAME )
VALUES (
p_pro_cat );
END;
/


--Insertion of RMS_PRODUCTS TABLE---

CREATE OR REPLACE PROCEDURE insert_pro_procd (
p_pro VARCHAR2 , 
p_pro_price NUMBER ,
p_unit VARCHAR2 ,
p_stat VARCHAR2 ,
p_pro_cat_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_PRODUCTS ( PRO_NAME, PRO_PRICE, U_OF_M , Status, PRO_CAT_ID )
VALUES (
p_pro ,
p_pro_price ,
p_unit ,
p_stat ,
p_pro_cat_id );
END;
/

--Insertion of RMS_RECIPE_MASTER TABLE---

CREATE OR REPLACE PROCEDURE insert_rm_procd (
p_r_status VARCHAR2 , 
p_cmts VARCHAR2 ,
p_r_emp_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_RECIPE_MASTER ( STATUS, COMMENTS,  EMPLOYEE_ID )
VALUES (
p_r_status ,
p_cmts ,
p_r_emp_id );
END;
/


--Insertion of RMS_stock TABLE---

CREATE OR REPLACE PROCEDURE insert_stock_procd ( 
p_st_qty NUMBER,
p_pro_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_stock ( stock_qty, pro_id )
VALUES (
p_st_qty ,
p_pro_id );
END;
/

--Insertion of RMS_supplier TABLE---

CREATE OR REPLACE PROCEDURE insert_supp_procd ( 
p_sup_name VARCHAR2,
p_supp_add VARCHAR2 ,
p_mobile_no VARCHAR2 ,
p_supp_mail VARCHAR2,
p_com_name VARCHAR2
 ) IS 
BEGIN
INSERT INTO RMS_supplier ( supplier_name, address, phone_no, email, company_name )
VALUES (
p_sup_name ,
p_supp_add ,
p_mobile_no ,
p_supp_mail ,
p_com_name 
);
END;
/

--Insertion of RMS_Purchase_Master TABLE---

CREATE OR REPLACE PROCEDURE insert_pm_procd ( 
p_pur_date DATE,
p_pur_number VARCHAR2,
p_pur_t_name VARCHAR2,
p_psupp_id NUMBER,
p_pemp_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Purchase_Master ( pur_date, pur_number, Pur_type_name, sup_id, employee_id )
VALUES (
p_pur_date ,
p_pur_number ,
p_pur_t_name ,
p_psupp_id ,
p_pemp_id 
);
END;
/


--Insertion of RMS_Purchase_Detail TABLE---

CREATE OR REPLACE PROCEDURE insert_pd_procd ( 
p_pur_qty NUMBER ,
p_unit_pr NUMBER ,
p_vat NUMBER ,
p_dis NUMBER ,
p_pur_m_id NUMBER ,
p_pro_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Purchase_Detail ( pur_Qty, unit_price, vat, discount, pur_m_id, PRO_ID )
VALUES (
p_pur_qty ,
p_unit_pr ,
p_vat ,
p_dis ,
p_pur_m_id ,
p_pro_id );
END;
/


--Insertion of RMS_Payment TABLE---

CREATE OR REPLACE PROCEDURE insert_pay_procd ( 

p_pay_date DATE,
p_tot NUMBER ,
p_pay_dis NUMBER ,
p_pnet NUMBER ,
p_advamt NUMBER ,
p_paidamt NUMBER ,
p_dueamt NUMBER ,
p_purm_id NUMBER ,
p_payt_id NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_Payment ( pay_DATE,Total_amount,Discount,Net_amount, Advance_amount, Paid_amount,Due_amount,pur_m_id,pay_type_id )
VALUES (
p_pay_date ,
p_tot ,
p_pay_dis ,
p_pnet ,
p_advamt ,
p_paidamt ,
p_dueamt ,
p_purm_id ,
p_payt_id );
END;
/




--Insertion of RMS_PURCHASE_RETURN_MASTER TABLE---

CREATE OR REPLACE PROCEDURE insert_prm_procd ( 
p_prm_date DATE,
p_pur_num NUMBER ,
p_pt_name VARCHAR2 ,
p_suppid NUMBER ,
p_premp NUMBER ,
p_pmid NUMBER
 ) IS 
BEGIN
INSERT INTO RMS_PURCHASE_RETURN_MASTER ( PUR_RE_DATE, PUR_NUMBER, PUR_TYPE_NAME, SUP_ID, EMPLOYEE_ID,pur_m_id )
VALUES (
p_prm_date ,
p_pur_num ,
p_pt_name ,
p_suppid ,
p_premp ,
p_pmid 
);
END;
/



--Insertion of RMS_PURCHASE_RETURN_DETAIL TABLE---

CREATE OR REPLACE PROCEDURE insert_prd_procd ( 

p_prd_qty NUMBER ,
p_pr_unit NUMBER ,
p_rvat NUMBER ,
p_rdis NUMBER ,
p_prm_id NUMBER ,
p_rd_pro NUMBER 
 ) IS 
BEGIN
INSERT INTO RMS_PURCHASE_RETURN_DETAIL ( PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID )
VALUES (
p_prd_qty ,
p_pr_unit ,
p_rvat ,
p_rdis ,
p_prm_id ,
p_rd_pro );
END;
/


--Insertion of RMS_PURCHASE_RETURN_PAYMENT TABLE---

CREATE OR REPLACE PROCEDURE insert_rpay_procd ( 

p_r_m_id NUMBER ,
p_ptype_id NUMBER ,
p_ramt NUMBER ,
p_rcevamt NUMBER ,
p_rdue NUMBER 
 ) IS 
BEGIN
INSERT INTO RMS_PURCHASE_RETURN_PAYMENT ( PUR_RE_M_ID, Pay_type_id, RETURN_AMOUNT, RECEIVED_AMOUNT, DUE_AMOUNT )
VALUES (
p_r_m_id ,
p_ptype_id ,
p_ramt ,
p_rcevamt ,
p_rdue 
);
END;
/



--Insertion of RMS_ADVANCE_PAYMENT TABLE---

CREATE OR REPLACE PROCEDURE ins_adpay_procd ( 

p_adpay NUMBER ,
p_adsupp NUMBER ,
p_adpay_tid NUMBER 
 ) IS 
BEGIN
INSERT INTO RMS_ADVANCE_PAYMENT ( ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID )
VALUES (
p_adpay ,
p_adsupp ,
p_adpay_tid );
END;
/






-- CALLING PROCEDURES FOR DATA ENTRIES --

--jobs--

EXECUTE insert_jobs_procd ('Manager')
EXECUTE insert_jobs_procd ('Waiter')
EXECUTE insert_jobs_procd ('Chef')
EXECUTE insert_jobs_procd ('Dish_washer') 
EXECUTE insert_jobs_procd ('Cleaner')

--employees--

EXECUTE insert_emp_procd ('Promod', 'Rozario',+15742616500, 'Promod@gamil.com', 'USA', sysdate,25000,  'contractual','M', 10)
EXECUTE insert_emp_procd ('Yeasin', 'mahmud', +880195200, 'Promod@gamil.com', 'Dhaka', sysdate,25000,  'contractual','M', 20)
EXECUTE insert_emp_procd ('Manzarul', 'Hasan',+88013115200,'HM@gamil.com', 'Rajshahi',sysdate, 20000, 'partime','M', 30)
EXECUTE insert_emp_procd ('Sarah', 'Tylor', +1514560,'ST@gamil.com', 'CANADA',sysdate, 20000, 'CONTRACTUAL','F', 40)
EXECUTE insert_emp_procd ('Rose', 'Martha',01586255845,'ST@gamil.com', 'INDIA',sysdate, 20000, 'Fulltime','F', 50)

--users--

EXECUTE insert_user_procd ('Nusrat','Admin','0977%$##','A',10)
EXECUTE insert_user_procd ('Manzarul','Manager','0975%$##','A',20)
EXECUTE insert_user_procd ('Yeasin','Manager','0979%$##','I',30)
EXECUTE insert_user_procd ('Fahad','Purchaser','0980%$##','A',40)
EXECUTE insert_user_procd ('Anis','Purchaser','0981%$##','I',50)

--Expense_Master--

EXECUTE insert_exp_procd (sysdate, 50000,10)
EXECUTE insert_exp_procd (sysdate, 40000,30)
EXECUTE insert_exp_procd (sysdate, 60000,20)
EXECUTE insert_exp_procd (sysdate, 70000,40)
EXECUTE insert_exp_procd (sysdate, 80000,50)

--Expense_Type --

EXECUTE insert_exp_type_procd ('Rent')
EXECUTE insert_exp_type_procd ('Utility')
EXECUTE insert_exp_type_procd ('Entertainment')
EXECUTE insert_exp_type_procd ('Emp Consumption')
EXECUTE insert_exp_type_procd ('Daily Consumption')

--Expense_Detail --
EXECUTE insert_exp_d_procd (10000,10,30)
EXECUTE insert_exp_d_procd (15000, 30, 20)
EXECUTE insert_exp_d_procd (20000,20,10)
EXECUTE insert_exp_d_procd (25000,50,40)
EXECUTE insert_exp_d_procd (30000,40,50)

--CUSTOMER --
EXECUTE insert_cust_procd ('shah', +8801135200, 'SH@mail.com', 'Dhaka')
EXECUTE insert_cust_procd ('Zara', +880179500, 'ZA@mail.com', 'Dhaka')
EXECUTE insert_cust_procd ('Zahidul', +880135200,'ZI@mail.com', 'Dhaka')
EXECUTE insert_cust_procd ('Irha', +1514560, 'IA@mail.com','CANADA')
EXECUTE insert_cust_procd ('Mithila',015564545, 'MM@mail.com', 'Bangladesh')

--TABLES --
EXECUTE insert_table_procd (01,'RED', 'Booking') 
EXECUTE insert_table_procd (02,'Blue', 'Available')
EXECUTE insert_table_procd (03,'GREEN', 'Occupied')
EXECUTE insert_table_procd (04, 'Yellow', 'Reserved')
EXECUTE insert_table_procd (05,'Diamond', 'Booking')

--MEAL TYPE--
EXECUTE insert_meal_t_procd ('Breakfast')
EXECUTE insert_meal_t_procd ('MID MORNING SNACK')
EXECUTE insert_meal_t_procd ('Lunch')
EXECUTE insert_meal_t_procd ('MID AFTERNOON SNACK')
EXECUTE insert_meal_t_procd ('Dinner')

--MENU TYPE--
EXECUTE ins_menu_t_procd ('DRINKS', 10)
EXECUTE ins_menu_t_procd ('MAIN MENU ', 20)
EXECUTE ins_menu_t_procd ('FAST FOOD', 30)
EXECUTE ins_menu_t_procd ('VEGETARIAN MENU', 40)
EXECUTE ins_menu_t_procd ('DESSERT',50)

--MENU --
EXECUTE insert_menu_procd ('BURGER MINI SIZE', 60, 10)
EXECUTE insert_menu_procd ('Orzo Pasta Salad 1 Bowl', 750, 20)
EXECUTE insert_menu_procd ('Maltesers tiramisu 1P', 500, 30)
EXECUTE insert_menu_procd ('PRAWN SOUP 1 Small Bowl', 800, 40)
EXECUTE insert_menu_procd ('Beef Chilli Onion Small ', 800, 50)

--ORDER_MASTER--
EXECUTE insert_om_procd (sysdate, 'Dine_in', 'Available', 10,30,20)
EXECUTE insert_om_procd (sysdate, 'Take_away', 'Available',10,30,50 )
EXECUTE insert_om_procd ( sysdate, 'Dine_in', 'Available',30,50,10 )
EXECUTE insert_om_procd ( sysdate, 'Take_away', 'Available',20,40,20 )
EXECUTE insert_om_procd (sysdate, 'Dine_in', 'Available',30,30,40 )

--ORDER_DETAIL --
EXECUTE insert_od_procd  (10, 500, 10, 10, 10)
EXECUTE insert_od_procd  (20, 100, 0, 30, 20)
EXECUTE insert_od_procd  (30, 600, 0, 20, 30)
EXECUTE insert_od_procd (30, 600, 0, 40, 30)

--payment_type --
EXECUTE ins_pt_procd ('NAGAD')
EXECUTE ins_pt_procd ('Cash' )
EXECUTE ins_pt_procd ('Bikash' )
EXECUTE ins_pt_procd ('CREDIT CARD')
EXECUTE ins_pt_procd ('ROCKET')

--Invoice--

EXECUTE insert_inv_procd ( 'I11240743', 2000, 0, 2000, 10, 50 )
EXECUTE insert_inv_procd ('I11240692', 3000, 0, 3000, 30, 40 )
EXECUTE insert_inv_procd ('I11240628', 5000, 0 , 5000, 20, 30 )
EXECUTE insert_inv_procd ('I11240629', 6000, 0, 6000, 40, 20 )

--product category--

EXECUTE ins_pro_cat_procd ('MEAT') 
EXECUTE ins_pro_cat_procd ('VEGETABLES')
EXECUTE ins_pro_cat_procd ('GROCERY' )
EXECUTE ins_pro_cat_procd ('FRUITS' )
EXECUTE ins_pro_cat_procd ('SEAFOOD' )
EXECUTE ins_pro_cat_procd ('DRY FRUITS' )

--products --

EXECUTE insert_pro_procd ('BEEF',1000, '1KG', 'Available', 10 )
EXECUTE insert_pro_procd ('CAPSICUM', 1200, '1KG', 'Available', 20 )
EXECUTE insert_pro_procd ('CHEESE', 1500, '1KG' , 'Available', 30 )
EXECUTE insert_pro_procd ('AVOCADO', 1500, '1KG', 'Available', 40 )
EXECUTE insert_pro_procd ('OIL',100, '1LT' , 'Available', 50 )
EXECUTE insert_pro_procd ('GARLIC', 500, '1KG', 'Available', 60 )
EXECUTE insert_pro_procd ('GINGER', 500, '1KG', 'Available', 60 )

--RECIPE_MASTER --

EXECUTE insert_rm_procd  ( 'P', 'Good Food Good Mood', 10 )
EXECUTE insert_rm_procd  ( 'D', 'Good Food Good Mood', 20 )
EXECUTE insert_rm_procd  ( 'C', 'Good Food Good Mood', 30 )
EXECUTE insert_rm_procd  ( 'P', 'Good Food Good Mood', 40 )
EXECUTE insert_rm_procd  ( 'P', 'Good Food Good Mood', 50 )

--STOCK --
EXECUTE insert_stock_procd (200, 10 )
EXECUTE insert_stock_procd (300, 20 )
EXECUTE insert_stock_procd (400, 30 )
EXECUTE insert_stock_procd (450, 40 )
EXECUTE insert_stock_procd (500, 50 )

--supplier--
EXECUTE insert_supp_procd ('Akash', '245-panthapath','01786454952','kb@gmail.com','KB Corporation' )
EXECUTE insert_supp_procd ('Nayeem', '296-panthapath','01762854952','sk@gmail.com','SK Corporation' )
EXECUTE insert_supp_procd ('Sayem', '784-Karwan Bazzar','01762856589','mudi@gmail.com','Mudi Enterprise' ) 
EXECUTE insert_supp_procd ('Yeasin','779-Karwan Bazzar','01642856589','janata@gmail.com','Janata Enterprise' )
EXECUTE insert_supp_procd ('Farhad','109-lalmatia','01938856589','lal@gmail.com','lal Enterprise' )

--Purchase_master--
EXECUTE insert_pm_procd (sysdate, 'P11240701', 'Supplier',10, 10 )
EXECUTE insert_pm_procd (sysdate, 'P11240702', 'Supplier', 20, 20 )
EXECUTE insert_pm_procd (sysdate,'P11240703', 'Local Market',30, 30 )
EXECUTE insert_pm_procd (sysdate, 'P11240704', 'Local Market', 40, 40 )

--Purchase_detail--
EXECUTE insert_pd_procd (10, 500, 10, 20, 10, 10 )
EXECUTE insert_pd_procd (20, 400, 10, 20, 20, 20 )
EXECUTE insert_pd_procd (10, 200, 10, 20, 30, 30 )

-- payment --

EXECUTE insert_pay_procd (sysdate, 5000, 10, 4500, 1000, 2000, 1500, 10, 10 )
EXECUTE insert_pay_procd (sysdate, 6000, 10, 5600, 2000, 2000, 1600, 20, 30 )
EXECUTE insert_pay_procd (sysdate, 7000, 10, 6300, 2000, 3000, 1300, 30, 40 )
EXECUTE insert_pay_procd (sysdate, 8000, 10, 7200, 3000, 2000, 2200, 40, 20 )
 
--PURCHASE_RETURN_MASTER --

EXECUTE insert_prm_procd ( sysdate, 10, 'Supplier', 10, 10, 10 )
EXECUTE insert_prm_procd ( sysdate, 20,'Supplier',  20, 20, 20 )
EXECUTE insert_prm_procd ( sysdate, 30, 'Local Market', 30, 30, 30 )
EXECUTE insert_prm_procd ( sysdate, 40, 'Local Market', 40, 40, 40 )

-- PURCHASE_RETURN_DETAIL--

EXECUTE insert_prd_procd (10, 100, 10, 10, 10, 20 )
EXECUTE insert_prd_procd (10, 200, 10, 10, 20, 40 )
EXECUTE insert_prd_procd (10, 400, 10, 10, 30, 10 )
EXECUTE insert_prd_procd (10, 450, 10, 10, 40, 30 )
EXECUTE insert_prd_procd (10, 350, 10, 10, 40, 50 )

--PURCHASE_RETURN_PAYMENT --

EXECUTE insert_rpay_procd (10, 10, 200, 100, 100 )
EXECUTE insert_rpay_procd (20, 20, 500, 200, 200 )
EXECUTE insert_rpay_procd (30, 30, 700, 200, 500 )
EXECUTE insert_rpay_procd (40, 40, 4000, 2000, 2000 )

--ADVANCE_PAYMENT--

EXECUTE ins_adpay_procd (0,10,10)
EXECUTE ins_adpay_procd (5000,20,20)
EXECUTE ins_adpay_procd (10000,40,40)
EXECUTE ins_adpay_procd (0,50,50)
EXECUTE ins_adpay_procd (1900,30,10)

COMMIT;

--end of insertion by procedure--














--Manual Insert of sample data--

/*
--Insertion of sample data to JOBS TABLE---


INSERT INTO RMS_JOBS( job_title , Delete_status)
VALUES('Manager','N');

INSERT INTO RMS_jobs(job_title,Delete_status)
VALUES('Waiter','N');

INSERT INTO RMS_jobs(job_title,Delete_status)
VALUES('Chef','N');


INSERT INTO RMS_jobs(job_title,Delete_status)
VALUES('Dish_washer','N') ;


INSERT INTO RMS_jobs(job_title,Delete_status)
VALUES('Cleaner','N');



--Insertion of data to employees table---

INSERT INTO RMS_EMPLOYEES (FIRST_NAME,LAST_NAME,PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID)
VALUES('Promod', 'Rozario',+15742616500, 'Promod@gamil.com', 'USA', sysdate,25000,  'contractual','M', 10);


INSERT INTO RMS_EMPLOYEES(FIRST_NAME,LAST_NAME,PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID)
VALUES('Yeasin', 'mahmud', +880195200, 'Promod@gamil.com', 'Dhaka', sysdate,25000,  'contractual','M', 20);


INSERT INTO RMS_EMPLOYEES(FIRST_NAME,LAST_NAME,PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID)
VALUES('Manzarul', 'Hasan',+88013115200,'HM@gamil.com', 'Rajshahi',sysdate, 20000, 'partime','M', 30);


INSERT INTO RMS_EMPLOYEES(FIRST_NAME,LAST_NAME,PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID)
VALUES('Sarah', 'Tylor', +1514560,'ST@gamil.com', 'CANADA',sysdate, 20000, 'CONTRACTUAL','F', 40);


INSERT INTO RMS_EMPLOYEES(FIRST_NAME,LAST_NAME,PHONE_NO, EMAIL, ADDRESS, HIRE_DATE, SALARY, JOB_TYPE ,GENDER,JOB_ID)
VALUES('Rose', 'Martha',01586255845,'ST@gamil.com', 'INDIA',sysdate, 20000, 'Fulltime','F', 50);


--Insertion of data to USERS table---



INSERT INTO RMS_USERS (USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID)
values('Nusrat','Admin','0977%$##','A',10);


INSERT INTO RMS_USERS(USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID)
values('Manzarul','Manager','0975%$##','A',20);


INSERT INTO RMS_USERS(USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID)
values('Yeasin','Manager','0979%$##','I',30);

INSERT INTO RMS_USERS(USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID)
values('Fahad','Purchaser','0980%$##','A',40);

INSERT INTO RMS_USERS(USER_NAME,ROLL_NAME,PASSWORD,STATUS,EMPLOYEE_ID)
values('Anis','Purchaser','0981%$##','I',50);


---Insertion of data to Expense_Master


INSERT INTO RMS_Expense_Master ( Exp_date, Exp_Total, employee_id, delete_status)
VALUES (sysdate, 50000,10,'N');

INSERT INTO RMS_Expense_Master(Exp_date,Exp_Total,  employee_id, delete_status)
VALUES (sysdate, 40000,30,'N');

INSERT INTO RMS_Expense_Master(Exp_date,Exp_Total,  employee_id, delete_status)
VALUES (sysdate, 60000,20,'N');

INSERT INTO RMS_Expense_Master(Exp_date,Exp_Total,  employee_id, delete_status)
VALUES (sysdate, 70000,40,'N');

INSERT INTO RMS_Expense_Master(Exp_date,Exp_Total,  employee_id, delete_status)
VALUES (sysdate, 80000,50,'N');



---Insertion of data to Expense_Type table---


INSERT INTO RMS_Expense_Type (exp_type_name,delete_status)
VALUES('Rent','N');

INSERT INTO RMS_Expense_Type(exp_type_name,delete_status)
VALUES('Utility','N');

INSERT INTO RMS_Expense_Type(exp_type_name,delete_status)
VALUES('Entertainment','N');

INSERT INTO RMS_Expense_Type(exp_type_name,delete_status)
VALUES('Emp Consumption','N');

INSERT INTO RMS_Expense_Type(exp_type_name,delete_status)
VALUES('Daily Consumption','N');



------Insertion of data to Expense_Detail table----

INSERT INTO RMS_Expense_Detail (Total_Bill, Exp_m_id, Exp_Type_id, Delete_status)
VALUES(10000,10,30,'N');


INSERT INTO RMS_Expense_Detail(Total_Bill, Exp_m_id, Exp_Type_id, Delete_status)
VALUES(15000, 30, 20,'N');

INSERT INTO RMS_Expense_Detail(Total_Bill, Exp_m_id, Exp_Type_id, Delete_status)
VALUES(20000,20,10,'N');


INSERT INTO RMS_Expense_Detail(Total_Bill, Exp_m_id, Exp_Type_id, Delete_status)
VALUES(25000,50,40,'N');

INSERT INTO RMS_Expense_Detail(Total_Bill, Exp_m_id, Exp_Type_id, Delete_status)
VALUES(30000,40,50,'N');


------Insertion of data to CUSTOMER table----



INSERT INTO RMS_Customers (CUST_name,PHONE_NO, EMAIL, ADDRESS, Delete_status)
VALUES('shah',+8801135200, 'SH@mail.com', 'Dhaka','N');


INSERT INTO RMS_Customers(CUST_name,PHONE_NO, EMAIL, ADDRESS, Delete_status)
VALUES('Zara',+880179500, 'ZA@mail.com', 'Dhaka','N');


INSERT INTO RMS_Customers(CUST_name,PHONE_NO, EMAIL, ADDRESS, Delete_status)
VALUES('Zahidul',+880135200,'ZI@mail.com', 'Dhaka','N');


INSERT INTO RMS_Customers(CUST_name,PHONE_NO, EMAIL, ADDRESS, Delete_status)
VALUES('Irha', +1514560, 'IA@mail.com','CANADA','F');


INSERT INTO RMS_Customers(CUST_name,PHONE_NO, EMAIL, ADDRESS, Delete_status)
VALUES('Mithila',015564545, 'MM@mail.com', 'Bangladesh','N');



-----------Insertion of data to TABLES table----

INSERT INTO RMS_TABLES (TABLE_NO ,TABLE_Section , STATUS,Delete_status)
VALUES(01,'RED', 'Booking','N');

INSERT INTO RMS_TABLES(table_no, TABLE_Section,Status,delete_status)
VALUES (02,'Blue', 'Available','N');


INSERT INTO RMS_TABLES(table_no, TABLE_Section,Status,delete_status)
VALUES (03,'GREEN', 'Occupied','N');


INSERT INTO RMS_TABLES(table_no, TABLE_Section,Status,delete_status)
VALUES (04, 'Yellow', 'Reserved','N');


INSERT INTO RMS_TABLES(TABLE_NO ,TABLE_Section , STATUS,Delete_status)
VALUES(05,'Diamond', 'Booking','N');



------Insertion of data to MEAL TYPE table--



INSERT INTO RMS_MEAL_TYPE ( MEAL_TYPE_NAME , Delete_status)
VALUES('Breakfast','N');

INSERT INTO RMS_MEAL_TYPE(MEAL_TYPE_NAME, Delete_status)
VALUES('MID MORNING SNACK','N');

INSERT INTO RMS_MEAL_TYPE(MEAL_TYPE_NAME, Delete_status)
VALUES('Lunch','N');

INSERT INTO RMS_MEAL_TYPE(MEAL_TYPE_NAME, Delete_status)
VALUES('MID AFTERNOON SNACK','N');

INSERT INTO RMS_MEAL_TYPE(MEAL_TYPE_NAME, Delete_status)
VALUES('Dinner','N');



-------Insertion of data MENU TYPE table--


INSERT INTO RMS_MENU_TYPE ( MENU_TYPE_NAME,MEAL_TYPE_ID,Delete_status)
VALUES('DRINKS', 10 ,'N');

INSERT INTO RMS_MENU_TYPE(MENU_TYPE_NAME,MEAL_TYPE_ID, Delete_status)
VALUES('MAIN MENU ', 20 ,'N');

INSERT INTO RMS_MENU_TYPE(MENU_TYPE_NAME,MEAL_TYPE_ID, Delete_status)
VALUES('FAST FOOD', 30 ,'N');

INSERT INTO RMS_MENU_TYPE(MENU_TYPE_NAME,MEAL_TYPE_ID, Delete_status)
VALUES('VEGETARIAN MENU',  40,'N');

INSERT INTO RMS_MENU_TYPE(MENU_TYPE_NAME,MEAL_TYPE_ID, Delete_status)
VALUES('DESSERT',50,'N');



------Insertion of data to MENU table--

INSERT INTO RMS_MENU ( MENU_NAME,PRICE, MENU_TYPE_ID, Delete_status)
VALUES('BURGER MINI SIZE', 60, 10,'N');

INSERT INTO RMS_MENU(MENU_NAME, PRICE, MENU_TYPE_ID, Delete_status)
VALUES('Orzo Pasta Salad 1 Bowl', 750, 20,'N');

INSERT INTO RMS_MENU(MENU_NAME, PRICE, MENU_TYPE_ID, Delete_status)
VALUES('Maltesers tiramisu 1P', 500, 30,'N');


INSERT INTO RMS_MENU(MENU_NAME, PRICE, MENU_TYPE_ID, Delete_status)
VALUES('PRAWN SOUP 1 Small Bowl', 800, 40,'N');


INSERT INTO RMS_MENU(MENU_NAME, PRICE, MENU_TYPE_ID, Delete_status)
VALUES('Beef Chilli Onion Small ', 800, 50,'N');


------Insertion of data to ORDER_MASTER  table--


INSERT INTO RMS_ORDER_MASTER ( ORDER_DATE, ORDER_TYPE_NAME,STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID, Delete_status)
VALUES(sysdate, 'Dine_in', 'Available', 10,30,20,'N');

INSERT INTO RMS_ORDER_MASTER( ORDER_DATE, ORDER_TYPE_NAME,STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID, Delete_status)
VALUES(sysdate, 'Take_away', 'Available',10,30,50,'N');

INSERT INTO RMS_ORDER_MASTER(ORDER_DATE, ORDER_TYPE_NAME,STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID, Delete_status)
VALUES( sysdate, 'Dine_in', 'Available',30,50,10,'N');

INSERT INTO RMS_ORDER_MASTER(ORDER_DATE, ORDER_TYPE_NAME,STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID, Delete_status)
VALUES( sysdate, 'Take_away', 'Available',20,40,20,'N');

INSERT INTO RMS_ORDER_MASTER(ORDER_DATE, ORDER_TYPE_NAME,STATUS,EMPLOYEE_ID,CUSTOMER_ID, TABLE_ID, Delete_status)
VALUES(sysdate, 'Dine_in', 'Available',30,30,40,'N');


------Insertion of data to ORDER_DETAIL table---


INSERT INTO RMS_ORDER_DETAIL ( QUANTITY, PRICE, VAT, ORDER_M_ID, MENU_ID)
VALUES(10, 500, 10, 10, 10);

INSERT INTO RMS_ORDER_DETAIL ( QUANTITY, PRICE, VAT, ORDER_M_ID, MENU_ID)
VALUES(20, 100, 0, 30, 20);

INSERT INTO RMS_ORDER_DETAIL ( QUANTITY,PRICE,  VAT, ORDER_M_ID, MENU_ID)
VALUES(30, 600, 0, 20, 30);

INSERT INTO RMS_ORDER_DETAIL ( QUANTITY,PRICE,  VAT, ORDER_M_ID, MENU_ID)
VALUES(30, 600, 0, 40, 30);


-----------Insertion of data to payment_type table------

INSERT INTO RMS_Payment_type (type_name,delete_status)
VALUES('NAGAD','N');

INSERT INTO RMS_Payment_type(type_name,delete_status)
VALUES('Cash','N');

INSERT INTO RMS_Payment_type(type_name,delete_status)
VALUES('Bikash','N');

INSERT INTO RMS_Payment_type(type_name,delete_status)
VALUES('CREDIT CARD','N');

INSERT INTO RMS_Payment_type(type_name,delete_status)
VALUES('ROCKET','N');



------Insertion of data to Invoice table---


INSERT INTO RMS_Invoice ( INVOICE_NO,Total_amount,Discount,net_amount,Order_m_id,PAY_TYPE_ID,Delete_status)
VALUES( 'I11240743', 2000, 0, 2000, 10, 50, 'N');

INSERT INTO RMS_Invoice(INVOICE_NO,Total_amount,Discount,net_amount,Order_m_id,PAY_TYPE_ID,Delete_status)
VALUES('I11240692', 3000, 0, 3000, 30, 40, 'N');

INSERT INTO RMS_Invoice(INVOICE_NO,Total_amount,Discount,net_amount,Order_m_id,PAY_TYPE_ID,Delete_status)
VALUES('I11240628', 5000, 0 , 5000, 20, 30, 'N');

INSERT INTO RMS_Invoice(INVOICE_NO,Total_amount,Discount,net_amount,Order_m_id,PAY_TYPE_ID,Delete_status)
VALUES('I11240629', 6000, 0, 6000, 40, 20, 'N');


------Insertion of data to product category-------



INSERT INTO RMS_PRODUCT_CATEGORY ( PRO_CAT_NAME , DELETE_STATUS)
VALUES('MEAT','N');

INSERT INTO RMS_PRODUCT_CATEGORY( PRO_CAT_NAME, DELETE_STATUS)
VALUES('VEGETABLES','N');

INSERT INTO RMS_PRODUCT_CATEGORY( PRO_CAT_NAME, DELETE_STATUS)
VALUES('GROCERY','N');

INSERT INTO RMS_PRODUCT_CATEGORY( PRO_CAT_NAME, DELETE_STATUS)
VALUES('FRUITS','N');

INSERT INTO RMS_product_category(pro_cat_name,Delete_status)
VALUES('SEAFOOD','N');

INSERT INTO RMS_product_category(pro_cat_name,Delete_status)
VALUES('DRY FRUITS','N');



------Insertion of data to products ------


INSERT INTO RMS_PRODUCTS ( PRO_NAME,PRO_PRICE, U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('BEEF',1000, '1KG', 'Available', 10,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE, U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('CAPSICUM', 1200, '1KG', 'Available', 20,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE,  U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('CHEESE', 1500, '1KG' , 'Available', 30,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE, U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('AVOCADO', 1500, '1KG', 'Available', 40,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE, U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('OIL',100, '1LT' , 'Available', 50,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE, U_OF_M , Status, PRO_CAT_ID, Delete_status)
VALUES('GARLIC', 500, '1KG', 'Available', 60,'N');

INSERT INTO RMS_PRODUCTS(PRO_NAME,PRO_PRICE, U_OF_M ,  Status, PRO_CAT_ID, Delete_status)
VALUES('GINGER', 500, '1KG', 'Available', 60,'N');



------Insertion of data to RECIPE_MASTER---------

INSERT INTO RMS_RECIPE_MASTER ( RECIPE_M_Id, STATUS, COMMENTS, EMPLOYEE_ID, Delete_status)
VALUES(10, 'P', 'Good Food Good Mood', 10,'N');

INSERT INTO RMS_RECIPE_MASTER(RECIPE_M_Id, STATUS, COMMENTS, EMPLOYEE_ID, Delete_status)
VALUES(20, 'D', 'Good Food Good Mood', 20,'N');

INSERT INTO RMS_RECIPE_MASTER(RECIPE_M_Id, STATUS, COMMENTS, EMPLOYEE_ID, Delete_status)
VALUES(30, 'C', 'Good Food Good Mood', 30,'N');

INSERT INTO RMS_RECIPE_MASTER(RECIPE_M_Id, STATUS, COMMENTS, EMPLOYEE_ID, Delete_status)
VALUES(40, 'P', 'Good Food Good Mood', 40,'N');

INSERT INTO RMS_RECIPE_MASTER(RECIPE_M_Id, STATUS, COMMENTS,  EMPLOYEE_ID, Delete_status)
VALUES(50, 'P', 'Good Food Good Mood', 50,'N');




------Insertion of data to STOCK--


INSERT INTO RMS_stock ( stock_qty, pro_id, Delete_status)
VALUES(200, 10, 'N');

INSERT INTO RMS_stock(stock_qty, pro_id, Delete_status)
VALUES(300, 20, 'N');

INSERT INTO RMS_stock(stock_qty, pro_id, Delete_status)
VALUES(400, 30, 'N');

INSERT INTO RMS_stock(stock_qty, pro_id, Delete_status)
VALUES(450, 40, 'N');

INSERT INTO RMS_stock(stock_qty, pro_id, Delete_status)
VALUES(500, 50, 'N');



------Insertion of data to supplier--


INSERT INTO RMS_supplier (supplier_name, address, phone_no, email, company_name, Delete_status)
VALUES('Akash', '245-panthapath','01786454952','kb@gmail.com','KB Corporation','N');

INSERT INTO RMS_supplier(supplier_name, address, phone_no, email, company_name, Delete_status)
VALUES('Nayeem', '296-panthapath','01762854952','sk@gmail.com','SK Corporation','N');

INSERT INTO RMS_supplier(supplier_name, address, phone_no, email, company_name, Delete_status)
VALUES('Sayem', '784-Karwan Bazzar','01762856589','mudi@gmail.com','Mudi Enterprise','N');

INSERT INTO RMS_supplier(supplier_name, address, phone_no, email, company_name, Delete_status)
VALUES('Yeasin','779-Karwan Bazzar','01642856589','janata@gmail.com','Janata Enterprise','N');

INSERT INTO RMS_supplier(supplier_name, address, phone_no, email, company_name, Delete_status)
VALUES('Farhad','109-lalmatia','01938856589','lal@gmail.com','lal Enterprise','N');






---------creating Purchase_master-----

INSERT INTO RMS_Purchase_Master(pur_date, pur_number, Pur_type_name, sup_id, employee_id, Delete_status)
VALUES(sysdate, 'P11240701', 'Supplier',10, 10,'N');

INSERT INTO RMS_Purchase_Master(pur_date, pur_number, Pur_type_name, sup_id, employee_id, Delete_status)
VALUES(sysdate, 'P11240702', 'Supplier', 20, 20,'N');

INSERT INTO RMS_Purchase_Master(pur_date, pur_number, Pur_type_name, sup_id, employee_id, Delete_status)
VALUES(sysdate,'P11240703', 'Local Market',30, 30,'N');

INSERT INTO RMS_Purchase_Master (pur_date, pur_number, Pur_type_name, sup_id, employee_id, Delete_status)
VALUES(sysdate, 'P11240704', 'Local Market', 40, 40,'N');


-----------creating Purchase_detail------------

INSERT INTO RMS_Purchase_Detail ( pur_Qty, unit_price, vat, discount, pur_m_id, PRO_ID, Delete_status)
VALUES(10, 500, 10, 20, 10, 10, 'N');

INSERT INTO RMS_Purchase_Detail(pur_Qty, unit_price, vat, discount, pur_m_id, PRO_ID, Delete_status)
VALUES(20, 400, 10, 20, 20, 20, 'N');

INSERT INTO RMS_Purchase_Detail(pur_Qty, unit_price, vat, discount, pur_m_id, PRO_ID, Delete_status)
VALUES(10, 200, 10, 20, 30, 30, 'N');


------Insertion of data to payment table--


INSERT INTO RMS_Payment (pay_DATE,Total_amount,Discount,Net_amount, Advance_amount, Paid_amount,Due_amount,pur_m_id,pay_type_id,delete_status)
VALUES(sysdate, 5000, 10, 4500, 1000, 2000, 1500, 10, 10,'N');

INSERT INTO RMS_Payment(pay_DATE,Total_amount,Discount,Net_amount, Advance_amount, Paid_amount,Due_amount,pur_m_id,pay_type_id,delete_status)
VALUES(sysdate, 6000, 10, 5600, 2000, 2000, 1600, 20, 30,'N');

INSERT INTO RMS_Payment(pay_DATE,Total_amount,Discount,Net_amount, Advance_amount, Paid_amount,Due_amount,pur_m_id,pay_type_id,delete_status)
VALUES(sysdate, 7000, 10, 6300, 2000, 3000, 1300, 30, 40,'N');

INSERT INTO RMS_Payment(pay_DATE,Total_amount,Discount,Net_amount, Advance_amount, Paid_amount,Due_amount,pur_m_id,pay_type_id,delete_status)
VALUES(sysdate, 8000, 10, 7200, 3000, 2000, 2200, 40, 20,'N');



------Insertion of data to PURCHASE_RETURN_MASTER ----------------

INSERT INTO RMS_PURCHASE_RETURN_MASTER ( PUR_RE_DATE, PUR_NUMBER, PUR_TYPE_NAME, SUP_ID, EMPLOYEE_ID,pur_m_id, Delete_status)
VALUES( sysdate, 10, 'Supplier', 10, 10, 10, 'N');

INSERT INTO RMS_PURCHASE_RETURN_MASTER( PUR_RE_DATE, PUR_NUMBER, PUR_TYPE_NAME, SUP_ID, EMPLOYEE_ID, pur_m_id, Delete_status)
VALUES( sysdate, 20,'Supplier',  20, 20, 20, 'N');

INSERT INTO RMS_PURCHASE_RETURN_MASTER( PUR_RE_DATE, PUR_NUMBER, PUR_TYPE_NAME, SUP_ID, EMPLOYEE_ID, pur_m_id, Delete_status)
VALUES( sysdate, 30, 'Local Market', 30, 30, 30, 'N');

INSERT INTO RMS_PURCHASE_RETURN_MASTER(PUR_RE_DATE, PUR_NUMBER, PUR_TYPE_NAME, SUP_ID, EMPLOYEE_ID, pur_m_id, Delete_status)
VALUES( sysdate, 40, 'Local Market', 40, 40, 40, 'N');



------Insertion of data to PURCHASE_RETURN_DETAIL ----------------

INSERT INTO RMS_PURCHASE_RETURN_DETAIL (PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID, Delete_status)
VALUES(10, 100, 10, 10, 10, 20, 'N');

INSERT INTO RMS_PURCHASE_RETURN_DETAIL(PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID, Delete_status)
VALUES(10, 200, 10, 10, 20, 40, 'N');

INSERT INTO RMS_PURCHASE_RETURN_DETAIL(PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID, Delete_status)
VALUES(10, 400, 10, 10, 30, 10, 'N');

INSERT INTO RMS_PURCHASE_RETURN_DETAIL(PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID, Delete_status)
VALUES(10, 450, 10, 10, 40, 30, 'N');

INSERT INTO RMS_PURCHASE_RETURN_DETAIL(PUR_R_QTY, unit_price, vat, discount, PUR_RE_M_ID, PRO_ID, Delete_status)
VALUES(10, 350, 10, 10, 40, 50, 'N');


------Insertion of data to PURCHASE_RETURN_PAYMENT----------------


INSERT INTO RMS_PURCHASE_RETURN_PAYMENT (PUR_RE_M_ID, Pay_type_id, RETURN_AMOUNT, RECEIVED_AMOUNT, DUE_AMOUNT, Delete_status)
VALUES(10, 10, 200, 100, 100,'N');

INSERT INTO RMS_PURCHASE_RETURN_PAYMENT(PUR_RE_M_ID, Pay_type_id, RETURN_AMOUNT, RECEIVED_AMOUNT, DUE_AMOUNT, Delete_status)
VALUES(20, 20, 500, 200, 200,'N');

INSERT INTO RMS_PURCHASE_RETURN_PAYMENT(PUR_RE_M_ID, Pay_type_id, RETURN_AMOUNT, RECEIVED_AMOUNT, DUE_AMOUNT, Delete_status)
VALUES(30, 30, 700, 200, 500,'N');

INSERT INTO RMS_PURCHASE_RETURN_PAYMENT(PUR_RE_M_ID, Pay_type_id, RETURN_AMOUNT, RECEIVED_AMOUNT, DUE_AMOUNT, Delete_status)
VALUES(40, 40, 4000, 2000, 2000,'N');


---------creating RMS_ADVANCE_PAYMENT----


INSERT INTO  RMS_ADVANCE_PAYMENT (ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID)
VALUES(0,10,10);

INSERT INTO  RMS_ADVANCE_PAYMENT(ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID)
VALUES(5000,20,20);

INSERT INTO  RMS_ADVANCE_PAYMENT(ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID)
VALUES(10000,40,40);

INSERT INTO  RMS_ADVANCE_PAYMENT(ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID)
VALUES(0,50,50);


INSERT INTO  RMS_ADVANCE_PAYMENT(ADVANCE_PAYMENT,SUP_ID,PAY_TYPE_ID)
VALUES(1900,30,10);




commit;


*/
--end of insertion--










