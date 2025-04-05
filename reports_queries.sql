--Query for order invoice report--

select unique c.CUST_NAME,c.CUSTOMER_ID,c.PHONE_NO, e.FIRST_NAME||' '||LAST_NAME Emp_Name ,o.ORDER_M_ID, o.ORDER_DATE,o.ORDER_TYPE_NAME,nvl(t.TABLE_NO,0) Table_no,nvl(t.TABLE_SECTION,'N/A') Table_sec ,m.MENU_NAME ,od.QUANTITY, od.PRICE, nvl(od.VAT,0) vet,nvl(od.DISCOUNT,0) Dis,nvl(od.TOT_PRICE,0) Total_price , i.INVOICE_NO, nvl(i.VAT,0) vat ,nvl(i.DISCOUNT,0) Discount, nvl(i.TOTAL_AMOUNT,0)Total_amt, nvl(i.NET_AMOUNT,0) Net_amount, nvl(i.TOTAL_PAID,0) Received_amt, nvl(i.CHANGE,0) Change 
from rms_CUSTOMERS c, rms_ORDER_MASTER o, rms_EMPLOYEES e, rms_TABLES t, rms_ORDER_DETAIL od, rms_MENU m,rms_INVOICE i 
where c.CUSTOMER_ID=o.CUSTOMER_ID 
and o.EMPLOYEE_ID =e.EMPLOYEE_ID(+) 
and o.TABLE_ID =t.TABLE_ID(+) 
and od.menu_id = m.menu_id 
and o.ORDER_M_ID = od.ORDER_M_ID 
and o.ORDER_M_ID =i.ORDER_M_ID 
and i.INVOICE_NO = :P102_INVOICE_NO 


----Query for customer wise order report--

select distinct nvl(c.CUST_NAME,'N/A') Customer,rownum as SL,c.CUSTOMER_ID,c.PHONE_NO, e.FIRST_NAME||' '||LAST_NAME Emp_Name ,o.ORDER_DATE,o.ORDER_TYPE_NAME, nvl(t.TABLE_NO,0) as Table_no, nvl(t.TABLE_SECTION,'N/A') as Table_name ,m.MENU_NAME ,od.QUANTITY, nvl(od.PRICE,0) Price, nvl(od.VAT,0) as vat_detail,nvl(od.DISCOUNT,0) as dicount_detail,nvl(od.TOT_PRICE,0) Total_Price , nvl(i.TOTAL_AMOUNT, 0) Total_amount, i.INVOICE_NO,nvl(i.VAT,0) as Vat,nvl(i.DISCOUNT,0),nvl(i.NET_AMOUNT,0) Net_total 
from rms_CUSTOMERS c, rms_ORDER_MASTER o, rms_EMPLOYEES e, rms_TABLES t, rms_ORDER_DETAIL od, rms_MENU m, rms_INVOICE i 
where c.CUSTOMER_ID=o.CUSTOMER_ID 
and o.EMPLOYEE_ID =e.EMPLOYEE_ID 
and o.TABLE_ID =t.TABLE_ID(+) 
and od.menu_id = m.menu_id 
and o.ORDER_M_ID = od.ORDER_M_ID 
and o.ORDER_M_ID =i.ORDER_M_ID 
and c.CUST_NAME=nvl(:P450_CUSTOMER,c.CUST_NAME)


--Query for order type wise order report--

select distinct nvl(c.CUST_NAME,'N/A') Customer,rownum as SL,c.CUSTOMER_ID,c.PHONE_NO, e.FIRST_NAME||' '||LAST_NAME Emp_Name ,o.ORDER_DATE,o.ORDER_TYPE_NAME, nvl(t.TABLE_NO,0) as Table_no, nvl(t.TABLE_SECTION,'N/A') as Table_name ,m.MENU_NAME ,od.QUANTITY, nvl(od.PRICE,0) Price, nvl(od.VAT,0) as vat_detail,nvl(od.DISCOUNT,0) as dicount_detail,nvl(od.TOT_PRICE,0) Total_Price , nvl(i.TOTAL_AMOUNT, 0) Total_amount, i.INVOICE_NO,nvl(i.VAT,0) as Vat,nvl(i.DISCOUNT,0),nvl(i.NET_AMOUNT,0) Net_total from rms_CUSTOMERS c, rms_ORDER_MASTER o, rms_EMPLOYEES e, rms_TABLES t, rms_ORDER_DETAIL od, rms_MENU m, rms_INVOICE i 
where c.CUSTOMER_ID=o.CUSTOMER_ID 
and o.EMPLOYEE_ID =e.EMPLOYEE_ID 
and o.TABLE_ID =t.TABLE_ID(+) 
and od.menu_id = m.menu_id 
and o.ORDER_M_ID = od.ORDER_M_ID 
and o.ORDER_M_ID =i.ORDER_M_ID 
and o.ORDER_TYPE_NAME = nvl(:P450_TYPE, o.ORDER_TYPE_NAME)


--Query for month wise order review report--

select rownum as SL, o.ORDER_M_ID, to_char(o.ORDER_DATE,'Month/RR') Order_month, o.ORDER_DATE, nvl(c.CUST_NAME ,'N/A') as customer_name, c.PHONE_NO, e.FIRST_NAME ||' '||e.LAST_NAME Order_By, od.QUANTITY, nvl(i.NET_AMOUNT,0) 
from RMS_ORDER_MASTER o, RMS_ORDER_DETAIL od,RMS_INVOICE i, RMS_EMPLOYEES e , RMS_CUSTOMERS c 
where o.ORDER_M_ID = od.ORDER_M_ID 
and o.ORDER_M_ID = i.ORDER_M_ID 
and o.customer_id = c.customer_id 
and o.EMPLOYEE_ID = e.EMPLOYEE_ID order by ORDER_DATE DESC


--Query for order (matrix) report--

SELECT distinct nvl(c.CUST_NAME,'N/A') Order_from, TO_char(om.ORDER_DATE, 'Month/RR') order_per_month, i.TOTAL_AMOUNT 
from RMS_INVOICE i,RMS_ORDER_MASTER om, RMS_CUSTOMERS c 
where om.ORDER_M_ID = i.ORDER_M_ID 
and om.CUSTOMER_ID = c.CUSTOMER_ID
and om.ORDER_DATE between nvl(to_date(:P450_FROM_DATE_1, 'DD-MON-RR'),ORDER_DATE) 
and nvl(to_date(:P450_TO_DATE_1, 'DD-MON-RR'),ORDER_DATE) 


--Query for monthly/daily/ order report--

select rownum as SL,o.ORDER_M_ID, to_char(o.ORDER_DATE,'Month/RR') Order_month, o.ORDER_DATE, nvl(c.CUST_NAME ,'N/A') as customer_name, c.PHONE_NO, e.FIRST_NAME ||' '||e.LAST_NAME Order_By, od.QUANTITY, nvl(i.NET_AMOUNT,0) 
from RMS_ORDER_MASTER o, RMS_ORDER_DETAIL od,RMS_INVOICE i, RMS_EMPLOYEES e ,RMS_CUSTOMERS c 
where o.ORDER_M_ID = od.ORDER_M_ID 
and o.ORDER_M_ID = i.ORDER_M_ID 
and o.customer_id = c.customer_id 
and o.EMPLOYEE_ID = e.EMPLOYEE_ID 
and o.ORDER_DATE between nvl(to_date(:P450_FROM_DATE_1, 'DD-MON-RR'),ORDER_DATE) 
and nvl(to_date(:P450_TO_DATE_1, 'DD-MON-RR'),ORDER_DATE)


--Query for expense report(matrix) report --

SELECT TO_char(em.EXP_DATE, 'Month/RR') Expense_per_month, em.EXP_TOTAL,et.EXP_TYPE_NAME, NVL(ed.DESCRIPTION,'N/A') 
from RMS_EXPENSE_MASTER em,RMS_EXPENSE_DETAIL ed, RMS_EXPENSE_TYPE et 
where em.EXP_M_ID = ed.EXP_M_ID 
and et.EXP_TYPE_ID = ed.EXP_TYPE_ID 
and em.EXP_DATE between nvl(to_date(:P450_FROM_DATE, 'DD-MON-RR'),EXP_DATE) 
and nvl(to_date(:P450_TO_DATE, 'DD-MON-RR'),EXP_DATE)


--Query for monthly purchase return report --

select 'SL' AS SL, NVL(p.RETURN_NUMBER,'N/A') AS Return_Number,p.PUR_RE_DATE,NVL(p.PUR_NUMBER,'N/A') As Purchase_number,s.SUPPLIER_NAME,e.FIRST_NAME||' '||e.LAST_NAME Return_By, RA.RETURN_AMOUNT, NVL(RA.PAID_AMOUNT, 0), NVL(RA.DUE_AMOUNT,0) 
from RMS_PURCHASE_RETURN_MASTER p, RMS_SUPPLIER s, RMS_EMPLOYEES e, RMS_PURCHASE_RETURN_PAYMENT RA 
WHERE p.EMPLOYEE_ID = e.EMPLOYEE_ID 
AND p.SUP_ID = s.SUP_ID 
AND P.PUR_RE_M_ID = RA.PUR_RE_M_ID 
AND NVL(TO_DATE(p.PUR_RE_DATE, 'Month-YYYY'),p.PUR_RE_DATE) = NVL(TO_DATE(:P450_MONTH,'Month-YYYY'),p.PUR_RE_DATE)


--Query for employee wise purchse report--

select 'SL' AS SL, pr.PUR_DATE, nvl(pr.PUR_NUMBER,'N/A') as PUR_NUMBER, nvl(pr.SUP_BILL,'N/A') as SUP_BILL, s.SUPPLIER_NAME as Supplier, e.FIRST_NAME||' '||e.LAST_NAME as "Purchase by", nvl(p.TOTAL_AMOUNT,0) TOTAL_AMOUNT, nvl(p.VAT,0) VAT, nvl(p.DISCOUNT,0) DISCOUNT, nvl(p.NET_AMOUNT,0) NET_AMOUNT, nvl(p.ADVANCE_AMOUNT,0) ADVANCE_AMOUNT, nvl(p.PAID_FROM_ADVANCE,0) PAID_FROM_ADVANCE, nvl(p.PAID_AMOUNT,0) PAID_AMOUNT, nvl(p.DUE_AMOUNT,0) DUE_AMOUNT 
from RMS_PURCHASE_MASTER pr, RMS_SUPPLIER s, RMS_EMPLOYEES e, RMS_PAYMENT p 
where pr.SUP_ID = s.SUP_ID 
and pr.EMPLOYEE_ID = e.EMPLOYEE_ID 
and pr.PUR_M_ID = p.PUR_M_ID 
and e.EMPLOYEE_ID Like nvl(:P450_EMP_WISE_PURCHASE, e.EMPLOYEE_ID)



--Query for local market wise purchse report --

SELECT p.PUR_DATE , p.PUR_NUMBER ,NVL(p.sup_bill ,0),p.PUR_TYPE_NAME , e.FIRST_NAME||' '||LAST_NAME "Name",pr.PRO_NAME,pd.PUR_QTY,pd.UNIT_PRICE,pd.VAT as P_VAT,pd.DISCOUNT,PAY_DATE,pt.TOTAL_AMOUNT,pt.VAT,NVL(pt.DISCOUNT,0)"Discount",pt.ADVANCE_AMOUNT,pt.PAID_AMOUNT,NET_AMOUNT,pt.DUE_AMOUNT 
FROM rms_PURCHASE_MASTER p, rms_PURCHASE_DETAIL pd, rms_PRODUCTS pr, rms_EMPLOYEES e, rms_PAYMENT pt 
WHERE p.PUR_M_ID = pd.PUR_M_ID 
AND pr.PRO_ID = pd.PRO_ID 
AND e.EMPLOYEE_ID = p.EMPLOYEE_ID 
AND p.PUR_M_ID = pt.PUR_M_ID 
AND p.PUR_TYPE_NAME = 'Local Market' 
AND e.DELETE_STATUS = 'N'



--Query for purchse return (matrix) report --

select 'SL' AS SL, NVL(p.RETURN_NUMBER,'N/A') AS Return_Number,TO_CHAR(p.PUR_RE_DATE,'Month-YYYY'),NVL(p.PUR_NUMBER,'N/A') As Purchase_number,s.SUPPLIER_NAME,e.FIRST_NAME||' '||e.LAST_NAME Return_By, RA.RETURN_AMOUNT, NVL(RA.PAID_AMOUNT, 0), NVL(RA.DUE_AMOUNT,0) 
from RMS_PURCHASE_RETURN_MASTER p, RMS_SUPPLIER s, RMS_EMPLOYEES e, RMS_PURCHASE_RETURN_PAYMENT RA 
WHERE p.EMPLOYEE_ID = e.EMPLOYEE_ID
AND p.SUP_ID = s.SUP_ID 
AND P.PUR_RE_M_ID = RA.PUR_RE_M_ID 
















