--creating tables
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(20),
    address VARCHAR(255),
    email VARCHAR(100)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(100),
    publisher VARCHAR(100),
    stock INT,
    genre VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Order (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    ISBN INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Order(order_id),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);

CREATE TABLE Supply (
    supply_id INT PRIMARY KEY,
    supplier_id INT,
    ISBN INT,
    quantity INT,
    supply_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);




--inserting values

-- Insert into Customer
INSERT INTO Customer (customer_id, name, address, phone, email) VALUES
(1, 'John Doe', '123 Elm St', '123-456-7890', 'johndoe@example.com'),
(2, 'Jane Smith', '456 Oak St', '234-567-8901', 'janesmith@example.com'),
(3, 'Alice Johnson', '789 Pine St', '345-678-9012', 'alicej@example.com'),
(4, 'Bob Brown', '101 Maple St', '456-789-0123', 'bobb@example.com'),
(5, 'Carol White', '202 Birch St', '567-890-1234', 'carolw@example.com');

-- Insert into Supplier
INSERT INTO Supplier (supplier_id, name, contact, address, email) VALUES
(1, 'Book Supplier A', '987-654-3210', '123 Supplier Rd', 'supplierA@example.com'),
(2, 'Book Supplier B', '876-543-2109', '456 Supplier Ln', 'supplierB@example.com'),
(3, 'Book Supplier C', '765-432-1098', '789 Supplier St', 'supplierC@example.com'),
(4, 'Book Supplier D', '654-321-0987', '101 Supplier Blvd', 'supplierD@example.com'),
(5, 'Book Supplier E', '543-210-9876', '202 Supplier Ave', 'supplierE@example.com');

-- Insert into Books
INSERT INTO Books (ISBN, title, author, publisher, stock, genre, price) VALUES
(9780131103627, 'The C Programming Language', 'Kernighan, Ritchie', 'Prentice Hall', 50, 'Programming', 45.00),
(9780201633610, 'Design Patterns', 'Erich Gamma et al.', 'Addison-Wesley', 30, 'Software Engineering', 55.00),
(9780132350884, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 40, 'Programming', 50.00),
(9780137081073, 'Effective Java', 'Joshua Bloch', 'Addison-Wesley', 35, 'Programming', 60.00),
(9780321356680, 'Refactoring', 'Martin Fowler', 'Addison-Wesley', 25, 'Software Engineering', 65.00);

-- Insert into Order
INSERT INTO Order (order_id, order_date, total_amount, customer_id) VALUES
(1, '2023-07-01', 135.00, 1),
(2, '2023-07-02', 110.00, 2),
(3, '2023-07-03', 55.00, 3),
(4, '2023-07-04', 120.00, 4),
(5, '2023-07-05', 45.00, 5);

-- Insert into Order_Details
INSERT INTO Order_Details (order_details_id, order_id, ISBN, quantity, price) VALUES
(1, 1, 9780131103627, 1, 45.00),
(2, 1, 9780201633610, 1, 55.00),
(3, 1, 9780132350884, 1, 50.00),
(4, 2, 9780137081073, 2, 120.00),
(5, 3, 9780321356680, 1, 55.00);

-- Insert into Supply
INSERT INTO Supply (supply_id, supplier_id, ISBN, quantity, supply_date) VALUES
(1, 1, 9780131103627, 20, '2023-06-01'),
(2, 2, 9780201633610, 15, '2023-06-02'),
(3, 3, 9780132350884, 10, '2023-06-03'),
(4, 4, 9780137081073, 25, '2023-06-04'),
(5, 5, 9780321356680, 5, '2023-06-05');





--updating operations

-- Update Customer's address
UPDATE Customer
SET address = '321 Elm St'
WHERE customer_id = 1;

-- Update Books stock
UPDATE Books
SET stock = 45
WHERE ISBN = 9780131103627;

-- Update Order total amount
UPDATE Order
SET total_amount = 150.00
WHERE order_id = 1;


--delete operations

-- Delete a Customer
DELETE FROM Customer
WHERE customer_id = 5;

-- Delete a Book
DELETE FROM Books
WHERE ISBN = 9780321356680;

-- Delete an Order
DELETE FROM Order
WHERE order_id = 5;
