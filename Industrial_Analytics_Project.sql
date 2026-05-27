CREATE DATABASE Industrial_SupplyChain_DB;
USE Industrial_SupplyChain_DB;
CREATE TABLE Procurement_Table (
    Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Material_Name VARCHAR(100),
    Quantity_Tons INT,
    Unit_Price_FOB DECIMAL(10, 2),
    Shipping_Costs DECIMAL(10, 2),
    Customs_Expenses DECIMAL(10, 2),
    Total_Landed_Cost DECIMAL(10, 2)
);
INSERT INTO Procurement_Table (Material_Name, Quantity_Tons, Unit_Price_FOB, Shipping_Costs, Customs_Expenses, Total_Landed_Cost)
VALUES 
('Copper (Direct Materials)', 50, 11500.00, 8500.00, 57500.00, 641000.00),
('Aluminum (Raw Materials)', 80, 2500.00, 7000.00, 16000.00, 223000.00),
('Heavy Transformers & Parts', 30, 15000.00, 4500.00, 54000.00, 508500.00);
SELECT * FROM Procurement_Table
where Material_Name='copper (direct materials)';
SELECT * FROM Procurement_Table
where Shipping_Costs >5000 ;
SELECT * FROM Procurement_Table
where Quantity_Tons > 40 and Unit_Price_FOB <5000;
select sum(Total_Landed_Cost) from Procurement_Table;
select avg(Shipping_Costs) as average_shipping_cost
from Procurement_Table;
select
      sum(Customs_Expenses) as Total_customs,
      avg(Customs_Expenses) as Average_customs,
      max(Customs_Expenses) as Max_customs,
      min(Customs_Expenses) as Min_customs
from Procurement_Table;
CREATE TABLE Sales_Table (
    Sales_ID INT AUTO_INCREMENT PRIMARY KEY,
    Material_Name VARCHAR(100),
    Quantity_Sold_Tons INT,
    Selling_Price_Per_Ton DECIMAL(10, 2)
);
INSERT INTO Sales_Table (Material_Name, Quantity_Sold_Tons, Selling_Price_Per_Ton)
VALUES 
('Copper (Direct Materials)', 50, 15000.00),
('Aluminum (Raw Materials)', 80, 4000.00),
('Heavy Transformers & Parts', 30, 22000.00);
select * from Sales_Table;
SELECT 
    P.Material_Name,
    P.Total_Landed_Cost AS Total_Cost,
    (S.Quantity_Sold_Tons * S.Selling_Price_Per_Ton) AS Total_Revenue
  FROM Procurement_Table AS P
  INNER JOIN Sales_Table AS S
  ON P.Material_Name = S.Material_Name;
  SELECT 
    P.Material_Name,
    P.Total_Landed_Cost AS Total_Cost,
    (S.Quantity_Sold_Tons * S.Selling_Price_Per_Ton) AS Total_Revenue,
    ((S.Quantity_Sold_Tons * S.Selling_Price_Per_Ton) - P.Total_Landed_Cost) AS Net_Profit
FROM Procurement_Table AS P
INNER JOIN Sales_Table AS S 
ON P.Material_Name = S.Material_Name;
    
      
      
      
