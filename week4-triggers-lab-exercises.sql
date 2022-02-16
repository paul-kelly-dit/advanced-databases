# Question 1
create TRIGGER credit_limit
BEFORE INSERT ON customers
for each row
    begin
        IF (NEW.vip = 'y' AND NEW.creditlimit > 1000) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vip has a 1000 limit';
        END IF;

        IF (NEW.vip = 'n' AND NEW.creditlimit > 500) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Standard has a 500 limit';
        END IF;
    end;

INSERT INTO customers
(cust_id, name, signup, creditlimit, vip, shop_id)
VALUES (2, "PaulKelly", NOW(), 600, 'n', 10);

# Should see an error thrown when you try to execute this.


# Question 2 - cannot change country code

create TRIGGER cannot_change_country_code
BEFORE UPDATE ON shops
for each row
    begin
        IF (OLD.country <> NEW.country) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change country code';
        END IF;
    end;

insert into shops(shop_id, name, address, country) values (1, 'shop 2', 'dublin', 'irl');
# should error
update shops set country = 'uk' where shop_id=1;
# should not error as we are not changing country code
update shops set address = 'carlow' where shop_id=1;


# Solution to exercise 3

create TRIGGER cannot_delete_customer_if_sales_present
before DELETE on customers
for each row
    begin
        if (select count(sales_id) from sales where sales.cust_id = OLD.cust_id > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer has sales, cannot delete';
        end if;
    end;

# Test it out

INSERT INTO customers
(cust_id, name, signup, creditlimit, vip, shop_id)
VALUES (3, "CannotDeleteName", NOW(), 300, 'n', 10);


INSERT into sales
(sales_id, cust_id, tstamp, amount, prod_id) VALUES (1, 3, NOW(), 300, 2)


INSERT INTO customers
(cust_id, name, signup, creditlimit, vip, shop_id)
VALUES (4, "CanDeleteName", NOW(), 300, 'n', 10);

# should error with 'Customer has sales, cannot delete
delete from customers where cust_id = 3;
# should be able to delete as no sales
delete from customers where cust_id = 4;

