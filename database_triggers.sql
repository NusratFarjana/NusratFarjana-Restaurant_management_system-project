
----------database trigger------------------------

--trigger on purchase detail table for update stock and product--

create or replace TRIGGER upd_stock_pur_trg
  AFTER INSERT OR DELETE OR UPDATE ON RMS_PURCHASE_DETAIL
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
     UPDATE RMS_STOCK
     SET STOCK_QTY = NVL(STOCK_QTY,0) + NVL(:new.PUR_QTY,0)*1000
     WHERE pro_id = :NEW.pro_id;

if sql%notfound then
insert into RMS_STOCK (STOCK_QTY, PRO_ID)
values (:new.PUR_QTY*1000, :NEW.pro_id);
end if;

     UPDATE RMS_products
     SET PRO_PRICE = :NEW.UNIT_PRICE
     WHERE pro_id = :NEW.pro_id;
 END IF;
 END upd_stock_pur_trg;
/


/*--check stock query after purchase--

select STOCK_QTY/1000 ,pro_id 
from rms_stock;
*/




--trigger on purchase return for update stock--

create or replace TRIGGER upd_stock_pur_return_trg
AFTER INSERT OR DELETE OR UPDATE ON RMS_PURCHASE_RETURN_DETAIL
FOR EACH ROW
BEGIN
IF INSERTING THEN

    UPDATE RMS_STOCK
    SET STOCK_QTY = NVL(STOCK_QTY,0) - NVL(:NEW.PUR_R_QTY,0)*1000
    WHERE pro_id = :NEW.pro_id;

ELSE
   NULL;
 END IF;
END upd_stock_pur_return_trg;
/


