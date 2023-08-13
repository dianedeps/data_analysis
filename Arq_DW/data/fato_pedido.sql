USE arq_dw;

CREATE TABLE FatoPedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    data_pedido DATE,
    valor_total_pedido DECIMAL(10, 2),
    quantidade_total_itens INT,
    cliente_id INT,
    vendedor_id INT,
    empresa_entregadora_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor(id),
    FOREIGN KEY (empresa_entregadora_id) REFERENCES EmpresaEntregadora(id)
);

INSERT INTO FatoPedido (pedido_id, data_pedido, valor_total_pedido, quantidade_total_itens, cliente_id, vendedor_id, empresa_entregadora_id)
SELECT 
    p.id AS pedido_id,
    p.data_pedido,
    (
        SELECT SUM(ip.quantidade * pr.preco)
        FROM ItemPedido ip
        JOIN Produto pr ON ip.produto_id = pr.id
        WHERE ip.pedido_id = p.id
    ) AS valor_total_pedido,
    (
        SELECT SUM(quantidade)
        FROM ItemPedido
        WHERE pedido_id = p.id
    ) AS quantidade_total_itens,
    p.cliente_id,
    p.vendedor_id,
    (
        SELECT ee.id
        FROM Entrega e
        JOIN Pedido pe ON e.pedido_id = pe.id
        JOIN EmpresaEntregadora ee ON e.empresa_entregadora_id = ee.id
        WHERE pe.id = p.id
    ) AS empresa_entregadora_id
FROM Pedido p;