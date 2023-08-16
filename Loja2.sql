USE Loja

SELECT * FROM itensvendidos;

SELECT *
FROM itensvendidos
GROUP BY IDVenda;

SELECT IDVenda, COUNT(IDProduto)
    -> FROM itensvendidos
    -> GROUP BY IDVenda;

SELECT IDVenda, COUNT(IDProduto), SUM(QtdeVendida)
    -> FROM itensvendidos
    -> GROUP BY IDVenda;

SELECT IDVenda,
    -> itensvendidos.IDProduto,
    -> QtdeVendida,
    ->
    -> PrecoUnitario,
    -> QtdeVendida * PrecoUnitario AS Subtotal
    -> FROM itensvendidos INNER JOIN produtos
    -> ON itensvendidos.IDProduto = produtos.IDProduto
    -> ORDER BY IDVenda;

SELECT IDVenda,
    -> COUNT(itensvendidos.IDProduto),
    -> SUM(QtdeVendida),
    -> SUM(QtdeVendida * PrecoUnitario) AS TotalGeral
    -> FROM itensvendidos INNER JOIN produtos
    -> ON itensvendidos.IDProduto = produtos.IDProduto
    -> GROUP BY IDVenda
    -> ORDER BY IDVenda;

SELECT * FROM vendas;

SELECT vendas.IDVenda,
    -> vendas.DataVenda,
    -> clientes.NomeCliente,
    -> SUM(itensvendidos.QtdeVendida * produtos.PrecoUnitario) AS Total
    -> FROM clientes INNER JOIN (vendas
    -> INNER JOIN (itensvendidos
    -> INNER JOIN produtos
    -> ON produtos.IDProduto=itensvendidos.IDProduto)
    -> ON itensvendidos.IDVenda=vendas.IDVenda)
    -> ON vendas.IDCliente=clientes.IDCliente
    -> GROUP BY itensvendidos.IDVenda
    -> ORDER BY vendas.IDVenda;

SELECT vendas.IDVenda,
    -> vendas.DataVenda,
    -> clientes.NomeCliente,
    -> SUM(itensvendidos.QtdeVendida * produtos.PrecoUnitario) AS Total
    -> FROM clientes INNER JOIN vendas INNER JOIN itensvendidos INNER JOIN produtos
    -> ON itensvendidos.IDProduto = produtos.IDProduto
    -> ON vendas.IDVenda = itensvendidos.IDVenda
    -> ON clientes.IDCliente = vendas.IDCliente
    -> GROUP BY itensvendidos.IDVenda
    -> ORDER BY vendas.IDVenda;