
INSERT INTO Physicians (physician_id,name, phone_num, field, address, certification_num)
VALUES 
('1','John Smith', '123-456-7890', 'Cardiology', '123 Main St, Anytown USA', 'AB12345'),
('2','Jane Doe', '555-555-5555', 'Pediatrics', '456 Elm St, Anytown USA', 'CD67890'),
('3','Mark Johnson', '111-222-3333', 'Oncology', '789 Oak St, Anytown USA', 'EF12345'),
('4','Sarah Lee', '444-444-4444', 'Dermatology', '987 Maple St, Anytown USA', 'GH67890'),
('5','David Kim', '666-666-6666', 'Neurology', '321 Pine St, Anytown USA', 'IJ12345');

INSERT INTO Instructions (instruction_code, description, fee)
VALUES
('IC001', 'MRI Scan', 500),
('IC002', 'Blood Test', 100),
('IC003', 'X-Ray', 200),
('IC004', 'CT Scan', 700),
('IC005', 'EKG', 150);

INSERT INTO nurses (nurse_id, address, name, phone_num, certification_num)
VALUES
('2001','111 Oak St, Anytown USA', 'Emily Lee', '111-111-1111', 'KL12345'),
('2002','2001 Pine St, Anytown USA', 'Jessica Chen', '222-222-2222', 'MN67890'),
('2003','333 Maple St, Anytown USA', 'William Wong', '333-333-3333', 'OP12345'),
('2008','444 Elm St, Anytown USA', 'Olivia Kim', '444-444-4444', 'QR67890'),
('2004','555 Main St, Anytown USA', 'Michael Smith', '555-555-5555', 'ST12345');

INSERT INTO Rooms (room_number, capacity, fee)
VALUES
(101, 1, 100),
(102, 2, 150),
(201, 1, 125),
(103, 2, 175),
(104, 1, 150);

UPDATE rooms
SET room_number = 105
WHERE room_number = 201;



INSERT INTO patients (patient_id, name, phone_num, address, nurse_id, medication_name, medication_amount, room_number, num_nights)
VALUES
(1001, 'John Doe', '123-456-7890', '123 Main St', 2001, 'Aspirin', 2, 101, 3),
(1002, 'Jane Doe', '555-555-5555', '456 Maple St', 2002, 'Ibuprofen', 1, 102, 4),
(1003, 'Bob Smith', '111-111-1111', '789 Oak St', 2003, 'Tylenol', 3, 103, 5),
(1004, 'Samantha Johnson', '222-222-2222', '555 Elm St', 2004, 'Advil', 2, 104, 2),
(1005, 'James Williams', '333-333-3333', '777 Pine St', 2001, 'Motrin', 1, 105, 1);


INSERT INTO health_records (health_id, disease, status, date, description, patient_id)
VALUES
(1, 'Flu', 'Recovered', '2022-01-10', 'Patient was treated with antivirals and rest.', 1001),
(2, 'Broken Arm', 'Healing', '2022-02-15', 'Patient had a cast applied and is scheduled for follow-up.', 1002),
(3, 'Appendicitis', 'Recovered', '2022-03-20', 'Patient had appendectomy surgery and is recovering well.', 1003),
(4, 'Migraine', 'Treated', '2022-04-01', 'Patient was treated with pain medication and rest.', 1004),
(5, 'Pneumonia', 'Healing', '2022-04-15', 'Patient was admitted to hospital and is being treated with antibiotics.', 1005);

INSERT INTO invoices (invoice_id, instruction_fee, room_fee, patient_id)
VALUES
(1, 100, 500, 1001),
(2, 150, 600, 1002),
(3, 200, 700, 1003),
(4, 250, 800, 1004),
(5, 300, 900, 1005);

INSERT INTO payments (payment_id, amount, date, patient_id)
VALUES
(1, 200, '2022-02-01', 1001),
(2, 300, '2022-03-05', 1002),
(3, 400, '2022-04-10', 1003),
(4, 500, '2022-05-15', 1004),
(5, 600, '2022-06-20', 1005);

INSERT INTO Invoice_payments (patient_id, invoice_id, payment_id)
VALUES
(1001, 1, 1),
(1002, 2, 2),
(1003, 3, 3),
(1004, 4, 4),
(1005, 5, 5);

INSERT INTO monitored (patient_id, physician_id, duration)
VALUES 
('1001', '1', '3 days'),
('1002', '2', '2 days'),
('1003', '3', '4 days'),
('1004', '2', '1 day'),
('1005', '1', '5 days');

INSERT INTO Orders (patient_id, instruction_code, physician_id, order_date)
VALUES
('1001', 'IC001', 1, '2023-04-22'),
('1002', 'IC002', 2, '2023-04-23'),
('1003', 'IC003', 3, '2023-04-24'),
('1004', 'IC004', 4, '2023-04-21'),
('1005', 'IC005', 5, '2023-04-20');

INSERT INTO executed (instruction_code, nurse_id, date)
VALUES 
('IC001', '2001', '2023-04-23'),
('IC002', '2002', '2023-04-22'),
('IC003', '2003', '2023-04-21'),
('IC004', '2004', '2023-04-20'),
('IC005', '2008', '2023-04-19');


