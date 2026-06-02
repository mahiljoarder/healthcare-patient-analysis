public.patient_records_cleaning-- ============================================
-- HEALTHCARE PATIENT RECORDS - MESSY DATASET
-- Project 3: Real Life Data Cleaning Practice
-- ============================================
 
CREATE TABLE patient_records (
    record_id           INT,
    patient_id          VARCHAR(20),
    first_name          VARCHAR(50),
    last_name           VARCHAR(50),
    full_name           VARCHAR(100),
    gender              VARCHAR(20),
    date_of_birth       VARCHAR(20),
    phone               VARCHAR(30),
    email               VARCHAR(100),
    address             VARCHAR(200),
    city                VARCHAR(50),
    state               VARCHAR(10),
    zip_code            VARCHAR(15),
    country             VARCHAR(50),
    insurance_provider  VARCHAR(50),
    insurance_number    VARCHAR(30),
    admission_date      VARCHAR(20),
    discharge_date      VARCHAR(20),
    department          VARCHAR(50),
    doctor_name         VARCHAR(100),
    diagnosis           VARCHAR(100),
    blood_type          VARCHAR(10),
    is_active           VARCHAR(10),
    is_insured          VARCHAR(10),
    smoker              VARCHAR(10),
    emergency_contact   VARCHAR(100),
    emergency_phone     VARCHAR(30),
    total_bill          NUMERIC(10,2),
    amount_paid         NUMERIC(10,2),
    balance             NUMERIC(10,2),
    visit_count         INT,
    rating              INT,
    notes               TEXT
);


 INSERT INTO patient_records VALUES
-- Normal clean row
(1, 'P1001', 'James', 'Wilson', 'James Wilson', 'Male', '3/15/1978', '555-123-4567', 'james@gmail.com', '123 Main Street', 'Dallas', 'TX', '75201', 'USA', 'BlueCross', 'BC-1001-X', '1/10/2024', '1/15/2024', 'Cardiology', 'Dr. Smith', 'Hypertension', 'A+', 'Yes', 'Yes', 'No', 'Mary Wilson', '555-987-6543', 1500.00, 1500.00, 0.00, 3, 5, 'Good patient'),
-- Exact duplicate
(2, 'P1001', 'James', 'Wilson', 'James Wilson', 'Male', '3/15/1978', '555-123-4567', 'james@gmail.com', '123 Main Street', 'Dallas', 'TX', '75201', 'USA', 'BlueCross', 'BC-1001-X', '1/10/2024', '1/15/2024', 'Cardiology', 'Dr. Smith', 'Hypertension', 'A+', 'Yes', 'Yes', 'No', 'Mary Wilson', '555-987-6543', 1500.00, 1500.00, 0.00, 3, 5, 'Good patient'),
-- Same patient different ID
(3, 'P1999', 'James', 'Wilson', 'James Wilson', 'Male', '3/15/1978', '555-123-4567', 'james@gmail.com', '123 Main Street', 'Dallas', 'TX', '75201', 'USA', 'BlueCross', 'BC-1001-X', '2/20/2024', '2/25/2024', 'Cardiology', 'Dr. Smith', 'Hypertension', 'A+', 'Yes', 'Yes', 'No', 'Mary Wilson', '555-987-6543', 1800.00, 1800.00, 0.00, 4, 5, 'Follow up visit'),
-- Messy phone
(4, 'P1002', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '7/22/1985', '(777)456-8901', 'maria@gmail.com', '456 Oak Avenue', 'Austin', 'TX', '73301', 'USA', 'Aetna', 'AE-2002-Y', '2/5/2024', '2/8/2024', 'Orthopedics', 'Dr. Johnson', 'Fracture', 'B+', 'Yes', 'Yes', 'No', 'Pedro Garcia', '(777)111-2222', 3200.00, 3200.00, 0.00, 1, 4, 'Cast applied'),
-- Messy phone format 2
(5, 'P1003', 'Robert', 'Brown', 'Robert Brown', 'M', '1985/22/09', '8889073456', 'robert@gmail.com', '789 Pine Road', 'Houston', 'tx', '77001', 'USA', 'United Health', 'UH-3003-Z', '3/10/2024', '3/12/2024', 'Neurology', 'Dr. Davis', 'Migraine', 'O+', 'Y', 'Y', 'Yes', 'Lisa Brown', '8889074567', 950.00, 500.00, 450.00, 2, 3, 'Medication prescribed'),
-- Messy phone format 3
(6, 'P1004', 'Patricia', 'Martinez', 'Patricia Martinez', 'Female', '2/14/1990', '444/567/8902', 'patricia@gmail.com', '101 Elm Street', 'Chicago', 'Il', '60601', 'United States', 'BlueCross', 'BC-4004-A', '3/25/2024', '3/28/2024', 'Pediatrics', 'Dr. Wilson', 'Flu', 'A-', 'Yes', 'Yes', 'No', 'Carlos Martinez', '444/567/8903', 450.00, 450.00, 0.00, 1, 5, 'Recovered well'),
-- Bad email
(7, 'P1005', 'Michael', 'Anderson', 'Michael Anderson', 'Male', '11/30/1972', '333-456-7890', 'michael@gmai.com', '202 Maple Lane', 'New York', 'NY', '10001', 'us', 'Cigna', 'CG-5005-B', '4/1/2024', '4/5/2024', 'Oncology', 'Dr. Brown', 'Cancer Screening', 'B-', 'Yes', 'Yes', 'Yes', 'Sarah Anderson', '333-456-7891', 5000.00, 2500.00, 2500.00, 5, 4, 'Follow up required'),
-- Bad email 2
(8, 'P1006', 'Linda', 'Taylor', 'Linda Taylor', 'F', '1968/15/03', '222-345-6789', 'linda@@gmail.com', '303 Birch Blvd', 'Los Angeles', 'CA', '90001', 'usa', 'Aetna', 'AE-6006-C', '4/15/2024', '4/20/2024', 'Cardiology', 'Dr. Smith', 'Heart Disease', 'AB+', 'Y', 'Y', 'No', 'John Taylor', '222-345-6790', 8500.00, 8500.00, 0.00, 7, 5, 'Surgery scheduled'),
-- Bad email 3
(9, 'P1007', 'William', 'Thomas', 'William Thomas', 'Male', '5/8/1995', '111-234-5678', 'williamgmail.com', '404 Cedar Court', 'San Francisco', 'ca', '94101', 'U.S.A', 'United Health', 'UH-7007-D', '5/5/2024', '5/6/2024', 'Emergency', 'Dr. Johnson', 'Appendicitis', 'O-', 'Yes', 'Yes', 'No', 'Emma Thomas', '111-234-5679', 12000.00, 12000.00, 0.00, 1, 5, 'Emergency surgery'),
-- Missing values
(10, 'P1008', 'Barbara', 'Jackson', 'Barbara Jackson', 'Female', '1980/10/07', '', '', '505 Walnut Way', 'Miami', 'FL', '33101', 'USA', 'Cigna', 'CG-8008-E', '5/20/2024', '5/25/2024', 'Gynecology', 'Dr. Davis', 'Routine Checkup', 'A+', 'Yes', 'Yes', 'No', '', '', 2200.00, 1100.00, 1100.00, 2, 4, 'Annual checkup'),
-- Messy gender
(11, 'P1009', 'Richard', 'White', 'Richard White', 'MALE', '8/18/1965', '999-876-5432', 'richard@gmail.com', '606 Spruce Street', 'Seattle', 'Wa', '98101', 'USA', 'BlueCross', 'BC-9009-F', '6/1/2024', '6/7/2024', 'Urology', 'Dr. Wilson', 'Kidney Stones', 'B+', 'Y', 'Y', 'No', 'Susan White', '999-876-5433', 4500.00, 4500.00, 0.00, 3, 4, 'Procedure done'),
-- Messy gender 2
(12, 'P1010', 'Susan', 'Harris', 'Susan Harris', 'FEMALE', '1972/28/11', '888-765-4321', 'susan@gmail.com', '707 Willow Drive', 'Boston', 'mA', '02101', 'USA', 'Aetna', 'AE-1010-G', '6/15/2024', '6/18/2024', 'Dermatology', 'Dr. Brown', 'Eczema', 'O+', 'Yes', 'Yes', 'No', 'Tom Harris', '888-765-4322', 800.00, 800.00, 0.00, 2, 3, 'Cream prescribed'),
-- Negative bill
(13, 'P1011', 'Joseph', 'Martin', 'Joseph Martin', 'Male', '4/25/1988', '777-654-3210', 'joseph@gmail.com', '808 Ash Avenue', 'Phoenix', 'AZ', '85001', 'america', 'United Health', 'UH-1011-H', '7/1/2024', '7/3/2024', 'Orthopedics', 'Dr. Smith', 'Back Pain', 'A-', 'No', 'No', 'No', 'Anna Martin', '777-654-3211', -250.00, 0.00, -250.00, 1, 2, 'Refund pending'),
-- Future birth date
(14, 'P1012', 'Thomas', 'Thompson', 'Thomas Thompson', 'Male', '3/25/2055', '666-543-2109', 'thomas@gmail.com', '909 Poplar Place', 'Denver', 'CO', '80201', 'USA', 'Cigna', 'CG-1012-I', '7/10/2024', '7/12/2024', 'General', 'Dr. Johnson', 'Cold', 'B-', 'Yes', 'No', 'No', 'Jane Thompson', '666-543-2110', 300.00, 300.00, 0.00, 1, 3, 'Data entry error - check DOB'),
-- Rating out of range
(15, 'P1013', 'Charles', 'Garcia', 'Charles Garcia', 'Male', '9/12/1970', '555-432-1098', 'charles@gmail.com', '1010 Hickory Hill', 'Nashville', 'tn', '37201', 'USA', 'BlueCross', 'BC-1013-J', '8/1/2024', '8/5/2024', 'Cardiology', 'Dr. Davis', 'Arrhythmia', 'AB-', 'Yes', 'Yes', 'Yes', 'Rosa Garcia', '555-432-1099', 6700.00, 3350.00, 3350.00, 4, 8, 'Rating error'),
-- Messy date format
(16, 'P1014', 'Christopher', 'Martinez', 'Christopher Martinez', 'Male', '15/06/1983', '(444)321-0987', 'chris@gmail.com', '1111 Magnolia Blvd', 'Atlanta', 'GA', '30301', 'USA', 'Aetna', 'AE-1014-K', '20/08/2024', '25/08/2024', 'Neurology', 'Dr. Wilson', 'Epilepsy', 'O+', 'Yes', 'Yes', 'No', 'Diana Martinez', '(444)321-0988', 4200.00, 4200.00, 0.00, 2, 4, 'Medication adjusted'),
-- Duplicate exact
(17, 'P1002', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '7/22/1985', '(777)456-8901', 'maria@gmail.com', '456 Oak Avenue', 'Austin', 'TX', '73301', 'USA', 'Aetna', 'AE-2002-Y', '2/5/2024', '2/8/2024', 'Orthopedics', 'Dr. Johnson', 'Fracture', 'B+', 'Yes', 'Yes', 'No', 'Pedro Garcia', '(777)111-2222', 3200.00, 3200.00, 0.00, 1, 4, 'Cast applied'),
-- Missing insurance
(18, 'P1015', 'Daniel', 'Robinson', 'Daniel Robinson', 'M', '6/30/1992', '333-210-9876', 'daniel@gmail.com', '1212 Dogwood Drive', 'Portland', 'OR', '97201', 'USA', '', '', '9/5/2024', '9/6/2024', 'Emergency', 'Dr. Brown', 'Broken Arm', 'A+', 'Y', 'N', 'No', 'Claire Robinson', '333-210-9877', 5500.00, 0.00, 5500.00, 1, 3, 'Uninsured patient'),
-- Normal row
(19, 'P1016', 'Matthew', 'Clark', 'Matthew Clark', 'Male', '12/4/1987', '222-109-8765', 'matthew@gmail.com', '1313 Sycamore Street', 'Detroit', 'MI', '48201', 'USA', 'United Health', 'UH-1016-L', '9/15/2024', '9/18/2024', 'Orthopedics', 'Dr. Smith', 'Knee Surgery', 'B+', 'Yes', 'Yes', 'No', 'Amy Clark', '222-109-8766', 9800.00, 9800.00, 0.00, 2, 5, 'Full recovery'),
-- All nulls chaos
(20, 'P1017', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 'Incomplete record'),
-- Same patient different ID (name+DOB+phone match)
(21, 'P2999', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '7/22/1985', '(777)456-8901', 'maria_new@gmail.com', '456 Oak Avenue', 'Austin', 'TX', '73301', 'USA', 'Aetna', 'AE-2002-Y', '10/5/2024', '10/8/2024', 'Orthopedics', 'Dr. Johnson', 'Follow Up', 'B+', 'Yes', 'Yes', 'No', 'Pedro Garcia', '(777)111-2222', 800.00, 800.00, 0.00, 2, 5, 'Same patient new ID'),
-- Messy smoker field
(22, 'P1018', 'Anthony', 'Lewis', 'Anthony Lewis', 'Male', '1990/15/04', '(666)987-6543', 'anthony@gmail.com', '1414 Chestnut Court', 'Minneapolis', 'MN', '55401', 'USA', 'BlueCross', 'BC-1018-M', '10/10/2024', '10/12/2024', 'Pulmonology', 'Dr. Davis', 'Asthma', 'O-', 'Y', 'Yes', 'YES', 'Betty Lewis', '(666)987-6544', 1800.00, 900.00, 900.00, 3, 4, 'Inhaler prescribed'),
-- Messy is_active
(23, 'P1019', 'Mark', 'Lee', 'Mark Lee', 'Male', '8/7/1975', '555-876-5432', 'mark@yahoo.com', '1515 Elm Court', 'Baltimore', 'MD', '21201', 'USA', 'Cigna', 'CG-1019-N', '11/1/2024', '11/4/2024', 'Cardiology', 'Dr. Wilson', 'Heart Failure', 'A+', 'yes', 'YES', 'No', 'Karen Lee', '555-876-5433', 15000.00, 15000.00, 0.00, 8, 5, 'Critical case'),
-- Duplicate exact
(24, 'P1019', 'Mark', 'Lee', 'Mark Lee', 'Male', '8/7/1975', '555-876-5432', 'mark@yahoo.com', '1515 Elm Court', 'Baltimore', 'MD', '21201', 'USA', 'Cigna', 'CG-1019-N', '11/1/2024', '11/4/2024', 'Cardiology', 'Dr. Wilson', 'Heart Failure', 'A+', 'yes', 'YES', 'No', 'Karen Lee', '555-876-5433', 15000.00, 15000.00, 0.00, 8, 5, 'Critical case'),
-- Messy zip
(25, 'P1020', 'Donald', 'Hall', 'Donald Hall', 'Male', '2/28/1962', '444-765-4321', 'donald@gmail.com', '1616 Pine Court', 'Las Vegas', 'NV', '891 01', 'USA', 'Aetna', 'AE-1020-O', '11/10/2024', '11/15/2024', 'Oncology', 'Dr. Brown', 'Prostate Cancer', 'B-', 'Yes', 'Yes', 'Yes', 'Nancy Hall', '444-765-4322', 22000.00, 11000.00, 11000.00, 6, 4, 'Chemo started'),
-- Messy country
(26, 'P1021', 'George', 'Allen', 'George Allen', 'Male', '1977/08/19', '333-654-3210', 'george@gmail.com', '1717 Oak Court', 'Tucson', 'Az', '85701', 'united states of america', 'United Health', 'UH-1021-P', '11/20/2024', '11/22/2024', 'Urology', 'Dr. Smith', 'UTI', 'A-', 'Y', 'Y', 'No', 'Helen Allen', '333-654-3211', 600.00, 600.00, 0.00, 1, 3, 'Antibiotics'),
-- Missing doctor
(27, 'P1022', 'Kenneth', 'Young', 'Kenneth Young', 'Male', '10/14/1958', '222-543-2109', 'kenneth@gmail.com', '1818 Maple Court', 'Albuquerque', 'NM', '87101', 'USA', 'BlueCross', 'BC-1022-Q', '12/1/2024', '12/5/2024', 'General', '', 'Diabetes', 'O+', 'Yes', 'Yes', 'No', 'Dorothy Young', '222-543-2110', 1200.00, 1200.00, 0.00, 4, 4, 'No doctor assigned'),
-- Overpaid (amount paid more than bill)
(28, 'P1023', 'Steven', 'Hernandez', 'Steven Hernandez', 'Male', '5/19/1993', '111-432-1098', 'steven@gmail.com', '1919 Cedar Court', 'Omaha', 'NE', '68101', 'U.S', 'Cigna', 'CG-1023-R', '12/10/2024', '12/11/2024', 'Emergency', 'Dr. Johnson', 'Allergic Reaction', 'B+', 'Y', 'Y', 'No', 'Lisa Hernandez', '111-432-1099', 800.00, 1200.00, -400.00, 1, 5, 'Overpayment - refund needed'),
-- Messy admission date
(29, 'P1024', 'Edward', 'King', 'Edward King', 'Male', '7/4/1980', '(999)321-0987', 'edward@gmail.com', '2020 Birch Court', 'Sacramento', 'CA', '94201', 'USA', 'Aetna', 'AE-1024-S', '2024/15/01', '2024/20/01', 'Cardiology', 'Dr. Davis', 'Chest Pain', 'AB+', 'Yes', 'Yes', 'Yes', 'Sandra King', '(999)321-0988', 7500.00, 7500.00, 0.00, 3, 4, 'Stent placed'),
-- Duplicate exact
(30, 'P1024', 'Edward', 'King', 'Edward King', 'Male', '7/4/1980', '(999)321-0987', 'edward@gmail.com', '2020 Birch Court', 'Sacramento', 'CA', '94201', 'USA', 'Aetna', 'AE-1024-S', '2024/15/01', '2024/20/01', 'Cardiology', 'Dr. Davis', 'Chest Pain', 'AB+', 'Yes', 'Yes', 'Yes', 'Sandra King', '(999)321-0988', 7500.00, 7500.00, 0.00, 3, 4, 'Stent placed'),
(31, 'P1025', 'Sharon', 'Scott', 'Sharon Scott', 'Female', '3/8/1969', '888-210-9876', 'sharon@gmail.com', '2121 Walnut Court', 'Louisville', 'KY', '40201', 'USA', 'United Health', 'UH-1025-T', '1/5/2024', '1/8/2024', 'Gynecology', 'Dr. Wilson', 'PCOS', 'A+', 'Yes', 'Yes', 'No', 'Frank Scott', '888-210-9877', 1500.00, 1500.00, 0.00, 2, 5, 'Medication started'),
(32, 'P1026', 'Donna', 'Green', 'Donna Green', 'F', '1981/20/06', '777-109-8765', 'donna@gmai.com', '2222 Spruce Court', 'Memphis', 'TN', '38101', 'USA', 'BlueCross', 'BC-1026-U', '2/10/2024', '2/14/2024', 'Dermatology', 'Dr. Brown', 'Psoriasis', 'B-', 'Y', 'Y', 'No', 'Paul Green', '777-109-8766', 950.00, 475.00, 475.00, 3, 3, 'Treatment ongoing'),
(33, 'P1027', 'Carol', 'Adams', 'Carol Adams', 'Female', '6/14/1976', '6665432109', 'carol@gmail.com', '2323 Poplar Court', 'Richmond', 'VA', '23201', 'USA', 'Cigna', 'CG-1027-V', '3/15/2024', '3/17/2024', 'Ophthalmology', 'Dr. Smith', 'Glaucoma', 'O-', 'Yes', 'Yes', 'No', 'Jack Adams', '6665432110', 2800.00, 2800.00, 0.00, 4, 4, 'Eye drops prescribed'),
(34, 'P1028', 'Ruth', 'Baker', 'Ruth Baker', 'FEMALE', '1959/25/08', '555/321/0987', 'ruth@gmail.com', '2424 Hickory Court', 'Hartford', 'CT', '06101', 'USA', 'Aetna', 'AE-1028-W', '4/20/2024', '4/25/2024', 'Orthopedics', 'Dr. Johnson', 'Hip Replacement', 'A-', 'Y', 'Yes', 'No', 'George Baker', '555/321/0988', 18000.00, 18000.00, 0.00, 1, 5, 'Full recovery expected'),
(35, 'P1029', 'Larry', 'Gonzalez', 'Larry Gonzalez', 'Male', '11/11/1984', '444/210/9876', 'larry@gmail.com', '2525 Magnolia Court', 'Raleigh', 'NC', '27601', 'USA', 'United Health', 'UH-1029-X', '5/25/2024', '5/27/2024', 'Gastroenterology', 'Dr. Davis', 'IBS', 'B+', 'Yes', 'Yes', 'No', 'Patricia Gonzalez', '444/210/9877', 1100.00, 550.00, 550.00, 2, 3, 'Diet changes recommended'),
(36, 'P1030', 'Raymond', 'Nelson', 'Raymond Nelson', 'M', '4/17/1971', '(333)109-8765', 'raymond@gmail.com', '2626 Chestnut Court', 'Salt Lake City', 'UT', '84101', 'USA', 'BlueCross', 'BC-1030-Y', '6/30/2024', '7/2/2024', 'Neurology', 'Dr. Wilson', 'Parkinson', 'AB-', 'Yes', 'Yes', 'No', 'Virginia Nelson', '(333)109-8766', 3500.00, 3500.00, 0.00, 5, 4, 'New medication'),
(37, 'P1031', 'Joyce', 'Carter', 'Joyce Carter', 'Female', '1966/30/09', '222/098/7654', 'joyce@@gmail.com', '2727 Elm Avenue', 'Little Rock', 'AR', '72201', 'USA', 'Cigna', 'CG-1031-Z', '7/15/2024', '7/18/2024', 'Cardiology', 'Dr. Brown', 'Atrial Fibrillation', 'O+', 'Y', 'Y', 'Yes', 'Walter Carter', '222/098/7655', 5200.00, 2600.00, 2600.00, 4, 4, 'Cardioversion done'),
(38, 'P1032', 'Eugene', 'Mitchell', 'Eugene Mitchell', 'Male', '2/22/1953', '111/987/6543', 'eugenegmail.com', '2828 Oak Avenue', 'Jackson', 'Ms', '39201', 'USA', 'Aetna', 'AE-1032-A', '8/20/2024', '8/28/2024', 'Oncology', 'Dr. Smith', 'Colon Cancer', 'A+', 'Yes', 'Yes', 'Yes', 'Mildred Mitchell', '111/987/6544', 35000.00, 17500.00, 17500.00, 6, 5, 'Chemotherapy'),
(39, 'P1033', 'Evelyn', 'Perez', 'Evelyn Perez', 'F', '1979/12/07', '(999)876-5432', 'evelyn@yahoo.com', '2929 Pine Avenue', 'Birmingham', 'Al', '35201', 'USA', 'United Health', 'UH-1033-B', '9/10/2024', '9/12/2024', 'Endocrinology', 'Dr. Johnson', 'Thyroid', 'B-', 'Y', 'Y', 'No', 'Ralph Perez', '(999)876-5433', 1300.00, 1300.00, 0.00, 2, 4, 'TSH normal'),
(40, 'P1034', 'Bobby', 'Roberts', 'Bobby Roberts', 'Male', '7/29/1988', '888/765/4321', 'bobby@gmail.com', '3030 Cedar Avenue', 'Augusta', 'GA', '30901', 'america', 'BlueCross', 'BC-1034-C', '10/15/2024', '10/17/2024', 'Orthopedics', 'Dr. Davis', 'Shoulder Injury', 'O+', 'Yes', 'No', 'No', 'Sandra Roberts', '888/765/4322', 4100.00, 0.00, 4100.00, 1, 2, 'Uninsured - payment plan'),
-- Duplicate exact
(41, 'P1033', 'Evelyn', 'Perez', 'Evelyn Perez', 'F', '1979/12/07', '(999)876-5432', 'evelyn@yahoo.com', '2929 Pine Avenue', 'Birmingham', 'Al', '35201', 'USA', 'United Health', 'UH-1033-B', '9/10/2024', '9/12/2024', 'Endocrinology', 'Dr. Johnson', 'Thyroid', 'B-', 'Y', 'Y', 'No', 'Ralph Perez', '(999)876-5433', 1300.00, 1300.00, 0.00, 2, 4, 'TSH normal'),
(42, 'P1035', 'Virginia', 'Turner', 'Virginia Turner', 'Female', '5/5/1964', '777/654/3210', 'virginia@gmail.com', '3131 Birch Avenue', 'Montgomery', 'AL', '36101', 'USA', 'Cigna', 'CG-1035-D', '11/5/2024', '11/10/2024', 'Rheumatology', 'Dr. Wilson', 'Arthritis', 'A-', 'Yes', 'Yes', 'No', 'Roy Turner', '777/654/3211', 2700.00, 2700.00, 0.00, 5, 4, 'Physiotherapy'),
(43, 'P1036', 'Walter', 'Phillips', 'Walter Phillips', 'M', '1960/18/02', '(666)543-2109', 'walter@gmail.com', '3232 Walnut Avenue', 'Baton Rouge', 'La', '70801', 'USA', 'Aetna', 'AE-1036-E', '12/10/2024', '12/15/2024', 'Cardiology', 'Dr. Brown', 'Bypass Surgery', 'B+', 'Y', 'Yes', 'Yes', 'Martha Phillips', '(666)543-2110', 45000.00, 45000.00, 0.00, 3, 5, 'Successful surgery'),
(44, 'P1037', 'Alice', 'Campbell', 'Alice Campbell', 'Female', '9/9/1982', '555/432/1098', 'alice@gmai.com', '3333 Spruce Avenue', 'Des Moines', 'IA', '50301', 'USA', 'United Health', 'UH-1037-F', '1/15/2024', '1/17/2024', 'Dermatology', 'Dr. Smith', 'Acne', 'O-', 'Yes', 'Yes', 'No', 'Henry Campbell', '555/432/1099', 400.00, 400.00, 0.00, 1, 3, 'Topical treatment'),
(45, 'P1038', 'Harold', 'Parker', 'Harold Parker', 'Male', '1955/22/10', '444/321/0987', 'harold@gmail.com', '3434 Poplar Avenue', 'Madison', 'WI', '53701', 'USA', 'BlueCross', 'BC-1038-G', '2/20/2024', '2/28/2024', 'Oncology', 'Dr. Johnson', 'Lung Cancer', 'AB+', 'Yes', 'Yes', 'Yes', 'Frances Parker', '444/321/0988', 28000.00, 14000.00, 14000.00, 7, 4, 'Radiation therapy'),
(46, 'P1039', 'Kathleen', 'Evans', 'Kathleen Evans', 'F', '3/3/1991', '333/210/9876', 'kathleen@gmail.com', '3535 Hickory Avenue', 'Springfield', 'IL', '62701', 'USA', 'Cigna', 'CG-1039-H', '3/25/2024', '3/26/2024', 'Emergency', 'Dr. Davis', 'Appendicitis', 'A+', 'Y', 'Y', 'No', 'Frank Evans', '333/210/9877', 11000.00, 11000.00, 0.00, 1, 5, 'Emergency surgery'),
(47, 'P1040', 'Arthur', 'Edwards', 'Arthur Edwards', 'Male', '1948/05/12', '222/109/8765', 'arthur@gmail.com', '3636 Magnolia Avenue', 'Columbia', 'SC', '29201', 'USA', 'Aetna', 'AE-1040-I', '4/30/2024', '5/8/2024', 'Geriatrics', 'Dr. Wilson', 'Dementia', 'B-', 'Yes', 'Yes', 'No', 'Doris Edwards', '222/109/8766', 8500.00, 8500.00, 0.00, 10, 4, 'Memory care'),
(48, 'P1041', 'Judith', 'Collins', 'Judith Collins', 'Female', '6/25/1973', '111/098/7654', 'judith@@gmail.com', '3737 Chestnut Avenue', 'Augusta', 'ME', '04330', 'USA', 'United Health', 'UH-1041-J', '5/15/2024', '5/17/2024', 'Gynecology', 'Dr. Brown', 'Fibroids', 'O+', 'Y', 'Yes', 'No', 'Samuel Collins', '111/098/7655', 6200.00, 3100.00, 3100.00, 2, 4, 'Surgery planned'),
(49, 'P1042', 'Ryan', 'Stewart', 'Ryan Stewart', 'Male', '1996/28/02', '(888)987-6543', 'ryan@gmail.com', '3838 Elm Street', 'Annapolis', 'MD', '21401', 'USA', 'BlueCross', 'BC-1042-K', '6/20/2024', '6/21/2024', 'Emergency', 'Dr. Smith', 'Sports Injury', 'A-', 'Yes', 'Yes', 'No', 'Kevin Stewart', '(888)987-6544', 2100.00, 2100.00, 0.00, 1, 5, 'MRI done'),
(50, 'P1043', 'Diane', 'Sanchez', 'Diane Sanchez', 'F', '8/12/1967', '777/876/5432', 'diane@gmail.com', '3939 Oak Street', 'Trenton', 'NJ', '08601', 'USA', 'Cigna', 'CG-1043-L', '7/25/2024', '7/30/2024', 'Nephrology', 'Dr. Johnson', 'Kidney Disease', 'B+', 'Yes', 'Yes', 'No', 'Carlos Sanchez', '777/876/5433', 9500.00, 9500.00, 0.00, 6, 4, 'Dialysis started'),
(51, 'P1044', 'Roger', 'Morris', 'Roger Morris', 'Male', '1963/15/04', '666/765/4321', 'roger@gmail.com', '4040 Pine Street', 'Concord', 'NH', '03301', 'USA', 'Aetna', 'AE-1044-M', '8/10/2024', '8/14/2024', 'Pulmonology', 'Dr. Davis', 'COPD', 'AB-', 'Y', 'Y', 'Yes', 'Joan Morris', '666/765/4322', 4800.00, 2400.00, 2400.00, 5, 3, 'Oxygen therapy'),
(52, 'P1045', 'Angela', 'Rogers', 'Angela Rogers', 'FEMALE', '4/4/1989', '555/654/3210', 'angela@gmail.com', '4141 Cedar Street', 'Providence', 'RI', '02901', 'USA', 'United Health', 'UH-1045-N', '9/15/2024', '9/16/2024', 'Psychiatry', 'Dr. Wilson', 'Depression', 'O-', 'Yes', 'Yes', 'No', 'Bruce Rogers', '555/654/3211', 1200.00, 1200.00, 0.00, 3, 4, 'Therapy started'),
(53, 'P1046', 'Joe', 'Reed', 'Joe Reed', 'Male', '1974/22/07', '444/543/2109', 'joe@gmail.com', '4242 Birch Street', 'Dover', 'DE', '19901', 'USA', 'BlueCross', 'BC-1046-O', '10/20/2024', '10/22/2024', 'Gastroenterology', 'Dr. Brown', 'Crohns Disease', 'A+', 'Y', 'Y', 'No', 'Phyllis Reed', '444/543/2110', 3300.00, 3300.00, 0.00, 4, 4, 'Medication adjusted'),
(54, 'P1047', 'Michelle', 'Cook', 'Michelle Cook', 'Female', '2/9/1986', '333/432/1098', 'michelle@gmai.com', '4343 Walnut Street', 'Montpelier', 'VT', '05601', 'USA', 'Cigna', 'CG-1047-P', '11/25/2024', '11/27/2024', 'Endocrinology', 'Dr. Smith', 'Diabetes', 'B-', 'Yes', 'Yes', 'No', 'Gary Cook', '333/432/1099', 1800.00, 900.00, 900.00, 5, 3, 'Insulin adjusted'),
(55, 'P1048', 'Jonathan', 'Morgan', 'Jonathan Morgan', 'M', '1957/30/11', '222/321/0987', 'jonathan@gmail.com', '4444 Spruce Street', 'Augusta', 'GA', '30901', 'USA', 'Aetna', 'AE-1048-Q', '12/15/2024', '12/22/2024', 'Geriatrics', 'Dr. Johnson', 'Osteoporosis', 'O+', 'Y', 'Yes', 'No', 'Shirley Morgan', '222/321/0988', 6700.00, 6700.00, 0.00, 8, 5, 'Calcium supplements'),
-- Duplicate exact
(56, 'P1048', 'Jonathan', 'Morgan', 'Jonathan Morgan', 'M', '1957/30/11', '222/321/0987', 'jonathan@gmail.com', '4444 Spruce Street', 'Augusta', 'GA', '30901', 'USA', 'Aetna', 'AE-1048-Q', '12/15/2024', '12/22/2024', 'Geriatrics', 'Dr. Johnson', 'Osteoporosis', 'O+', 'Y', 'Yes', 'No', 'Shirley Morgan', '222/321/0988', 6700.00, 6700.00, 0.00, 8, 5, 'Calcium supplements'),
(57, 'P1049', 'Carolyn', 'Bell', 'Carolyn Bell', 'Female', '10/16/1978', '111/210/9876', 'carolyn@gmail.com', '4545 Poplar Street', 'Helena', 'MT', '59601', 'USA', 'United Health', 'UH-1049-R', '1/20/2024', '1/22/2024', 'Ophthalmology', 'Dr. Davis', 'Cataracts', 'A-', 'Yes', 'Yes', 'No', 'Lawrence Bell', '111/210/9877', 5500.00, 5500.00, 0.00, 3, 4, 'Surgery successful'),
(58, 'P1050', 'Justin', 'Murphy', 'Justin Murphy', 'Male', '1993/08/05', '(777)109-8765', 'justin@yahoo.com', '4646 Hickory Street', 'Bismarck', 'ND', '58501', 'USA', 'BlueCross', 'BC-1050-S', '2/25/2024', '2/26/2024', 'Emergency', 'Dr. Wilson', 'Concussion', 'B+', 'Y', 'Y', 'No', 'Deborah Murphy', '(777)109-8766', 3200.00, 3200.00, 0.00, 1, 5, 'CT scan normal'),
(59, 'P1051', 'Amanda', 'Rivera', 'Amanda Rivera', 'F', '7/7/1981', '666/098/7654', 'amanda@gmail.com', '4747 Magnolia Street', 'Pierre', 'SD', '57501', 'USA', 'Cigna', 'CG-1051-T', '3/30/2024', '4/2/2024', 'Psychiatry', 'Dr. Brown', 'Anxiety', 'O-', 'Yes', 'Yes', 'No', 'Jose Rivera', '666/098/7655', 1500.00, 750.00, 750.00, 4, 4, 'CBT started'),
(60, 'P1052', 'Jesse', 'Cook', 'Jesse Cook', 'Male', '1969/14/03', '555/987/6543', 'jessegmail.com', '4848 Chestnut Street', 'Cheyenne', 'WY', '82001', 'USA', 'Aetna', 'AE-1052-U', '4/15/2024', '4/19/2024', 'Orthopedics', 'Dr. Smith', 'Knee Replacement', 'A+', 'Y', 'Yes', 'No', 'Rebecca Cook', '555/987/6544', 21000.00, 21000.00, 0.00, 2, 5, 'Full recovery'),
(61, 'P1053', 'Lauren', 'Morgan', 'Lauren Morgan', 'Female', '12/20/1994', '444/876/5432', 'lauren@gmail.com', '4949 Elm Avenue', 'Frankfort', 'KY', '40601', 'USA', 'United Health', 'UH-1053-V', '5/20/2024', '5/21/2024', 'Dermatology', 'Dr. Johnson', 'Rash', 'B-', 'Yes', 'Yes', 'No', 'Brandon Morgan', '444/876/5433', 350.00, 350.00, 0.00, 1, 3, 'Antihistamine'),
(62, 'P1054', 'Billy', 'Peterson', 'Billy Peterson', 'M', '1961/25/06', '333/765/4321', 'billy@gmail.com', '5050 Oak Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'BlueCross', 'BC-1054-W', '6/25/2024', '6/30/2024', 'Cardiology', 'Dr. Davis', 'Angina', 'AB+', 'Y', 'Y', 'Yes', 'Amber Peterson', '333/765/4322', 8900.00, 4450.00, 4450.00, 5, 4, 'Nitrates prescribed'),
(63, 'P1055', 'Melissa', 'Gray', 'Melissa Gray', 'Female', '4/30/1987', '222/654/3210', 'melissa@gmail.com', '5151 Pine Avenue', 'Lincoln', 'NE', '68501', 'USA', 'Cigna', 'CG-1055-X', '7/10/2024', '7/11/2024', 'Emergency', 'Dr. Wilson', 'Asthma Attack', 'O+', 'Yes', 'Yes', 'No', 'Eric Gray', '222/654/3211', 2800.00, 2800.00, 0.00, 1, 5, 'Nebulizer treatment'),
(64, 'P1056', 'Bruce', 'Ramirez', 'Bruce Ramirez', 'Male', '1956/10/09', '111/543/2109', 'bruce@gmail.com', '5252 Cedar Avenue', 'Carson City', 'NV', '89701', 'USA', 'Aetna', 'AE-1056-Y', '8/15/2024', '8/22/2024', 'Neurology', 'Dr. Brown', 'Stroke', 'A-', 'Y', 'Yes', 'Yes', 'Cheryl Ramirez', '111/543/2110', 32000.00, 32000.00, 0.00, 4, 5, 'Rehab started'),
(65, 'P1057', 'Andrea', 'James', 'Andrea James', 'F', '2/14/1983', '(888)432-1098', 'andrea@gmail.com', '5353 Birch Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'United Health', 'UH-1057-Z', '9/20/2024', '9/22/2024', 'Gynecology', 'Dr. Smith', 'Endometriosis', 'B+', 'Yes', 'Yes', 'No', 'Keith James', '(888)432-1099', 4300.00, 2150.00, 2150.00, 3, 4, 'Laparoscopy done'),
(66, 'P1058', 'Willie', 'Watson', 'Willie Watson', 'Male', '1976/18/11', '777/321/0987', 'willie@gmail.com', '5454 Walnut Avenue', 'Concord', 'NH', '03301', 'USA', 'BlueCross', 'BC-1058-A', '10/25/2024', '10/27/2024', 'Urology', 'Dr. Johnson', 'Prostate', 'O-', 'Y', 'Y', 'No', 'Gloria Watson', '777/321/0988', 2600.00, 2600.00, 0.00, 2, 4, 'Biopsy done'),
(67, 'P1059', 'Dorothy', 'Brooks', 'Dorothy Brooks', 'Female', '8/8/1952', '666/210/9876', 'dorothy@gmail.com', '5555 Spruce Avenue', 'Olympia', 'WA', '98501', 'USA', 'Cigna', 'CG-1059-B', '11/10/2024', '11/17/2024', 'Geriatrics', 'Dr. Davis', 'Alzheimer', 'A+', 'Yes', 'Yes', 'No', 'Kenneth Brooks', '666/210/9877', 9200.00, 9200.00, 0.00, 12, 5, 'Memory care program'),
-- Duplicate
(68, 'P1059', 'Dorothy', 'Brooks', 'Dorothy Brooks', 'Female', '8/8/1952', '666/210/9876', 'dorothy@gmail.com', '5555 Spruce Avenue', 'Olympia', 'WA', '98501', 'USA', 'Cigna', 'CG-1059-B', '11/10/2024', '11/17/2024', 'Geriatrics', 'Dr. Davis', 'Alzheimer', 'A+', 'Yes', 'Yes', 'No', 'Kenneth Brooks', '666/210/9877', 9200.00, 9200.00, 0.00, 12, 5, 'Memory care program'),
(69, 'P1060', 'Eric', 'Kelly', 'Eric Kelly', 'M', '1985/22/04', '555/109/8765', 'eric@gmail.com', '5656 Poplar Avenue', 'Salem', 'OR', '97301', 'USA', 'Aetna', 'AE-1060-C', '12/15/2024', '12/17/2024', 'Orthopedics', 'Dr. Wilson', 'Rotator Cuff', 'B-', 'Y', 'Yes', 'No', 'Janice Kelly', '555/109/8766', 7800.00, 7800.00, 0.00, 2, 4, 'Surgery scheduled'),
(70, 'P1061', 'Janet', 'Sanders', 'Janet Sanders', 'Female', '11/11/1970', '444/098/7654', 'janet@gmail.com', '5757 Hickory Avenue', 'Augusta', 'ME', '04330', 'USA', 'United Health', 'UH-1061-D', '1/25/2024', '1/28/2024', 'Rheumatology', 'Dr. Brown', 'Lupus', 'AB+', 'Yes', 'Yes', 'No', 'Dennis Sanders', '444/098/7655', 5100.00, 2550.00, 2550.00, 6, 4, 'Hydroxychloroquine'),
(71, 'P1062', 'Philip', 'Price', 'Philip Price', 'Male', '1952/08/07', '333/987/6543', 'philip@gmail.com', '5858 Magnolia Avenue', 'Harrisburg', 'PA', '17101', 'USA', 'BlueCross', 'BC-1062-E', '2/28/2024', '3/7/2024', 'Cardiology', 'Dr. Smith', 'Heart Attack', 'O+', 'Y', 'Y', 'Yes', 'Norma Price', '333/987/6544', 55000.00, 55000.00, 0.00, 5, 5, 'ICU stay'),
(72, 'P1063', 'Catherine', 'Bennett', 'Catherine Bennett', 'F', '5/19/1990', '222/876/5432', 'catherine@gmai.com', '5959 Chestnut Avenue', 'Trenton', 'NJ', '08601', 'USA', 'Cigna', 'CG-1063-F', '3/20/2024', '3/21/2024', 'Emergency', 'Dr. Johnson', 'Allergic Reaction', 'A-', 'Yes', 'Yes', 'No', 'Wayne Bennett', '222/876/5433', 1800.00, 1800.00, 0.00, 1, 5, 'EpiPen administered'),
(73, 'P1064', 'Harold', 'Wood', 'Harold Wood', 'Male', '1944/15/12', '111/765/4321', 'harold2@gmail.com', '6060 Elm Street', 'Annapolis', 'MD', '21401', 'USA', 'Aetna', 'AE-1064-G', '4/25/2024', '5/3/2024', 'Geriatrics', 'Dr. Davis', 'Heart Failure', 'B+', 'Yes', 'Yes', 'No', 'Louise Wood', '111/765/4322', 18500.00, 18500.00, 0.00, 15, 4, 'Pacemaker installed'),
(74, 'P1065', 'Samantha', 'Barnes', 'Samantha Barnes', 'Female', '9/9/1977', '(555)654-3210', 'samantha@gmail.com', '6161 Oak Street', 'Dover', 'DE', '19901', 'USA', 'United Health', 'UH-1065-H', '5/30/2024', '6/2/2024', 'Oncology', 'Dr. Wilson', 'Breast Cancer', 'O-', 'Y', 'Yes', 'No', 'Timothy Barnes', '(555)654-3211', 28000.00, 14000.00, 14000.00, 8, 5, 'Mastectomy done'),
(75, 'P1066', 'Gregory', 'Ross', 'Gregory Ross', 'M', '1968/28/02', '(444)543-2109', 'gregory@gmail.com', '6262 Pine Street', 'Providence', 'RI', '02901', 'USA', 'BlueCross', 'BC-1066-I', '6/15/2024', '6/18/2024', 'Pulmonology', 'Dr. Brown', 'Pneumonia', 'A+', 'Y', 'Y', 'Yes', 'Christina Ross', '(444)543-2110', 5600.00, 5600.00, 0.00, 3, 4, 'Antibiotics IV'),
(76, 'P1067', 'Frank', 'Henderson', 'Frank Henderson', 'Male', '3/3/1975', '(333)432-1098', 'frank@gmail.com', '6363 Cedar Street', 'Burlington', 'VT', '05401', 'USA', 'Cigna', 'CG-1067-J', '7/20/2024', '7/22/2024', 'Urology', 'Dr. Smith', 'Kidney Stones', 'B-', 'Yes', 'Yes', 'No', 'Rachel Henderson', '(333)432-1099', 3900.00, 3900.00, 0.00, 2, 4, 'Lithotripsy done'),
(77, 'P1068', 'Emma', 'Coleman', 'Emma Coleman', 'F', '1982/10/08', '(222)321-0987', 'emma@gmail.com', '6464 Birch Street', 'Montpelier', 'VT', '05601', 'USA', 'Aetna', 'AE-1068-K', '8/25/2024', '8/27/2024', 'Dermatology', 'Dr. Johnson', 'Melanoma', 'AB-', 'Y', 'Yes', 'No', 'Anthony Coleman', '(222)321-0988', 7200.00, 3600.00, 3600.00, 4, 4, 'Biopsy done'),
(78, 'P1069', 'Nicholas', 'Jenkins', 'Nicholas Jenkins', 'Male', '6/21/1989', '(111)210-9876', 'nicholas@yahoo.com', '6565 Walnut Street', 'Augusta', 'GA', '30901', 'USA', 'United Health', 'UH-1069-L', '9/10/2024', '9/10/2024', 'Emergency', 'Dr. Davis', 'Broken Leg', 'O+', 'Yes', 'Yes', 'No', 'Melissa Jenkins', '(111)210-9877', 6500.00, 6500.00, 0.00, 1, 5, 'Cast applied'),
(79, 'P1070', 'Stephanie', 'Perry', 'Stephanie Perry', 'Female', '1966/05/04', '(999)109-8765', 'stephanie@gmail.com', '6666 Spruce Street', 'Boise', 'ID', '83701', 'USA', 'BlueCross', 'BC-1070-M', '10/15/2024', '10/19/2024', 'Gynecology', 'Dr. Wilson', 'Ovarian Cyst', 'A-', 'Y', 'Y', 'No', 'Jerry Perry', '(999)109-8766', 5800.00, 5800.00, 0.00, 3, 4, 'Laparoscopy'),
(80, 'P1071', 'Patrick', 'Powell', 'Patrick Powell', 'Male', '12/12/1958', '(888)098-7654', 'patrick@gmail.com', '6767 Poplar Street', 'Helena', 'MT', '59601', 'USA', 'Cigna', 'CG-1071-N', '11/20/2024', '11/28/2024', 'Cardiology', 'Dr. Brown', 'Valve Replacement', 'B+', 'Yes', 'Yes', 'Yes', 'Deborah Powell', '(888)098-7655', 42000.00, 42000.00, 0.00, 6, 5, 'Open heart surgery'),
(81, 'P1072', 'Nicole', 'Long', 'Nicole Long', 'F', '1987/18/09', '(777)987-6543', 'nicole@gmail.com', '6868 Hickory Street', 'Bismarck', 'ND', '58501', 'USA', 'Aetna', 'AE-1072-O', '12/5/2024', '12/7/2024', 'Psychiatry', 'Dr. Smith', 'Bipolar', 'O-', 'Y', 'Yes', 'No', 'Stephen Long', '(777)987-6544', 2400.00, 1200.00, 1200.00, 5, 3, 'Mood stabilizers'),
(82, 'P1073', 'Benjamin', 'Patterson', 'Benjamin Patterson', 'Male', '4/4/1971', '(666)876-5432', 'benjamin@gmail.com', '6969 Magnolia Street', 'Pierre', 'SD', '57501', 'USA', 'United Health', 'UH-1073-P', '1/10/2024', '1/14/2024', 'Gastroenterology', 'Dr. Johnson', 'Ulcer', 'A+', 'Yes', 'Yes', 'Yes', 'Janet Patterson', '(666)876-5433', 3700.00, 3700.00, 0.00, 4, 4, 'Medication started'),
(83, 'P1074', 'Megan', 'Hughes', 'Megan Hughes', 'Female', '1994/22/06', '(555)765-4321', 'megan@gmail.com', '7070 Chestnut Street', 'Cheyenne', 'WY', '82001', 'USA', 'BlueCross', 'BC-1074-Q', '2/15/2024', '2/16/2024', 'Emergency', 'Dr. Davis', 'Fainting', 'B-', 'Y', 'Y', 'No', 'Ryan Hughes', '(555)765-4322', 1100.00, 1100.00, 0.00, 1, 4, 'Low blood sugar'),
-- Duplicate
(84, 'P1074', 'Megan', 'Hughes', 'Megan Hughes', 'Female', '1994/22/06', '(555)765-4321', 'megan@gmail.com', '7070 Chestnut Street', 'Cheyenne', 'WY', '82001', 'USA', 'BlueCross', 'BC-1074-Q', '2/15/2024', '2/16/2024', 'Emergency', 'Dr. Davis', 'Fainting', 'B-', 'Y', 'Y', 'No', 'Ryan Hughes', '(555)765-4322', 1100.00, 1100.00, 0.00, 1, 4, 'Low blood sugar'),
(85, 'P1075', 'Tyler', 'Flores', 'Tyler Flores', 'M', '8/8/1979', '(444)654-3210', 'tyler@gmail.com', '7171 Elm Avenue', 'Frankfort', 'KY', '40601', 'USA', 'Cigna', 'CG-1075-R', '3/20/2024', '3/23/2024', 'Neurology', 'Dr. Wilson', 'Multiple Sclerosis', 'AB+', 'Yes', 'Yes', 'No', 'Kayla Flores', '(444)654-3211', 8900.00, 8900.00, 0.00, 6, 4, 'MRI done'),
(86, 'P1076', 'Kayla', 'Washington', 'Kayla Washington', 'Female', '1960/12/02', '(333)543-2109', 'kayla@gmail.com', '7272 Oak Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'Aetna', 'AE-1076-S', '4/25/2024', '5/2/2024', 'Geriatrics', 'Dr. Brown', 'Hip Fracture', 'O+', 'Y', 'Yes', 'No', 'Victor Washington', '(333)543-2110', 16500.00, 16500.00, 0.00, 5, 5, 'Surgery done'),
(87, 'P1077', 'Gary', 'Butler', 'Gary Butler', 'Male', '7/16/1984', '(222)432-1098', 'gary@gmail.com', '7373 Pine Avenue', 'Lincoln', 'NE', '68501', 'USA', 'United Health', 'UH-1077-T', '5/30/2024', '5/31/2024', 'Emergency', 'Dr. Smith', 'Chest Pain', 'A-', 'Yes', 'Yes', 'Yes', 'Ashley Butler', '(222)432-1099', 4200.00, 4200.00, 0.00, 1, 5, 'EKG normal'),
(88, 'P1078', 'Alexandra', 'Simmons', 'Alexandra Simmons', 'F', '1973/05/10', '(111)321-0987', 'alexandra@gmail.com', '7474 Cedar Avenue', 'Carson City', 'NV', '89701', 'USA', 'BlueCross', 'BC-1078-U', '6/20/2024', '6/24/2024', 'Oncology', 'Dr. Johnson', 'Ovarian Cancer', 'B+', 'Y', 'Y', 'No', 'Robert Simmons', '(111)321-0988', 24000.00, 12000.00, 12000.00, 7, 4, 'Chemo started'),
(89, 'P1079', 'Aaron', 'Foster', 'Aaron Foster', 'Male', '5/5/1991', '(999)210-9876', 'aaron@gmail.com', '7575 Birch Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'Cigna', 'CG-1079-V', '7/15/2024', '7/16/2024', 'Emergency', 'Dr. Davis', 'Concussion', 'O-', 'Yes', 'Yes', 'No', 'Hannah Foster', '(999)210-9877', 2900.00, 2900.00, 0.00, 1, 5, 'CT normal'),
(90, 'P1080', 'Isabella', 'Gonzalez', 'Isabella Gonzalez', 'Female', '1978/28/08', '(888)109-8765', 'isabella@gmail.com', '7676 Walnut Avenue', 'Concord', 'NH', '03301', 'USA', 'Aetna', 'AE-1080-W', '8/20/2024', '8/22/2024', 'Endocrinology', 'Dr. Wilson', 'Hashimoto', 'A+', 'Y', 'Yes', 'No', 'Diego Gonzalez', '(888)109-8766', 1600.00, 1600.00, 0.00, 4, 4, 'Levothyroxine'),
(91, 'P1081', 'Ethan', 'Bryant', 'Ethan Bryant', 'M', '10/10/1965', '(777)098-7654', 'ethan@gmail.com', '7777 Spruce Avenue', 'Olympia', 'WA', '98501', 'USA', 'United Health', 'UH-1081-X', '9/25/2024', '9/30/2024', 'Cardiology', 'Dr. Brown', 'Coronary Disease', 'B-', 'Yes', 'Yes', 'Yes', 'Madison Bryant', '(777)098-7655', 14500.00, 14500.00, 0.00, 7, 5, 'Stent placed'),
(92, 'P1082', 'Alyssa', 'Alexander', 'Alyssa Alexander', 'Female', '1986/15/01', '(666)987-6543', 'alyssa@gmail.com', '7878 Poplar Avenue', 'Salem', 'OR', '97301', 'USA', 'BlueCross', 'BC-1082-Y', '10/10/2024', '10/11/2024', 'Dermatology', 'Dr. Smith', 'Acne', 'AB-', 'Y', 'Y', 'No', 'Nathan Alexander', '(666)987-6544', 450.00, 450.00, 0.00, 2, 3, 'Isotretinoin'),
(93, 'P1083', 'Dylan', 'Russell', 'Dylan Russell', 'Male', '3/28/1997', '(555)876-5432', 'dylan@gmail.com', '7979 Hickory Avenue', 'Augusta', 'ME', '04330', 'USA', 'Cigna', 'CG-1083-Z', '11/15/2024', '11/16/2024', 'Emergency', 'Dr. Johnson', 'Sports Injury', 'O+', 'Yes', 'Yes', 'No', 'Logan Russell', '(555)876-5433', 3100.00, 3100.00, 0.00, 1, 5, 'MRI done'),
(94, 'P1084', 'Brianna', 'Griffin', 'Brianna Griffin', 'F', '1975/20/11', '(444)765-4321', 'brianna@gmail.com', '8080 Magnolia Avenue', 'Harrisburg', 'PA', '17101', 'USA', 'Aetna', 'AE-1084-A', '12/20/2024', '12/24/2024', 'Gynecology', 'Dr. Davis', 'Menopause', 'A-', 'Y', 'Yes', 'No', 'Scott Griffin', '(444)765-4322', 2100.00, 1050.00, 1050.00, 5, 4, 'HRT started'),
(95, 'P1085', 'Seth', 'Diaz', 'Seth Diaz', 'Male', '6/6/1982', '(333)654-3210', 'seth@gmail.com', '8181 Chestnut Avenue', 'Trenton', 'NJ', '08601', 'USA', 'United Health', 'UH-1085-B', '1/30/2024', '2/2/2024', 'Gastroenterology', 'Dr. Wilson', 'Colitis', 'B+', 'Yes', 'Yes', 'No', 'Vanessa Diaz', '(333)654-3211', 4400.00, 4400.00, 0.00, 3, 4, 'Prednisone'),
(96, 'P1086', 'Alexis', 'Hayes', 'Alexis Hayes', 'Female', '1963/08/04', '(222)543-2109', 'alexis@gmail.com', '8282 Elm Street', 'Dover', 'DE', '19901', 'USA', 'BlueCross', 'BC-1086-C', '2/25/2024', '3/3/2024', 'Orthopedics', 'Dr. Brown', 'Knee Replacement', 'O-', 'Y', 'Y', 'No', 'Travis Hayes', '(222)543-2110', 19500.00, 19500.00, 0.00, 3, 5, 'PT started'),
(97, 'P1087', 'Zachary', 'Myers', 'Zachary Myers', 'Male', '9/14/1990', '(111)432-1098', 'zachary@gmail.com', '8383 Oak Street', 'Providence', 'RI', '02901', 'USA', 'Cigna', 'CG-1087-D', '3/30/2024', '3/31/2024', 'Emergency', 'Dr. Smith', 'Laceration', 'A+', 'Yes', 'Yes', 'No', 'Brittany Myers', '(111)432-1099', 1500.00, 1500.00, 0.00, 1, 4, 'Stitches done'),
(98, 'P1088', 'Chloe', 'Ford', 'Chloe Ford', 'F', '1980/25/07', '(999)321-0987', 'chloe@gmail.com', '8484 Pine Street', 'Burlington', 'VT', '05401', 'USA', 'Aetna', 'AE-1088-E', '4/15/2024', '4/18/2024', 'Psychiatry', 'Dr. Johnson', 'PTSD', 'B-', 'Y', 'Yes', 'No', 'Derek Ford', '(999)321-0988', 3200.00, 1600.00, 1600.00, 6, 4, 'EMDR therapy'),
(99, 'P1089', 'Hunter', 'Hamilton', 'Hunter Hamilton', 'Male', '2/2/1976', '(888)210-9876', 'hunter@gmail.com', '8585 Cedar Street', 'Montpelier', 'VT', '05601', 'USA', 'United Health', 'UH-1089-F', '5/20/2024', '5/23/2024', 'Pulmonology', 'Dr. Davis', 'Sleep Apnea', 'AB+', 'Yes', 'Yes', 'Yes', 'Tiffany Hamilton', '(888)210-9877', 2800.00, 2800.00, 0.00, 2, 4, 'CPAP prescribed'),
(100, 'P1090', 'Leah', 'Graham', 'Leah Graham', 'Female', '1971/12/09', '(777)109-8765', 'leah@gmail.com', '8686 Birch Street', 'Augusta', 'GA', '30901', 'USA', 'BlueCross', 'BC-1090-G', '6/25/2024', '6/28/2024', 'Rheumatology', 'Dr. Wilson', 'Fibromyalgia', 'O+', 'Y', 'Y', 'No', 'Spencer Graham', '(777)109-8766', 3600.00, 1800.00, 1800.00, 7, 3, 'Pain management'),
(101, 'P1091', 'Christian', 'Sullivan', 'Christian Sullivan', 'M', '7/7/1988', '(666)098-7654', 'christian@gmail.com', '8787 Walnut Street', 'Boise', 'ID', '83701', 'USA', 'Cigna', 'CG-1091-H', '7/10/2024', '7/12/2024', 'Neurology', 'Dr. Brown', 'Migraine', 'A-', 'Yes', 'Yes', 'No', 'Autumn Sullivan', '(666)098-7655', 1900.00, 1900.00, 0.00, 4, 4, 'Sumatriptan'),
(102, 'P1092', 'Hannah', 'Wallace', 'Hannah Wallace', 'Female', '1983/18/03', '(555)987-6543', 'hannah@gmail.com', '8888 Spruce Street', 'Helena', 'MT', '59601', 'USA', 'Aetna', 'AE-1092-I', '8/15/2024', '8/17/2024', 'Dermatology', 'Dr. Smith', 'Hives', 'B+', 'Y', 'Yes', 'No', 'Cody Wallace', '(555)987-6544', 600.00, 600.00, 0.00, 2, 3, 'Antihistamine'),
(103, 'P1093', 'Nathan', 'Cole', 'Nathan Cole', 'Male', '5/5/1967', '(444)876-5432', 'nathan@gmail.com', '8989 Poplar Street', 'Bismarck', 'ND', '58501', 'USA', 'United Health', 'UH-1093-J', '9/20/2024', '9/26/2024', 'Cardiology', 'Dr. Johnson', 'Heart Failure', 'O-', 'Yes', 'Yes', 'Yes', 'Sierra Cole', '(444)876-5433', 22000.00, 22000.00, 0.00, 9, 5, 'ICU care'),
(104, 'P1094', 'Savannah', 'West', 'Savannah West', 'F', '1992/28/12', '(333)765-4321', 'savannah@gmail.com', '9090 Hickory Street', 'Pierre', 'SD', '57501', 'USA', 'BlueCross', 'BC-1094-K', '10/25/2024', '10/26/2024', 'Emergency', 'Dr. Davis', 'Broken Wrist', 'A+', 'Y', 'Y', 'No', 'Tristan West', '(333)765-4322', 3800.00, 3800.00, 0.00, 1, 5, 'Cast applied'),
(105, 'P1095', 'Juan', 'Jordan', 'Juan Jordan', 'Male', '8/18/1973', '(222)654-3210', 'juan@gmail.com', '9191 Magnolia Street', 'Cheyenne', 'WY', '82001', 'USA', 'Cigna', 'CG-1095-L', '11/10/2024', '11/13/2024', 'Urology', 'Dr. Wilson', 'Bladder Infection', 'B-', 'Yes', 'Yes', 'No', 'Maria Jordan', '(222)654-3211', 1700.00, 1700.00, 0.00, 3, 4, 'Antibiotics'),
(106, 'P1096', 'Audrey', 'Owen', 'Audrey Owen', 'Female', '1959/05/06', '(111)543-2109', 'audrey@gmail.com', '9292 Chestnut Street', 'Frankfort', 'KY', '40601', 'USA', 'Aetna', 'AE-1096-M', '12/15/2024', '12/22/2024', 'Geriatrics', 'Dr. Brown', 'Parkinson', 'AB+', 'Y', 'Yes', 'No', 'Gerald Owen', '(111)543-2110', 11000.00, 11000.00, 0.00, 10, 4, 'DBS therapy'),
(107, 'P1097', 'Elijah', 'Reynolds', 'Elijah Reynolds', 'Male', '11/22/1995', '(999)432-1098', 'elijah@gmail.com', '9393 Elm Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'United Health', 'UH-1097-N', '1/15/2024', '1/16/2024', 'Emergency', 'Dr. Smith', 'Asthma', 'O+', 'Yes', 'Yes', 'No', 'Natalie Reynolds', '(999)432-1099', 2200.00, 2200.00, 0.00, 1, 5, 'Nebulizer'),
(108, 'P1098', 'Gabriella', 'Fisher', 'Gabriella Fisher', 'F', '1977/15/08', '(888)321-0987', 'gabriella@gmail.com', '9494 Oak Avenue', 'Lincoln', 'NE', '68501', 'USA', 'BlueCross', 'BC-1098-O', '2/20/2024', '2/23/2024', 'Gynecology', 'Dr. Johnson', 'Cervical Cancer', 'A-', 'Y', 'Y', 'No', 'Marcus Fisher', '(888)321-0988', 16000.00, 8000.00, 8000.00, 4, 5, 'Radiation'),
(109, 'P1099', 'Isaac', 'Dean', 'Isaac Dean', 'Male', '4/14/1984', '(777)210-9876', 'isaac@gmail.com', '9595 Pine Avenue', 'Carson City', 'NV', '89701', 'USA', 'Cigna', 'CG-1099-P', '3/25/2024', '3/27/2024', 'Orthopedics', 'Dr. Davis', 'Back Surgery', 'B+', 'Yes', 'Yes', 'No', 'Aaliyah Dean', '(777)210-9877', 25000.00, 25000.00, 0.00, 2, 5, 'L4-L5 fusion'),
(110, 'P1100', 'Jasmine', 'Morrison', 'Jasmine Morrison', 'Female', '1969/22/11', '(666)109-8765', 'jasmine@gmail.com', '9696 Cedar Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'Aetna', 'AE-1100-Q', '4/30/2024', '5/4/2024', 'Oncology', 'Dr. Wilson', 'Lymphoma', 'O-', 'Y', 'Yes', 'No', 'Xavier Morrison', '(666)109-8766', 31000.00, 15500.00, 15500.00, 6, 4, 'CHOP therapy'),
(111, 'P1101', 'Lucas', 'Harvey', 'Lucas Harvey', 'M', '6/6/1991', '(555)098-7654', 'lucas@gmail.com', '9797 Birch Avenue', 'Concord', 'NH', '03301', 'USA', 'United Health', 'UH-1101-R', '5/15/2024', '5/16/2024', 'Emergency', 'Dr. Brown', 'Anaphylaxis', 'A+', 'Yes', 'Yes', 'No', 'Isabel Harvey', '(555)098-7655', 4800.00, 4800.00, 0.00, 1, 5, 'EpiPen'),
(112, 'P1102', 'Sophia', 'Henry', 'Sophia Henry', 'Female', '1974/08/04', '(444)987-6543', 'sophia@gmail.com', '9898 Walnut Avenue', 'Olympia', 'WA', '98501', 'USA', 'BlueCross', 'BC-1102-S', '6/20/2024', '6/23/2024', 'Psychiatry', 'Dr. Smith', 'Schizophrenia', 'B-', 'Y', 'Y', 'No', 'Maxwell Henry', '(444)987-6544', 5500.00, 2750.00, 2750.00, 8, 3, 'Antipsychotics'),
(113, 'P1103', 'Mason', 'Freeman', 'Mason Freeman', 'Male', '2/28/1986', '(333)876-5432', 'mason@gmail.com', '9999 Spruce Avenue', 'Salem', 'OR', '97301', 'USA', 'Cigna', 'CG-1103-T', '7/25/2024', '7/27/2024', 'Gastroenterology', 'Dr. Johnson', 'GERD', 'AB+', 'Yes', 'Yes', 'No', 'Olivia Freeman', '(333)876-5433', 1400.00, 1400.00, 0.00, 3, 4, 'PPI prescribed'),
(114, 'P1104', 'Ella', 'Webb', 'Ella Webb', 'F', '1993/18/07', '(222)765-4321', 'ella@gmail.com', '10100 Poplar Avenue', 'Augusta', 'ME', '04330', 'USA', 'Aetna', 'AE-1104-U', '8/10/2024', '8/11/2024', 'Emergency', 'Dr. Davis', 'Fainting', 'O+', 'Y', 'Yes', 'No', 'Connor Webb', '(222)765-4322', 1200.00, 1200.00, 0.00, 1, 4, 'Dehydration'),
(115, 'P1105', 'Logan', 'Tucker', 'Logan Tucker', 'Male', '9/9/1978', '(111)654-3210', 'logan@gmail.com', '10101 Hickory Avenue', 'Harrisburg', 'PA', '17101', 'USA', 'United Health', 'UH-1105-V', '9/15/2024', '9/19/2024', 'Cardiology', 'Dr. Wilson', 'Pericarditis', 'A-', 'Yes', 'Yes', 'No', 'Hailey Tucker', '(111)654-3211', 6800.00, 6800.00, 0.00, 2, 4, 'Anti-inflammatory'),
(116, 'P1106', 'Avery', 'Porter', 'Avery Porter', 'Female', '1964/25/02', '(999)543-2109', 'avery@gmail.com', '10202 Magnolia Avenue', 'Trenton', 'NJ', '08601', 'USA', 'BlueCross', 'BC-1106-W', '10/20/2024', '10/27/2024', 'Geriatrics', 'Dr. Brown', 'Dementia', 'B+', 'Y', 'Y', 'No', 'Blake Porter', '(999)543-2110', 13500.00, 13500.00, 0.00, 15, 4, 'Memory care'),
(117, 'P1107', 'Carter', 'Hunter', 'Carter Hunter', 'Male', '7/17/1990', '(888)432-1098', 'carter@gmail.com', '10303 Chestnut Avenue', 'Annapolis', 'MD', '21401', 'USA', 'Cigna', 'CG-1107-X', '11/5/2024', '11/6/2024', 'Emergency', 'Dr. Smith', 'Allergic Reaction', 'O-', 'Yes', 'Yes', 'No', 'Mackenzie Hunter', '(888)432-1099', 1800.00, 1800.00, 0.00, 1, 5, 'Steroids given'),
(118, 'P1108', 'Scarlett', 'Mills', 'Scarlett Mills', 'F', '1981/28/10', '(777)321-0987', 'scarlett@gmail.com', '10404 Elm Street', 'Dover', 'DE', '19901', 'USA', 'Aetna', 'AE-1108-Y', '12/10/2024', '12/14/2024', 'Oncology', 'Dr. Johnson', 'Breast Cancer', 'A+', 'Y', 'Yes', 'No', 'Hudson Mills', '(777)321-0988', 26000.00, 13000.00, 13000.00, 5, 5, 'Chemo'),
(119, 'P1109', 'Jackson', 'Boyd', 'Jackson Boyd', 'Male', '4/4/1975', '(666)210-9876', 'jackson@gmail.com', '10505 Oak Street', 'Providence', 'RI', '02901', 'USA', 'United Health', 'UH-1109-Z', '1/20/2024', '1/22/2024', 'Urology', 'Dr. Davis', 'Kidney Stones', 'B-', 'Yes', 'Yes', 'No', 'Paisley Boyd', '(666)210-9877', 3400.00, 3400.00, 0.00, 3, 4, 'Lithotripsy'),
(120, 'P1110', 'Lily', 'Arnold', 'Lily Arnold', 'Female', '1986/15/06', '(555)109-8765', 'lily@gmail.com', '10606 Pine Street', 'Burlington', 'VT', '05401', 'USA', 'BlueCross', 'BC-1110-A', '2/25/2024', '2/27/2024', 'Dermatology', 'Dr. Wilson', 'Vitiligo', 'AB-', 'Y', 'Y', 'No', 'Levi Arnold', '(555)109-8766', 900.00, 450.00, 450.00, 4, 3, 'Phototherapy'),
-- Same patient different ID (name+DOB+phone match)
(121, 'P3999', 'James', 'Wilson', 'James Wilson', 'Male', '3/15/1978', '555-123-4567', 'james_new@gmail.com', '123 Main Street', 'Dallas', 'TX', '75201', 'USA', 'BlueCross', 'BC-1001-X', '3/10/2024', '3/15/2024', 'Cardiology', 'Dr. Smith', 'Follow Up', 'A+', 'Yes', 'Yes', 'No', 'Mary Wilson', '555-987-6543', 2100.00, 2100.00, 0.00, 5, 5, 'Same patient new ID'),
(122, 'P1111', 'Owen', 'Stone', 'Owen Stone', 'M', '8/8/1969', '(444)098-7654', 'owen@gmail.com', '10707 Cedar Street', 'Montpelier', 'VT', '05601', 'USA', 'Cigna', 'CG-1111-B', '3/15/2024', '3/19/2024', 'Neurology', 'Dr. Brown', 'Parkinson', 'O+', 'Yes', 'Yes', 'No', 'Penelope Stone', '(444)098-7655', 7200.00, 7200.00, 0.00, 6, 4, 'DBS evaluation'),
(123, 'P1112', 'Layla', 'Nichols', 'Layla Nichols', 'Female', '1994/22/03', '(333)987-6543', 'layla@gmail.com', '10808 Birch Street', 'Augusta', 'GA', '30901', 'USA', 'Aetna', 'AE-1112-C', '4/20/2024', '4/21/2024', 'Emergency', 'Dr. Smith', 'Appendicitis', 'A-', 'Y', 'Y', 'No', 'Bentley Nichols', '(333)987-6544', 11500.00, 11500.00, 0.00, 1, 5, 'Emergency surgery'),
(124, 'P1113', 'Henry', 'Grant', 'Henry Grant', 'Male', '6/6/1961', '(222)876-5432', 'henry@gmail.com', '10909 Walnut Street', 'Boise', 'ID', '83701', 'USA', 'United Health', 'UH-1113-D', '5/25/2024', '6/2/2024', 'Cardiology', 'Dr. Johnson', 'Bypass Surgery', 'B+', 'Yes', 'Yes', 'Yes', 'Everly Grant', '(222)876-5433', 48000.00, 48000.00, 0.00, 4, 5, 'Triple bypass'),
(125, 'P1114', 'Aurora', 'Day', 'Aurora Day', 'Female', '1976/18/09', '(111)765-4321', 'aurora@gmail.com', '11010 Spruce Street', 'Helena', 'MT', '59601', 'USA', 'BlueCross', 'BC-1114-E', '6/30/2024', '7/3/2024', 'Gynecology', 'Dr. Davis', 'Ovarian Cyst', 'O-', 'Y', 'Yes', 'No', 'Ryker Day', '(111)765-4322', 5900.00, 5900.00, 0.00, 3, 4, 'Laparoscopy'),
(126, 'P1115', 'Eli', 'Burns', 'Eli Burns', 'Male', '2/2/1989', '(999)654-3210', 'eli@gmail.com', '11111 Poplar Street', 'Bismarck', 'ND', '58501', 'USA', 'Cigna', 'CG-1115-F', '7/15/2024', '7/16/2024', 'Emergency', 'Dr. Wilson', 'Broken Nose', 'A+', 'Yes', 'Yes', 'No', 'Freya Burns', '(999)654-3211', 2400.00, 2400.00, 0.00, 1, 4, 'Reset done'),
(127, 'P1116', 'Violet', 'Olson', 'Violet Olson', 'F', '1964/12/06', '(888)543-2109', 'violet@gmail.com', '11212 Hickory Street', 'Pierre', 'SD', '57501', 'USA', 'Aetna', 'AE-1116-G', '8/20/2024', '8/27/2024', 'Geriatrics', 'Dr. Brown', 'Stroke', 'B-', 'Y', 'Y', 'No', 'Declan Olson', '(888)543-2110', 28500.00, 28500.00, 0.00, 8, 5, 'Rehab program'),
(128, 'P1117', 'Sebastian', 'Webb', 'Sebastian Webb', 'Male', '10/10/1992', '(777)432-1098', 'sebastian@gmail.com', '11313 Magnolia Street', 'Cheyenne', 'WY', '82001', 'USA', 'United Health', 'UH-1117-H', '9/10/2024', '9/11/2024', 'Emergency', 'Dr. Smith', 'Laceration', 'AB+', 'Yes', 'Yes', 'No', 'Isla Webb', '(777)432-1099', 1700.00, 1700.00, 0.00, 1, 4, 'Stitches'),
(129, 'P1118', 'Penelope', 'Ford', 'Penelope Ford', 'Female', '1979/25/01', '(666)321-0987', 'penelope@gmail.com', '11414 Chestnut Street', 'Frankfort', 'KY', '40601', 'USA', 'BlueCross', 'BC-1118-I', '10/15/2024', '10/18/2024', 'Rheumatology', 'Dr. Johnson', 'Rheumatoid Arthritis', 'O+', 'Y', 'Yes', 'No', 'Theo Ford', '(666)321-0988', 4700.00, 2350.00, 2350.00, 7, 4, 'Methotrexate'),
(130, 'P1119', 'Camden', 'Lynch', 'Camden Lynch', 'Male', '7/7/1971', '(555)210-9876', 'camden@gmail.com', '11515 Elm Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'Cigna', 'CG-1119-J', '11/20/2024', '11/24/2024', 'Pulmonology', 'Dr. Davis', 'Bronchitis', 'A-', 'Yes', 'Yes', 'Yes', 'Hadley Lynch', '(555)210-9877', 2600.00, 2600.00, 0.00, 3, 3, 'Antibiotics'),
-- Duplicate
(131, 'P1115', 'Eli', 'Burns', 'Eli Burns', 'Male', '2/2/1989', '(999)654-3210', 'eli@gmail.com', '11111 Poplar Street', 'Bismarck', 'ND', '58501', 'USA', 'Cigna', 'CG-1115-F', '7/15/2024', '7/16/2024', 'Emergency', 'Dr. Wilson', 'Broken Nose', 'A+', 'Yes', 'Yes', 'No', 'Freya Burns', '(999)654-3211', 2400.00, 2400.00, 0.00, 1, 4, 'Reset done'),
(132, 'P1120', 'Stella', 'Manning', 'Stella Manning', 'F', '1988/08/11', '(444)109-8765', 'stella@gmail.com', '11616 Oak Avenue', 'Lincoln', 'NE', '68501', 'USA', 'Aetna', 'AE-1120-K', '12/5/2024', '12/7/2024', 'Dermatology', 'Dr. Wilson', 'Psoriasis', 'B+', 'Y', 'Y', 'No', 'Jaxon Manning', '(444)109-8766', 1100.00, 550.00, 550.00, 5, 3, 'Biologics'),
(133, 'P1121', 'Colton', 'Palmer', 'Colton Palmer', 'Male', '4/14/1965', '(333)098-7654', 'colton@gmail.com', '11717 Pine Avenue', 'Carson City', 'NV', '89701', 'USA', 'United Health', 'UH-1121-L', '1/10/2024', '1/16/2024', 'Cardiology', 'Dr. Brown', 'Atrial Fibrillation', 'O-', 'Yes', 'Yes', 'Yes', 'Adeline Palmer', '(333)098-7655', 12500.00, 12500.00, 0.00, 6, 5, 'Cardioversion'),
(134, 'P1122', 'Addison', 'Warren', 'Addison Warren', 'Female', '1997/28/07', '(222)987-6543', 'addison@gmail.com', '11818 Cedar Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'BlueCross', 'BC-1122-M', '2/15/2024', '2/16/2024', 'Emergency', 'Dr. Smith', 'Sports Injury', 'A+', 'Y', 'Y', 'No', 'Easton Warren', '(222)987-6544', 2900.00, 2900.00, 0.00, 1, 5, 'MRI done'),
(135, 'P1123', 'Nolan', 'Dixon', 'Nolan Dixon', 'Male', '9/9/1973', '(111)876-5432', 'nolan@gmail.com', '11919 Birch Avenue', 'Concord', 'NH', '03301', 'USA', 'Cigna', 'CG-1123-N', '3/20/2024', '3/23/2024', 'Gastroenterology', 'Dr. Johnson', 'Hepatitis', 'B-', 'Yes', 'Yes', 'No', 'Evelyn Dixon', '(111)876-5433', 5200.00, 5200.00, 0.00, 4, 4, 'Antivirals'),
(136, 'P1124', 'Paisley', 'Day', 'Paisley Day', 'Female', '1962/15/04', '(999)765-4321', 'paisley@gmail.com', '12020 Walnut Avenue', 'Olympia', 'WA', '98501', 'USA', 'Aetna', 'AE-1124-O', '4/25/2024', '5/1/2024', 'Geriatrics', 'Dr. Davis', 'Hip Fracture', 'AB+', 'Y', 'Yes', 'No', 'Weston Day', '(999)765-4322', 17500.00, 17500.00, 0.00, 6, 5, 'Surgery done'),
(137, 'P1125', 'Brayden', 'Watts', 'Brayden Watts', 'Male', '6/6/1996', '(888)654-3210', 'brayden@gmail.com', '12121 Spruce Avenue', 'Salem', 'OR', '97301', 'USA', 'United Health', 'UH-1125-P', '5/30/2024', '5/31/2024', 'Emergency', 'Dr. Wilson', 'Broken Arm', 'O+', 'Yes', 'Yes', 'No', 'Lydia Watts', '(888)654-3211', 4100.00, 4100.00, 0.00, 1, 4, 'Cast applied'),
(138, 'P1126', 'Piper', 'Mendez', 'Piper Mendez', 'F', '1983/22/08', '(777)543-2109', 'piper@gmail.com', '12222 Poplar Avenue', 'Augusta', 'ME', '04330', 'USA', 'BlueCross', 'BC-1126-Q', '6/15/2024', '6/18/2024', 'Gynecology', 'Dr. Brown', 'Fibroids', 'A-', 'Y', 'Y', 'No', 'Silas Mendez', '(777)543-2110', 6800.00, 3400.00, 3400.00, 3, 4, 'Myomectomy'),
(139, 'P1127', 'Greyson', 'Lawson', 'Greyson Lawson', 'Male', '2/2/1978', '(666)432-1098', 'greyson@gmail.com', '12323 Hickory Avenue', 'Harrisburg', 'PA', '17101', 'USA', 'Cigna', 'CG-1127-R', '7/20/2024', '7/22/2024', 'Orthopedics', 'Dr. Smith', 'Shoulder Injury', 'B+', 'Yes', 'Yes', 'No', 'Willow Lawson', '(666)432-1099', 4500.00, 4500.00, 0.00, 2, 4, 'PT recommended'),
(140, 'P1128', 'Naomi', 'Jacobs', 'Naomi Jacobs', 'Female', '1990/12/05', '(555)321-0987', 'naomi@gmail.com', '12424 Magnolia Avenue', 'Trenton', 'NJ', '08601', 'USA', 'Aetna', 'AE-1128-S', '8/25/2024', '8/27/2024', 'Psychiatry', 'Dr. Johnson', 'OCD', 'O-', 'Y', 'Yes', 'No', 'Ezra Jacobs', '(555)321-0988', 2800.00, 1400.00, 1400.00, 6, 4, 'ERP therapy'),
(141, 'P1129', 'Ryder', 'Grant', 'Ryder Grant', 'Male', '8/8/1985', '(444)210-9876', 'ryder@gmail.com', '12525 Chestnut Avenue', 'Dover', 'DE', '19901', 'USA', 'United Health', 'UH-1129-T', '9/10/2024', '9/13/2024', 'Pulmonology', 'Dr. Davis', 'Pneumonia', 'A+', 'Yes', 'Yes', 'No', 'Emilia Grant', '(444)210-9877', 5100.00, 5100.00, 0.00, 2, 4, 'IV antibiotics'),
-- Duplicate
(142, 'P1129', 'Ryder', 'Grant', 'Ryder Grant', 'Male', '8/8/1985', '(444)210-9876', 'ryder@gmail.com', '12525 Chestnut Avenue', 'Dover', 'DE', '19901', 'USA', 'United Health', 'UH-1129-T', '9/10/2024', '9/13/2024', 'Pulmonology', 'Dr. Davis', 'Pneumonia', 'A+', 'Yes', 'Yes', 'No', 'Emilia Grant', '(444)210-9877', 5100.00, 5100.00, 0.00, 2, 4, 'IV antibiotics'),
(143, 'P1130', 'Peyton', 'Sherman', 'Peyton Sherman', 'F', '1972/25/09', '(333)109-8765', 'peyton@gmail.com', '12626 Elm Street', 'Burlington', 'VT', '05401', 'USA', 'BlueCross', 'BC-1130-U', '10/15/2024', '10/19/2024', 'Cardiology', 'Dr. Wilson', 'Hypertension', 'B-', 'Y', 'Y', 'No', 'Atlas Sherman', '(333)109-8766', 3200.00, 3200.00, 0.00, 5, 4, 'Lisinopril'),
(144, 'P1131', 'Knox', 'Dunn', 'Knox Dunn', 'Male', '5/5/1967', '(222)098-7654', 'knox@gmail.com', '12727 Oak Street', 'Montpelier', 'VT', '05601', 'USA', 'Cigna', 'CG-1131-V', '11/20/2024', '11/27/2024', 'Geriatrics', 'Dr. Brown', 'Alzheimer', 'AB+', 'Yes', 'Yes', 'No', 'Journey Dunn', '(222)098-7655', 10500.00, 10500.00, 0.00, 12, 4, 'Memory care'),
(145, 'P1132', 'Kinsley', 'Fowler', 'Kinsley Fowler', 'Female', '1989/08/02', '(111)987-6543', 'kinsley@gmail.com', '12828 Pine Street', 'Augusta', 'GA', '30901', 'USA', 'Aetna', 'AE-1132-W', '12/5/2024', '12/6/2024', 'Emergency', 'Dr. Smith', 'Appendicitis', 'O+', 'Y', 'Y', 'No', 'Zayden Fowler', '(111)987-6544', 12000.00, 12000.00, 0.00, 1, 5, 'Laparoscopic surgery'),
(146, 'P1133', 'Rowan', 'Brewer', 'Rowan Brewer', 'Male', '7/7/1980', '(999)876-5432', 'rowan@gmail.com', '12929 Cedar Street', 'Boise', 'ID', '83701', 'USA', 'United Health', 'UH-1133-X', '1/15/2024', '1/18/2024', 'Neurology', 'Dr. Johnson', 'Epilepsy', 'A-', 'Yes', 'Yes', 'No', 'Reign Brewer', '(999)876-5433', 4300.00, 4300.00, 0.00, 4, 4, 'Medication adjusted'),
(147, 'P1134', 'Quinn', 'Hoffman', 'Quinn Hoffman', 'F', '1975/20/11', '(888)765-4321', 'quinn@gmail.com', '13030 Birch Street', 'Helena', 'MT', '59601', 'USA', 'BlueCross', 'BC-1134-Y', '2/20/2024', '2/23/2024', 'Oncology', 'Dr. Davis', 'Cervical Cancer', 'B+', 'Y', 'Yes', 'No', 'Royal Hoffman', '(888)765-4322', 19000.00, 9500.00, 9500.00, 5, 4, 'Brachytherapy'),
(148, 'P1135', 'Maverick', 'Cole', 'Maverick Cole', 'Male', '3/3/1993', '(777)654-3210', 'maverick@gmail.com', '13131 Walnut Street', 'Bismarck', 'ND', '58501', 'USA', 'Cigna', 'CG-1135-Z', '3/25/2024', '3/26/2024', 'Emergency', 'Dr. Wilson', 'Concussion', 'O-', 'Yes', 'Yes', 'No', 'Ember Cole', '(777)654-3211', 2700.00, 2700.00, 0.00, 1, 5, 'CT normal'),
(149, 'P1136', 'Raelynn', 'Berry', 'Raelynn Berry', 'Female', '1961/15/07', '(666)543-2109', 'raelynn@gmail.com', '13232 Spruce Street', 'Pierre', 'SD', '57501', 'USA', 'Aetna', 'AE-1136-A', '4/30/2024', '5/7/2024', 'Geriatrics', 'Dr. Brown', 'Hip Replacement', 'A+', 'Y', 'Y', 'No', 'Crew Berry', '(666)543-2110', 18500.00, 18500.00, 0.00, 4, 5, 'PT started'),
(150, 'P1137', 'Beckham', 'Patterson', 'Beckham Patterson', 'Male', '6/6/1987', '(555)432-1098', 'beckham@gmail.com', '13333 Poplar Street', 'Cheyenne', 'WY', '82001', 'USA', 'United Health', 'UH-1137-B', '5/15/2024', '5/17/2024', 'Gastroenterology', 'Dr. Smith', 'Crohns Disease', 'B-', 'Yes', 'Yes', 'No', 'Harlow Patterson', '(555)432-1099', 3900.00, 3900.00, 0.00, 5, 4, 'Biologics'),
(151, 'P1138', 'Oakley', 'Simmons', 'Oakley Simmons', 'F', '1984/22/03', '(444)321-0987', 'oakley@gmail.com', '13434 Hickory Street', 'Frankfort', 'KY', '40601', 'USA', 'BlueCross', 'BC-1138-C', '6/20/2024', '6/22/2024', 'Dermatology', 'Dr. Johnson', 'Eczema', 'AB-', 'Y', 'Yes', 'No', 'Remi Simmons', '(444)321-0988', 700.00, 700.00, 0.00, 3, 3, 'Steroid cream'),
(152, 'P1139', 'Emerson', 'Craig', 'Emerson Craig', 'Male', '2/2/1970', '(333)210-9876', 'emerson@gmail.com', '13535 Magnolia Street', 'Jefferson City', 'MO', '65101', 'USA', 'Cigna', 'CG-1139-D', '7/25/2024', '7/30/2024', 'Cardiology', 'Dr. Davis', 'Coronary Disease', 'O+', 'Yes', 'Yes', 'Yes', 'Lennon Craig', '(333)210-9877', 16000.00, 16000.00, 0.00, 7, 5, 'Angioplasty'),
(153, 'P1140', 'River', 'Owen', 'River Owen', 'F', '1991/18/09', '(222)109-8765', 'river@gmail.com', '13636 Chestnut Street', 'Lincoln', 'NE', '68501', 'USA', 'Aetna', 'AE-1140-E', '8/10/2024', '8/11/2024', 'Emergency', 'Dr. Wilson', 'Panic Attack', 'A-', 'Y', 'Y', 'No', 'Phoenix Owen', '(222)109-8766', 1500.00, 1500.00, 0.00, 1, 4, 'Anxiolytics'),
(154, 'P1141', 'Wren', 'Mills', 'Wren Mills', 'Female', '8/8/1966', '(111)098-7654', 'wren@gmail.com', '13737 Elm Avenue', 'Carson City', 'NV', '89701', 'USA', 'United Health', 'UH-1141-F', '9/15/2024', '9/22/2024', 'Geriatrics', 'Dr. Brown', 'Osteoarthritis', 'B+', 'Yes', 'Yes', 'No', 'Sage Mills', '(111)098-7655', 8200.00, 8200.00, 0.00, 10, 4, 'Joint replacement eval'),
(155, 'P1142', 'Phoenix', 'Boyd', 'Phoenix Boyd', 'Male', '1979/05/12', '(999)987-6543', 'phoenix@gmail.com', '13838 Oak Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'BlueCross', 'BC-1142-G', '10/20/2024', '10/23/2024', 'Pulmonology', 'Dr. Smith', 'Asthma', 'O-', 'Y', 'Yes', 'No', 'Storm Boyd', '(999)987-6544', 2100.00, 2100.00, 0.00, 3, 4, 'Inhaler adjusted'),
(156, 'P1143', 'Sage', 'Hudson', 'Sage Hudson', 'F', '5/15/1988', '(888)876-5432', 'sage@gmail.com', '13939 Pine Avenue', 'Concord', 'NH', '03301', 'USA', 'Cigna', 'CG-1143-H', '11/5/2024', '11/7/2024', 'Psychiatry', 'Dr. Johnson', 'Anxiety', 'A+', 'Yes', 'Yes', 'No', 'River Hudson', '(888)876-5433', 1800.00, 900.00, 900.00, 4, 4, 'CBT continuing'),
(157, 'P1144', 'Crew', 'Murray', 'Crew Murray', 'Male', '1963/28/02', '(777)765-4321', 'crew@gmail.com', '14040 Cedar Avenue', 'Olympia', 'WA', '98501', 'USA', 'Aetna', 'AE-1144-I', '12/10/2024', '12/15/2024', 'Cardiology', 'Dr. Davis', 'Heart Failure', 'B-', 'Y', 'Y', 'Yes', 'Lake Murray', '(777)765-4322', 25000.00, 25000.00, 0.00, 8, 5, 'ICD placed'),
(158, 'P1145', 'Journey', 'Ford', 'Journey Ford', 'Female', '7/7/1977', '(666)654-3210', 'journey@gmail.com', '14141 Birch Avenue', 'Salem', 'OR', '97301', 'USA', 'United Health', 'UH-1145-J', '1/20/2024', '1/23/2024', 'Rheumatology', 'Dr. Wilson', 'Lupus', 'AB+', 'Yes', 'Yes', 'No', 'Sky Ford', '(666)654-3211', 4900.00, 2450.00, 2450.00, 6, 4, 'Plaquenil'),
(159, 'P1146', 'Reign', 'Webb', 'Reign Webb', 'Male', '1984/15/06', '(555)543-2109', 'reign@gmail.com', '14242 Walnut Avenue', 'Augusta', 'ME', '04330', 'USA', 'BlueCross', 'BC-1146-K', '2/25/2024', '2/27/2024', 'Orthopedics', 'Dr. Brown', 'ACL Repair', 'O+', 'Y', 'Y', 'No', 'Blaze Webb', '(555)543-2110', 14500.00, 14500.00, 0.00, 2, 5, 'PT started'),
(160, 'P1147', 'Ember', 'Hudson', 'Ember Hudson', 'Female', '4/4/1991', '(444)432-1098', 'ember@gmail.com', '14343 Spruce Avenue', 'Harrisburg', 'PA', '17101', 'USA', 'Cigna', 'CG-1147-L', '3/30/2024', '3/31/2024', 'Emergency', 'Dr. Smith', 'Allergic Reaction', 'A-', 'Yes', 'Yes', 'No', 'Stone Hudson', '(444)432-1099', 1900.00, 1900.00, 0.00, 1, 5, 'Steroids given'),
-- Same patient different ID (name+DOB+phone match)
(161, 'P4999', 'Barbara', 'Jackson', 'Barbara Jackson', 'Female', '1980/10/07', '', '', '505 Walnut Way', 'Miami', 'FL', '33101', 'USA', 'Cigna', 'CG-8008-E', '6/20/2024', '6/25/2024', 'Gynecology', 'Dr. Davis', 'Follow Up', 'A+', 'Yes', 'Yes', 'No', '', '', 1800.00, 1800.00, 0.00, 3, 4, 'Same patient new ID'),
(162, 'P1148', 'Atlas', 'Pena', 'Atlas Pena', 'Male', '8/8/1969', '(333)321-0987', 'atlas@gmail.com', '14444 Poplar Avenue', 'Trenton', 'NJ', '08601', 'USA', 'Aetna', 'AE-1148-M', '4/15/2024', '4/20/2024', 'Neurology', 'Dr. Johnson', 'Multiple Sclerosis', 'B+', 'Yes', 'Yes', 'No', 'Clover Pena', '(333)321-0988', 9500.00, 9500.00, 0.00, 6, 4, 'MRI done'),
(163, 'P1149', 'Lyric', 'Spencer', 'Lyric Spencer', 'F', '1994/22/10', '(222)210-9876', 'lyric@gmail.com', '14545 Hickory Avenue', 'Annapolis', 'MD', '21401', 'USA', 'United Health', 'UH-1149-N', '5/20/2024', '5/21/2024', 'Emergency', 'Dr. Davis', 'Broken Finger', 'O-', 'Y', 'Y', 'No', 'Harbor Spencer', '(222)210-9877', 1600.00, 1600.00, 0.00, 1, 4, 'Splint applied'),
(164, 'P1150', 'Zion', 'Hawkins', 'Zion Hawkins', 'Male', '6/6/1981', '(111)109-8765', 'zion@gmail.com', '14646 Magnolia Street', 'Dover', 'DE', '19901', 'USA', 'BlueCross', 'BC-1150-O', '6/25/2024', '6/28/2024', 'Urology', 'Dr. Wilson', 'Kidney Stones', 'A+', 'Yes', 'Yes', 'No', 'Bay Hawkins', '(111)109-8766', 3600.00, 3600.00, 0.00, 3, 4, 'Lithotripsy'),
(165, 'P1151', 'Harlow', 'Craig', 'Harlow Craig', 'Female', '1976/18/02', '(999)098-7654', 'harlow@gmail.com', '14747 Chestnut Street', 'Providence', 'RI', '02901', 'USA', 'Cigna', 'CG-1151-P', '7/10/2024', '7/14/2024', 'Oncology', 'Dr. Brown', 'Melanoma', 'B-', 'Y', 'Yes', 'No', 'Cove Craig', '(999)098-7655', 11000.00, 5500.00, 5500.00, 4, 4, 'Immunotherapy'),
(166, 'P1152', 'Blaze', 'Crawford', 'Blaze Crawford', 'Male', '2/2/1989', '(888)987-6543', 'blaze@gmail.com', '14848 Elm Street', 'Burlington', 'VT', '05401', 'USA', 'Aetna', 'AE-1152-Q', '8/15/2024', '8/16/2024', 'Emergency', 'Dr. Smith', 'Broken Rib', 'AB+', 'Yes', 'Yes', 'No', 'Onyx Crawford', '(888)987-6544', 4200.00, 4200.00, 0.00, 1, 4, 'Pain management'),
(167, 'P1153', 'Sable', 'Hawkins', 'Sable Hawkins', 'F', '1983/12/07', '(777)876-5432', 'sable@gmail.com', '14949 Oak Avenue', 'Montpelier', 'VT', '05601', 'USA', 'United Health', 'UH-1153-R', '9/20/2024', '9/23/2024', 'Gynecology', 'Dr. Johnson', 'PCOS', 'O+', 'Y', 'Y', 'No', 'Orion Hawkins', '(777)876-5433', 2300.00, 2300.00, 0.00, 3, 4, 'Metformin'),
(168, 'P1154', 'Sterling', 'Warren', 'Sterling Warren', 'Male', '9/9/1960', '(666)765-4321', 'sterling@gmail.com', '15050 Pine Avenue', 'Augusta', 'GA', '30901', 'USA', 'BlueCross', 'BC-1154-S', '10/25/2024', '11/2/2024', 'Cardiology', 'Dr. Davis', 'Bypass Surgery', 'A-', 'Yes', 'Yes', 'Yes', 'Luna Warren', '(666)765-4322', 51000.00, 51000.00, 0.00, 5, 5, 'Quadruple bypass'),
(169, 'P1155', 'Remy', 'Hunt', 'Remy Hunt', 'F', '1990/28/04', '(555)654-3210', 'remy@gmail.com', '15151 Cedar Avenue', 'Boise', 'ID', '83701', 'USA', 'Cigna', 'CG-1155-T', '11/10/2024', '11/12/2024', 'Dermatology', 'Dr. Wilson', 'Rosacea', 'B+', 'Y', 'Yes', 'No', 'Caspian Hunt', '(555)654-3211', 850.00, 850.00, 0.00, 4, 3, 'Metronidazole'),
(170, 'P1156', 'Onyx', 'Webb', 'Onyx Webb', 'Male', '7/7/1975', '(444)543-2109', 'onyx@gmail.com', '15252 Birch Avenue', 'Helena', 'MT', '59601', 'USA', 'Aetna', 'AE-1156-U', '12/15/2024', '12/18/2024', 'Pulmonology', 'Dr. Brown', 'COPD', 'O-', 'Yes', 'Yes', 'Yes', 'Dusk Webb', '(444)543-2110', 5300.00, 5300.00, 0.00, 5, 4, 'Spiriva'),
-- Duplicate
(171, 'P1156', 'Onyx', 'Webb', 'Onyx Webb', 'Male', '7/7/1975', '(444)543-2109', 'onyx@gmail.com', '15252 Birch Avenue', 'Helena', 'MT', '59601', 'USA', 'Aetna', 'AE-1156-U', '12/15/2024', '12/18/2024', 'Pulmonology', 'Dr. Brown', 'COPD', 'O-', 'Yes', 'Yes', 'Yes', 'Dusk Webb', '(444)543-2110', 5300.00, 5300.00, 0.00, 5, 4, 'Spiriva'),
(172, 'P1157', 'Cove', 'Black', 'Cove Black', 'F', '1986/15/09', '(333)432-1098', 'cove@gmail.com', '15353 Walnut Avenue', 'Bismarck', 'ND', '58501', 'USA', 'United Health', 'UH-1157-V', '1/10/2024', '1/13/2024', 'Psychiatry', 'Dr. Smith', 'Depression', 'A+', 'Y', 'Y', 'No', 'Frost Black', '(333)432-1099', 2200.00, 1100.00, 1100.00, 5, 4, 'SSRIs'),
(173, 'P1158', 'Lake', 'Knight', 'Lake Knight', 'Male', '4/4/1971', '(222)321-0987', 'lake@gmail.com', '15454 Spruce Avenue', 'Pierre', 'SD', '57501', 'USA', 'BlueCross', 'BC-1158-W', '2/15/2024', '2/19/2024', 'Gastroenterology', 'Dr. Johnson', 'Ulcerative Colitis', 'B-', 'Yes', 'Yes', 'No', 'Dew Knight', '(222)321-0988', 4600.00, 4600.00, 0.00, 4, 4, 'Mesalamine'),
(174, 'P1159', 'Wisteria', 'Floyd', 'Wisteria Floyd', 'Female', '1994/22/11', '(111)210-9876', 'wisteria@gmail.com', '15555 Poplar Avenue', 'Cheyenne', 'WY', '82001', 'USA', 'Cigna', 'CG-1159-X', '3/20/2024', '3/21/2024', 'Emergency', 'Dr. Davis', 'Fainting', 'AB-', 'Y', 'Yes', 'No', 'Mist Floyd', '(111)210-9877', 1300.00, 1300.00, 0.00, 1, 4, 'Dehydration'),
(175, 'P1160', 'Flint', 'Wolfe', 'Flint Wolfe', 'Male', '8/8/1968', '(999)109-8765', 'flint@gmail.com', '15656 Hickory Avenue', 'Frankfort', 'KY', '40601', 'USA', 'Aetna', 'AE-1160-Y', '4/25/2024', '5/3/2024', 'Cardiology', 'Dr. Wilson', 'Valve Disease', 'O+', 'Yes', 'Yes', 'Yes', 'Brook Wolfe', '(999)109-8766', 38000.00, 38000.00, 0.00, 6, 5, 'Valve replacement'),
(176, 'P1161', 'Lyra', 'Watkins', 'Lyra Watkins', 'F', '1982/05/04', '(888)098-7654', 'lyra@gmail.com', '15757 Magnolia Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'United Health', 'UH-1161-Z', '5/30/2024', '6/1/2024', 'Endocrinology', 'Dr. Brown', 'Diabetes', 'A-', 'Y', 'Y', 'No', 'Reed Watkins', '(888)098-7655', 2000.00, 2000.00, 0.00, 5, 4, 'Insulin pump'),
(177, 'P1162', 'Slate', 'Simpson', 'Slate Simpson', 'Male', '6/6/1977', '(777)987-6543', 'slate@gmail.com', '15858 Chestnut Avenue', 'Lincoln', 'NE', '68501', 'USA', 'BlueCross', 'BC-1162-A', '6/15/2024', '6/17/2024', 'Orthopedics', 'Dr. Smith', 'Herniated Disc', 'B+', 'Yes', 'Yes', 'No', 'Tide Simpson', '(777)987-6544', 7800.00, 7800.00, 0.00, 3, 4, 'Microdiscectomy'),
(178, 'P1163', 'Fern', 'Marsh', 'Fern Marsh', 'Female', '1987/28/07', '(666)876-5432', 'fern@gmail.com', '15959 Elm Street', 'Carson City', 'NV', '89701', 'USA', 'Cigna', 'CG-1163-B', '7/20/2024', '7/22/2024', 'Dermatology', 'Dr. Johnson', 'Psoriasis', 'O-', 'Y', 'Yes', 'No', 'Grove Marsh', '(666)876-5433', 1400.00, 700.00, 700.00, 6, 3, 'Biologics'),
(179, 'P1164', 'Cedar', 'Pope', 'Cedar Pope', 'Male', '2/2/1993', '(555)765-4321', 'cedar@gmail.com', '16060 Oak Street', 'Santa Fe', 'NM', '87501', 'USA', 'Aetna', 'AE-1164-C', '8/25/2024', '8/26/2024', 'Emergency', 'Dr. Davis', 'Concussion', 'A+', 'Yes', 'Yes', 'No', 'Pine Pope', '(555)765-4322', 3000.00, 3000.00, 0.00, 1, 5, 'CT normal'),
(180, 'P1165', 'Briar', 'Colon', 'Briar Colon', 'F', '1970/15/09', '(444)654-3210', 'briar@gmail.com', '16161 Pine Street', 'Concord', 'NH', '03301', 'USA', 'United Health', 'UH-1165-D', '9/10/2024', '9/17/2024', 'Geriatrics', 'Dr. Wilson', 'Parkinson', 'B-', 'Y', 'Y', 'No', 'Moss Colon', '(444)654-3211', 9800.00, 9800.00, 0.00, 9, 4, 'DBS therapy'),
(181, 'P1166', 'Zephyr', 'Guerrero', 'Zephyr Guerrero', 'Male', '7/7/1984', '(333)543-2109', 'zephyr@gmail.com', '16262 Cedar Street', 'Olympia', 'WA', '98501', 'USA', 'BlueCross', 'BC-1166-E', '10/15/2024', '10/17/2024', 'Neurology', 'Dr. Brown', 'Migraine', 'AB+', 'Yes', 'Yes', 'No', 'Gale Guerrero', '(333)543-2110', 2100.00, 2100.00, 0.00, 4, 4, 'Preventive therapy'),
(182, 'P1167', 'Soleil', 'Thornton', 'Soleil Thornton', 'F', '1979/22/01', '(222)432-1098', 'soleil@gmail.com', '16363 Birch Street', 'Salem', 'OR', '97301', 'USA', 'Cigna', 'CG-1167-F', '11/20/2024', '11/23/2024', 'Oncology', 'Dr. Smith', 'Thyroid Cancer', 'O+', 'Y', 'Yes', 'No', 'Lumen Thornton', '(222)432-1099', 14000.00, 7000.00, 7000.00, 3, 4, 'Thyroidectomy'),
(183, 'P1168', 'Caspian', 'Barber', 'Caspian Barber', 'Male', '4/4/1965', '(111)321-0987', 'caspian@gmail.com', '16464 Walnut Street', 'Augusta', 'ME', '04330', 'USA', 'Aetna', 'AE-1168-G', '12/5/2024', '12/12/2024', 'Geriatrics', 'Dr. Johnson', 'Dementia', 'A-', 'Yes', 'Yes', 'No', 'Dawn Barber', '(111)321-0988', 11500.00, 11500.00, 0.00, 14, 4, 'Memory care'),
(184, 'P1169', 'Vesper', 'Horn', 'Vesper Horn', 'Female', '1988/18/06', '(999)210-9876', 'vesper@gmail.com', '16565 Spruce Street', 'Harrisburg', 'PA', '17101', 'USA', 'United Health', 'UH-1169-H', '1/15/2024', '1/16/2024', 'Emergency', 'Dr. Davis', 'Appendicitis', 'B+', 'Y', 'Y', 'No', 'Dusk Horn', '(999)210-9877', 11800.00, 11800.00, 0.00, 1, 5, 'Laparoscopic'),
(185, 'P1170', 'Cosmo', 'Estrada', 'Cosmo Estrada', 'Male', '9/9/1973', '(888)109-8765', 'cosmo@gmail.com', '16666 Poplar Street', 'Trenton', 'NJ', '08601', 'USA', 'BlueCross', 'BC-1170-I', '2/20/2024', '2/24/2024', 'Cardiology', 'Dr. Wilson', 'Hypertension', 'O-', 'Yes', 'Yes', 'No', 'Nova Estrada', '(888)109-8766', 3100.00, 3100.00, 0.00, 5, 4, 'ACE inhibitor'),
(186, 'P1171', 'Orion', 'Deleon', 'Orion Deleon', 'M', '1962/25/11', '(777)098-7654', 'orion@gmail.com', '16767 Hickory Street', 'Annapolis', 'MD', '21401', 'USA', 'Cigna', 'CG-1171-J', '3/25/2024', '4/1/2024', 'Geriatrics', 'Dr. Brown', 'Stroke', 'A+', 'Y', 'Y', 'Yes', 'Vega Deleon', '(777)098-7655', 31000.00, 31000.00, 0.00, 7, 5, 'Rehab program'),
(187, 'P1172', 'Andromeda', 'Moody', 'Andromeda Moody', 'Female', '6/6/1991', '(666)987-6543', 'andromeda@gmail.com', '16868 Magnolia Street', 'Dover', 'DE', '19901', 'USA', 'Aetna', 'AE-1172-K', '4/30/2024', '5/1/2024', 'Dermatology', 'Dr. Smith', 'Acne', 'B-', 'Yes', 'Yes', 'No', 'Lyra Moody', '(666)987-6544', 500.00, 500.00, 0.00, 2, 3, 'Retinol'),
(188, 'P1173', 'Rigel', 'Stout', 'Rigel Stout', 'Male', '1978/08/04', '(555)876-5432', 'rigel@gmail.com', '16969 Chestnut Street', 'Burlington', 'VT', '05401', 'USA', 'United Health', 'UH-1173-L', '5/15/2024', '5/19/2024', 'Pulmonology', 'Dr. Johnson', 'Sleep Apnea', 'AB+', 'Y', 'Yes', 'Yes', 'Vela Stout', '(555)876-5433', 3000.00, 3000.00, 0.00, 3, 4, 'CPAP adjusted'),
(189, 'P1174', 'Lyra', 'Carr', 'Lyra Carr', 'F', '3/3/1985', '(444)765-4321', 'lyracarr@gmail.com', '17070 Elm Avenue', 'Montpelier', 'VT', '05601', 'USA', 'BlueCross', 'BC-1174-M', '6/20/2024', '6/22/2024', 'Rheumatology', 'Dr. Davis', 'Fibromyalgia', 'O+', 'Yes', 'Yes', 'No', 'Arc Carr', '(444)765-4322', 3700.00, 1850.00, 1850.00, 8, 3, 'Pain management'),
(190, 'P1175', 'Vega', 'Barton', 'Vega Barton', 'Male', '1967/28/07', '(333)654-3210', 'vega@gmail.com', '17171 Oak Avenue', 'Augusta', 'GA', '30901', 'USA', 'Cigna', 'CG-1175-N', '7/25/2024', '7/30/2024', 'Cardiology', 'Dr. Wilson', 'Coronary Disease', 'A-', 'Y', 'Y', 'Yes', 'Nova Barton', '(333)654-3211', 18000.00, 18000.00, 0.00, 6, 5, 'Stent placed'),
(191, 'P1176', 'Cassidy', 'Fry', 'Cassidy Fry', 'Female', '8/8/1993', '(222)543-2109', 'cassidy@gmail.com', '17272 Pine Avenue', 'Boise', 'ID', '83701', 'USA', 'Aetna', 'AE-1176-O', '8/10/2024', '8/11/2024', 'Emergency', 'Dr. Brown', 'Sprained Ankle', 'B+', 'Yes', 'Yes', 'No', 'Blaze Fry', '(222)543-2110', 1200.00, 1200.00, 0.00, 1, 4, 'Brace applied'),
(192, 'P1177', 'Talon', 'Finley', 'Talon Finley', 'Male', '1972/15/10', '(111)432-1098', 'talon@gmail.com', '17373 Cedar Avenue', 'Helena', 'MT', '59601', 'USA', 'United Health', 'UH-1177-P', '9/15/2024', '9/21/2024', 'Oncology', 'Dr. Smith', 'Prostate Cancer', 'O-', 'Y', 'Yes', 'No', 'Hawk Finley', '(111)432-1099', 22000.00, 11000.00, 11000.00, 5, 4, 'Radiation'),
(193, 'P1178', 'Isolde', 'Glenn', 'Isolde Glenn', 'F', '5/5/1989', '(999)321-0987', 'isolde@gmail.com', '17474 Birch Avenue', 'Bismarck', 'ND', '58501', 'USA', 'BlueCross', 'BC-1178-Q', '10/20/2024', '10/22/2024', 'Psychiatry', 'Dr. Johnson', 'PTSD', 'A+', 'Yes', 'Yes', 'No', 'Tristan Glenn', '(999)321-0988', 2900.00, 1450.00, 1450.00, 7, 4, 'EMDR therapy'),
(194, 'P1179', 'Theron', 'Douglas', 'Theron Douglas', 'Male', '1980/22/02', '(888)210-9876', 'theron@gmail.com', '17575 Walnut Avenue', 'Pierre', 'SD', '57501', 'USA', 'Cigna', 'CG-1179-R', '11/5/2024', '11/9/2024', 'Gastroenterology', 'Dr. Davis', 'Hepatitis C', 'B-', 'Y', 'Y', 'No', 'Lyra Douglas', '(888)210-9877', 6800.00, 6800.00, 0.00, 3, 4, 'Antivirals'),
(195, 'P1180', 'Seren', 'Mcbride', 'Seren Mcbride', 'Female', '7/7/1977', '(777)109-8765', 'seren@gmail.com', '17676 Spruce Avenue', 'Cheyenne', 'WY', '82001', 'USA', 'Aetna', 'AE-1180-S', '12/10/2024', '12/13/2024', 'Endocrinology', 'Dr. Wilson', 'Hashimoto', 'AB+', 'Yes', 'Yes', 'No', 'Rhys Mcbride', '(777)109-8766', 1700.00, 1700.00, 0.00, 5, 4, 'Levothyroxine'),
(196, 'P1181', 'Idris', 'Holt', 'Idris Holt', 'Male', '1963/18/05', '(666)098-7654', 'idris@gmail.com', '17777 Poplar Avenue', 'Frankfort', 'KY', '40601', 'USA', 'United Health', 'UH-1181-T', '1/15/2024', '1/22/2024', 'Geriatrics', 'Dr. Brown', 'Alzheimer', 'O+', 'Y', 'Yes', 'No', 'Brin Holt', '(666)098-7655', 12000.00, 12000.00, 0.00, 11, 4, 'Memory care'),
(197, 'P1182', 'Nyx', 'Holloway', 'Nyx Holloway', 'F', '4/4/1988', '(555)987-6543', 'nyx@gmail.com', '17878 Hickory Avenue', 'Jefferson City', 'MO', '65101', 'USA', 'BlueCross', 'BC-1182-U', '2/20/2024', '2/22/2024', 'Dermatology', 'Dr. Smith', 'Vitiligo', 'A-', 'Yes', 'Yes', 'No', 'Sol Holloway', '(555)987-6544', 950.00, 475.00, 475.00, 4, 3, 'Phototherapy'),
(198, 'P1183', 'Orla', 'Moran', 'Orla Moran', 'Female', '1975/25/08', '(444)876-5432', 'orla@gmail.com', '17979 Magnolia Street', 'Lincoln', 'NE', '68501', 'USA', 'Cigna', 'CG-1183-V', '3/25/2024', '3/28/2024', 'Gynecology', 'Dr. Johnson', 'Endometriosis', 'B+', 'Y', 'Y', 'No', 'Finn Moran', '(444)876-5433', 5500.00, 2750.00, 2750.00, 3, 4, 'Laparoscopy'),
(199, 'P1184', 'Zara', 'Welch', 'Zara Welch', 'Female', '9/9/1992', '(333)765-4321', 'zara@gmail.com', '18080 Chestnut Street', 'Carson City', 'NV', '89701', 'USA', 'Aetna', 'AE-1184-W', '4/30/2024', '5/1/2024', 'Emergency', 'Dr. Davis', 'Asthma Attack', 'O-', 'Yes', 'Yes', 'No', 'Cai Welch', '(333)765-4322', 2600.00, 2600.00, 0.00, 1, 5, 'Nebulizer'),
(200, 'P1185', 'Iduna', 'Vance', 'Iduna Vance', 'F', '1971/15/11', '(222)654-3210', 'iduna@gmail.com', '18181 Elm Avenue', 'Santa Fe', 'NM', '87501', 'USA', 'United Health', 'UH-1185-X', '5/15/2024', '5/19/2024', 'Oncology', 'Dr. Wilson', 'Lymphoma', 'A+', 'Y', 'Yes', 'No', 'Fen Vance', '(222)654-3211', 29000.00, 14500.00, 14500.00, 6, 4, 'CHOP therapy');


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Make a new table 
create table  public.patient_records_cleaning as 
select * from public.patient_records

select * 
from public.patient_records_cleaning

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Duplicates 
select * 
from (select 
	patient_id, 
	row_number() over (partition by (patient_id) order by record_id) as rn 
	from public.patient_records_cleaning) as sub
where rn>1

delete from public.patient_records_cleaning
where patient_id in 
	(select patient_id
	from (select 
		patient_id, 
		row_number() over (partition by (patient_id) order by record_id) as rn 
		from public.patient_records_cleaning) as sub
where rn>1)

select * 
from public.patient_records_cleaning

-- 'P1017' has no info. Ghost record 
delete from public.patient_records_cleaning
where patient_id = 'P1017'

SELECT * FROM public.patient_records_cleaning
WHERE patient_id = 'P1017'

-- Now find duplicates using name and birth date 
select * 
from (select full_name, date_of_birth, address, patient_id, 
row_number() over(partition by full_name, date_of_birth, address order by patient_id) as rn
from public.patient_records_cleaning) as dup
where rn>1

delete from public.patient_records_cleaning
where patient_id in (select patient_id from 
(select patient_id, 
row_number() over(partition by full_name, date_of_birth, address order by patient_id) as rn
from public.patient_records_cleaning) as dup
where rn>1)

select * 
from public.patient_records_cleaning
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix gender 
Select gender, 
case 
	when gender ilike 'm%' then 'Male'
	when gender ilike 'f%' then 'Female'
	else null
end as clean_gender 
from public.patient_records_cleaning


update public.patient_records_cleaning
set gender = case 
	when gender ilike 'm%' then 'Male'
	when gender ilike 'f%' then 'Female'
	else null
end 

select * 
from public.patient_records_cleaning

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Now my target is to fix all the dates (date_of_birth, admission_date & discharge_date)
select date_of_birth, 
concat (substring(regexp_replace(date_of_birth, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(date_of_birth, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(date_of_birth, '[-/]', '-','g'),6,2)) as sub
from public.patient_records_cleaning
where date_of_birth ilike '19%' or date_of_birth ilike '20%'

update public.patient_records_cleaning
set date_of_birth = concat (substring(regexp_replace(date_of_birth, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(date_of_birth, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(date_of_birth, '[-/]', '-','g'),6,2)) 
where date_of_birth ilike '19%' or date_of_birth ilike '20%'

select date_of_birth 
from public.patient_records_cleaning -- still have europian style and  mm/dd/yyyy
-- europian style time fix 
SELECT date_of_birth, patient_id,
       TO_DATE(date_of_birth, 'DD/MM/YYYY') AS clean_date
FROM public.patient_records_cleaning
WHERE date_of_birth NOT LIKE '19%' AND date_of_birth NOT LIKE '20%'
AND SPLIT_PART(date_of_birth, '/', 1)::INT > 12
AND date_of_birth IS NOT NULL AND date_of_birth != '';


update public.patient_records_cleaning
set date_of_birth = TO_DATE(date_of_birth, 'DD/MM/YYYY') 
WHERE date_of_birth NOT LIKE '19%' AND date_of_birth NOT LIKE '20%'
AND SPLIT_PART(date_of_birth, '/', 1)::INT > 12
AND date_of_birth IS NOT NULL AND date_of_birth != ''

select date_of_birth -- now I have to fix mm/dd/yyyy to yyyy/dd/mm
from public.patient_records_cleaning

select patient_id, date_of_birth, 
to_date(date_of_birth, 'mm/dd/yyyy') as clean
from public.patient_records_cleaning
where date_of_birth not like '19%' and date_of_birth not like '20%'
and date_of_birth is not null  and date_of_birth != ''


update public.patient_records_cleaning
set date_of_birth = to_date(date_of_birth, 'mm/dd/yyyy') 
where date_of_birth not like '19%' and date_of_birth not like '20%'
and date_of_birth is not null  and date_of_birth != ''



select patient_id, date_of_birth
from public.patient_records_cleaning
where split_part(date_of_birth, '-', 2)::int > 12

update public.patient_records_cleaning
set date_of_birth = '1977-08-19'
where date_of_birth = '1977-19-08'

select patient_id, 
full_name, 
date_of_birth, 
case 
	when date_of_birth :: date > current_date then 'Invalied'
	else date_of_birth
end as clean 
FROM public.patient_records_cleaning


update public.patient_records_cleaning
set date_of_birth = case 
	when date_of_birth :: date > current_date then 'Invalied'
	else date_of_birth
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- admission_date


select admission_date, 
concat (substring(regexp_replace(admission_date, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(admission_date, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(admission_date, '[-/]', '-','g'),6,2)) as sub
from public.patient_records_cleaning
where admission_date ilike '19%' or admission_date ilike '20%'

update public.patient_records_cleaning
set admission_date = concat (substring(regexp_replace(admission_date, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(admission_date, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(admission_date, '[-/]', '-','g'),6,2)) 
where admission_date ilike '19%' or admission_date ilike '20%'

select admission_date
from public.patient_records_cleaning -- still have europian style and  mm/dd/yyyy
-- europian style time fix 
SELECT admission_date, patient_id,
       TO_DATE(admission_date, 'DD/MM/YYYY') AS clean_date
FROM public.patient_records_cleaning
WHERE admission_date NOT LIKE '19%' AND admission_date NOT LIKE '20%'
AND SPLIT_PART(admission_date, '/', 1)::INT > 12
AND admission_date IS NOT NULL AND admission_date != '';


update public.patient_records_cleaning
set admission_date = TO_DATE(admission_date, 'DD/MM/YYYY') 
WHERE admission_date NOT LIKE '19%' AND admission_date NOT LIKE '20%'
AND SPLIT_PART(admission_date, '/', 1)::INT > 12
AND admission_date IS NOT NULL AND admission_date != ''

select admission_date -- now I have to fix mm/dd/yyyy to yyyy/dd/mm
from public.patient_records_cleaning

select patient_id, admission_date, 
to_date(admission_date, 'mm/dd/yyyy') as clean
from public.patient_records_cleaning
where admission_date not like '19%' and admission_date not like '20%'
and admission_date is not null  and admission_date != ''


update public.patient_records_cleaning
set admission_date = to_date(admission_date, 'mm/dd/yyyy') 
where admission_date not like '19%' and admission_date not like '20%'
and admission_date is not null  and admission_date != ''


select admission_date 
from public.patient_records_cleaning 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select discharge_date
from public.patient_records_cleaning

select discharge_date, 
concat (substring(regexp_replace(discharge_date, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(discharge_date, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(discharge_date, '[-/]', '-','g'),6,2)) as sub
from public.patient_records_cleaning
where discharge_date ilike '19%' or discharge_date ilike '20%'

update public.patient_records_cleaning
set discharge_date = concat (substring(regexp_replace(discharge_date, '[-/]', '-','g'),1,4), '-',
	substring(regexp_replace(discharge_date, '[-/]', '-','g'),9,2), '-',
	substring(regexp_replace(discharge_date, '[-/]', '-','g'),6,2)) 
where discharge_date ilike '19%' or discharge_date ilike '20%'

select discharge_date
from public.patient_records_cleaning 

-- europian style time fix 
SELECT discharge_date, 
patient_id,
to_date(discharge_date, 'DD/MM/YYYY') AS clean_date
FROM public.patient_records_cleaning
where discharge_date not like '19%' 
 and discharge_date not like '20%' and SPLIT_PART(discharge_date, '/', 1)::INT > 12
 and discharge_date is not null and discharge_date != ''


update public.patient_records_cleaning
set discharge_date = to_date(discharge_date, 'DD/MM/YYYY') 
where discharge_date not like '19%' 
 and discharge_date not like '20%' and SPLIT_PART(discharge_date, '/', 1)::INT > 12
 and discharge_date is not null and discharge_date != ''


select discharge_date -- now I have to fix mm/dd/yyyy to yyyy/dd/mm
from public.patient_records_cleaning

select patient_id, discharge_date, 
to_date(discharge_date, 'mm/dd/yyyy') as clean
from public.patient_records_cleaning
where discharge_date not like '19%' and discharge_date not like '20%'
and discharge_date is not null  and discharge_date != ''


update public.patient_records_cleaning
set discharge_date = to_date(discharge_date, 'mm/dd/yyyy') 
where discharge_date not like '19%' and discharge_date not like '20%'
and discharge_date is not null  and discharge_date != ''


select discharge_date
from public.patient_records_cleaning 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select * 
from public.patient_records_cleaning  -- now phone & emergency_contact 

select phone, 
concat (substring(regexp_replace(phone, '[^0-9]','', 'g'), 1,3), '-', 
	substring(regexp_replace(phone, '[^0-9]','', 'g'), 4,3), '-', 
	substring(regexp_replace(phone, '[^0-9]','', 'g'), 7,4)) as clean 
from public.patient_records_cleaning


update public.patient_records_cleaning
set phone = concat (substring(regexp_replace(phone, '[^0-9]','', 'g'), 1,3), '-', 
	substring(regexp_replace(phone, '[^0-9]','', 'g'), 4,3), '-', 
	substring(regexp_replace(phone, '[^0-9]','', 'g'), 7,4))

select phone, CASE 
    WHEN phone IS NULL OR phone = '' or phone in ('N/A', '--') THEN NULL
    ELSE phone
END
from public.patient_records_cleaning


update public.patient_records_cleaning
set phone = CASE 
    WHEN phone IS NULL OR phone = '' or phone in ('N/A', '--') THEN NULL
    ELSE phone
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select *
from public.patient_records_cleaning -- emergency_phone

select emergency_phone, 
concat (substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 1,3), '-', 
	substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 4,3), '-', 
	substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 7,4)) as clean 
from public.patient_records_cleaning


update public.patient_records_cleaning
set emergency_phone = concat (substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 1,3), '-', 
	substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 4,3), '-', 
	substring(regexp_replace(emergency_phone, '[^0-9]','', 'g'), 7,4))

select emergency_phone, CASE 
    WHEN emergency_phone IS NULL OR emergency_phone = '' or emergency_phone in ('N/A', '--') THEN NULL
    ELSE emergency_phone
END
from public.patient_records_cleaning


update public.patient_records_cleaning
set emergency_phone = CASE 
    WHEN emergency_phone IS NULL OR emergency_phone = '' or emergency_phone in ('N/A', '--') THEN NULL
    ELSE emergency_phone
END
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- is_active, is_insured, smoker

select is_active, 
case 
	when is_active ilike '%y%' then 'Yes'
	when is_active ilike '%n%' then 'No'
	else 'Contact Soon'
end as clean 
	from public.patient_records_cleaning


update public.patient_records_cleaning
set is_active = case 
	when is_active ilike '%y%' then 'Yes'
	when is_active ilike '%n%' then 'No'
	else 'Contact Soon'
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select is_insured, 
case 
	when is_insured ilike '%y%' then 'Yes'
	when is_insured ilike '%n%' then 'No'
	else 'Contact Soon'
end as clean 
from public.patient_records_cleaning


update public.patient_records_cleaning
set is_insured= case 
	when is_insured ilike '%y%' then 'Yes'
	when is_insured ilike '%n%' then 'No'
	else 'Contact Soon'
end 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select smoker, 
case 
	when smoker ilike '%y%' then 'Yes'
	when smoker ilike '%n%' then 'No'
	else 'Contact Soon'
end as clean 
from public.patient_records_cleaning

update public.patient_records_cleaning
set smoker = case 
	when smoker ilike '%y%' then 'Yes'
	when smoker ilike '%n%' then 'No'
	else 'Contact Soon'
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning  -- state 

update public.patient_records_cleaning
set state = upper(state)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- country 
select country, 
case 
	when country ilike '%america%' then 'USA'
    when country ilike '%united%' then'USA'
    when country ilike 'us%' then 'USA'
    when country ilike 'u.s%' then 'USA'
    else country
end as clean 
from public.patient_records_cleaning

update public.patient_records_cleaning
set country = case 
    when country ilike '%america%' then 'USA'
    when country ilike '%united%' then'USA'
    when country ilike 'us%' then 'USA'
    when country ilike 'u.s%' then 'USA'
    else country
end


--------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- balance, total_bill, amount paid

select balance, abs(balance)
from public.patient_records_cleaning

update public.patient_records_cleaning
set balance = abs(balance)

update public.patient_records_cleaning
set amount_paid = abs(amount_paid)

update public.patient_records_cleaning
set total_bill = abs(total_bill)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- email 

select email 
from public.patient_records_cleaning


SELECT email, 
case 
	
	when email is null or email = '' then 'Unknown'
	when email ilike '%@@%' then replace (email, '@@', '@')
	when email not like '%@%' then 'Invalied - Missing @'
	when email not like '%.%' then 'Invalied-Missing Domain'
	else email
end
FROM public.patient_records_cleaning

update public.patient_records_cleaning
set email = case 
	
	when email is null or email = '' then 'Unknown'
	when email ilike '%@@%' then replace (email, '@@', '@')
	when email not like '%@%' then 'Invalid - Missing @'
	when email not like '%.%' then 'Invalid-Missing Domain'
	else email
end
---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
select *
from public.patient_records_cleaning -- rating

select rating, 
case 
	when rating > 5 then null
	when rating < 1 then null
	else rating 
end as clean 
from public.patient_records_cleaning

update public.patient_records_cleaning
set rating = case 
	when rating > 5 then null
	when rating < 1 then null
	else rating 
end 
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning --doctor_name 

select doctor_name, 
case 
	when doctor_name is null or doctor_name = '' then  'Unknown'
	else doctor_name
end as clean 
from public.patient_records_cleaning

update public.patient_records_cleaning
set doctor_name = case 
	when doctor_name is null or doctor_name = '' then  'Unknown'
	else doctor_name
end 
--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * 
from public.patient_records_cleaning -- fix zip code 

select zip_code, 
regexp_replace(zip_code, '[^0-9]', '', 'g')
from public.patient_records_cleaning

update public.patient_records_cleaning
set zip_code = regexp_replace(zip_code, '[^0-9]', '', 'g')
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select *  -- check for invalied dates 
from public.patient_records_cleaning

select patient_id, 
full_name, 
admission_date, 
case 
	when admission_date :: date > current_date then 'Invalied'
	else admission_date
end as clean 
FROM public.patient_records_cleaning


update public.patient_records_cleaning
set  admission_date = 
case 
	when admission_date :: date > current_date then 'Invalid'
	else admission_date
end 
----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
select * -- check for invalied dates 
FROM public.patient_records_cleaning

select patient_id, 
full_name, 
discharge_date, 
case 
	when discharge_date :: date > current_date then 'Invalid'
	else discharge_date
end as clean 
FROM public.patient_records_cleaning


update public.patient_records_cleaning
set  discharge_date = 
case 
	when discharge_date :: date > current_date then 'Invalied'
	else discharge_date
end 
------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
-- Trim 
update public.patient_records_cleaning
set
    first_name = trim(first_name),
    last_name = trim(last_name),
    full_name = trim(full_name),
    email = trim(email),
    phone = trim(phone),
    address = trim(address),
    city = trim(city),
    state = trim(state),
    country = trim(country),
    doctor_name = trim(doctor_name),
    insurance_provider = trim(insurance_provider),
    diagnosis = trim(diagnosis)

select * 
from public.patient_records_cleaning


-----------------------------------------------------------------------------------------------------------------------------------