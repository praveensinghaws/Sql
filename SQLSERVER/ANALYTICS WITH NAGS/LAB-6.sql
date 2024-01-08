-- 10) 02:34:00 - SQL Queries   

 -- DQL [DATA QUERY LANGUAGE]
 
 USE AdventureWorksDW2014

 SELECT  gender  ,maritalStatus ,count(*) as Total FROM DIMCUSTOMER group by maritalStatus , gender 
  


 
