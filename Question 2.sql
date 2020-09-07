/* a. How many orders were shipped by Speedy Express in total? */
SELECT
    COUNT(*) AS OrderCount
FROM Orders o
JOIN Shippers s
    ON o.ShipperID = s.ShipperID
WHERE s.ShipperName = 'Speedy Express';
/* Answer: 54 */


/* b. What is the last name of the employee with the most orders? */
SELECT
    e.LastName,
    COUNT(*) AS OrderCount FROM Orders o
JOIN Employees e
    ON o.EmployeeID = e.EmployeeID
GROUP BY e.LastName
ORDER BY OrderCount DESC
LIMIT 1;
/* Answer: Peacock with 40 orders */


/* c. What product was ordered the most by customers in Germany? */
SELECT
    p.ProductName,
    SUM(od.Quantity) AS Quantity
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON p.ProductID = od.ProductID
WHERE c.Country = 'Germany'
GROUP BY p.ProductName
ORDER BY Quantity DESC
LIMIT 1;
/* Answer: Boston Crab Meat was ordered the most in Germany with 160 items sold */
