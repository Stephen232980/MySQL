-- Hiển thị thông tin tất cả các hóa đơn
SELECT oID, oDate, oTotalPrice 
FROM `Order`;
-- Hiển thị danh sách khách hàng đã mua hàng và sản phẩm
SELECT c.cID, c.Name, p.pID, p.pName 
FROM Customer c
JOIN `Order` o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID;
-- Hiển thị tên những khách hàng không mua bất kỳ sản phẩm nào
SELECT Name 
FROM Customer 
WHERE cID NOT IN (SELECT DISTINCT cID FROM `Order`);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS oTotalPrice
FROM `Order` o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;