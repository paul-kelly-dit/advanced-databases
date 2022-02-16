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



