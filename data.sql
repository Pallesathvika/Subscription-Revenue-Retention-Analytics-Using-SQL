-- Insert into Customers
INSERT INTO customers VALUES
(1,'2023-01-15','USA','Google Ads'),
(2,'2023-02-10','India','Instagram'),
(3,'2023-02-25','UK','Organic'),
(4,'2023-03-05','Canada','Referral'),
(5,'2023-03-20','India','Google Ads'),
(6,'2023-04-01','USA','Facebook'),
(7,'2023-04-15','UK','Instagram'),
(8,'2023-05-01','Canada','Google Ads'),
(9,'2023-05-15','India','Referral'),
(10,'2023-06-01','USA','Organic');

-- Insert into Plans
INSERT INTO plans VALUES
(1,'Basic',499),
(2,'Standard',799),
(3,'Premium',1199);


-- Insert into Subscriptions
INSERT INTO subscriptions VALUES
(101,1,2,'2023-01-15',NULL),
(102,2,1,'2023-02-10','2023-06-10'),
(103,3,3,'2023-02-25',NULL),
(104,4,2,'2023-03-05',NULL),
(105,5,1,'2023-03-20','2023-05-20'),
(106,6,3,'2023-04-01',NULL),
(107,7,2,'2023-04-15',NULL),
(108,8,1,'2023-05-01',NULL),
(109,9,3,'2023-05-15',NULL),
(110,10,2,'2023-06-01',NULL);

-- Insert into Payments
INSERT INTO payments VALUES
(1001,101,'2023-01-15',799,'Success'),
(1002,101,'2023-02-15',799,'Success'),
(1003,102,'2023-02-10',499,'Success'),
(1004,102,'2023-03-10',499,'Failed'),
(1005,103,'2023-02-25',1199,'Success'),
(1006,103,'2023-03-25',1199,'Success'),
(1007,104,'2023-03-05',799,'Success'),
(1008,105,'2023-03-20',499,'Success'),
(1009,105,'2023-04-20',499,'Success'),
(1010,106,'2023-04-01',1199,'Success'),
(1011,107,'2023-04-15',799,'Success'),
(1012,108,'2023-05-01',499,'Success'),
(1013,109,'2023-05-15',1199,'Success'),
(1014,110,'2023-06-01',799,'Success');