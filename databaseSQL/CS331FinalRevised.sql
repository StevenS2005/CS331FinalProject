CREATE TABLE RENTAL_BRANCH (
BranchID INT NOT NULL AUTO_INCREMENT,
   	 Street_Address VARCHAR(100),
 City VARCHAR(50),
 	State VARCHAR(20),
 	Zip_Code VARCHAR(10),
    ContactInformation VARCHAR(100),
    PRIMARY KEY (BranchID)
);

CREATE TABLE CUSTOMER (
CustomerID INT NOT NULL,
C_FName VARCHAR(50) NOT NULL,
 C_LName VARCHAR(50) NOT NULL,
	DateOfBirth DATE,
	Phone VARCHAR(15),
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(255) NOT NULL,
Street_Address VARCHAR(100), 
City VARCHAR(50),
 State VARCHAR(20), 
Zip_Code VARCHAR(10),
    PRIMARY KEY (CustomerID),
    UNIQUE (Email)
);

CREATE TABLE CAR (
	CarID INT NOT NULL AUTO_INCREMENT,
	LicensePlateNumber VARCHAR(8) NOT NULL,
	Model VARCHAR(50),
	Brand	VARCHAR(50),
	Category VARCHAR(50),
	YearOfManufacture INT,
	RentalStatus VARCHAR(50),
	BranchID INT NOT NULL,
	UNIQUE (LicensePlateNumber),
	PRIMARY KEY (CarID),
	FOREIGN KEY(BranchID) REFERENCES RENTAL_BRANCH(BranchID)
);

CREATE TABLE RENTAL_AGREEMENT (
	Rental_ID INT NOT NULL AUTO_INCREMENT,
	Start_Date DATE NOT NULL,
	End_Date DATE,
	DailyRate FLOAT,
	TotalCost FLOAT,
	CustomerID INT NOT NULL,
	CarID INT NOT NULL,
    PRIMARY KEY (Rental_ID),
    FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY(CarID) REFERENCES CAR(CarID)
);

CREATE TABLE PAYMENT (
	Payment_ID INT NOT NULL AUTO_INCREMENT,
	PDate DATE NOT NULL,
	Amount FLOAT,
	Method VARCHAR(50),
	Rental_ID INT NOT NULL,
	PRIMARY KEY (Payment_ID),
	FOREIGN KEY(Rental_ID) REFERENCES RENTAL_AGREEMENT(Rental_ID)
);

CREATE TABLE STAFF_MEMBER (
	EmployeeID INT NOT NULL AUTO_INCREMENT,
S_FName VARCHAR(50) NOT NULL,
 S_LName VARCHAR(50) NOT NULL, 
	Role VARCHAR(50),
	Salary FLOAT,
	BranchID INT NOT NULL,
	Password VARCHAR(255) NOT NULL,
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY(BranchID) REFERENCES RENTAL_BRANCH(BranchID)
);

CREATE TABLE MAINTENANCE_RECORD (
	MaintenanceID INT NOT NULL AUTO_INCREMENT,
	MDate DATE NOT NULL,
	DescriptionOfWork VARCHAR(250),
	Cost FLOAT,
	CarID INT NOT NULL,
	PRIMARY KEY (MaintenanceID),
	FOREIGN KEY(CarID) REFERENCES CAR(CarID)
);



INSERT INTO RENTAL_BRANCH (Street_Address, City, State, Zip_Code, ContactInformation)
VALUES ('123 Market ST', 'Newark', 'NJ', '07102', '973-555-0101');

INSERT INTO STAFF_MEMBER (S_FName, S_LName, Role, Salary, BranchID, Password)
VALUES ('Super', 'Admin', 'Admin', 80000, 1, 'admin123');


INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('ABC-123', 'IS500', 'Lexus', 'Sedan', 2022, 'rented', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('XYZ-987', 'Mustang GT', 'Ford', 'Coupe', 2019, 'rented', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('SUV-555', 'M5', 'BMW', 'Sedan', 2024, 'under maintenance', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('DEF-345', 'Model Y', 'Tesla', 'SUV', 2023, 'rented', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('XWH-643', 'Bronco', 'Ford', 'SUV', 2022, 'rented', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('AGC-574', 'M4 Competition', 'BMW', 'coupe', 2023, 'under maintenance', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('YTE-243', 'Bronco', 'Ford', 'SUV', 2022, 'available', 1);
INSERT INTO CAR (LicensePlateNumber, Model, Brand, Category, YearOfManufacture, RentalStatus, BranchID)
 VALUES ('EIO-362', 'Civic', 'Honda', 'Sedan', 2025, 'available', 1);
