USE arq_dw;

-- FEATURES TEMPORAIS

-- Mês do Pedido
ALTER TABLE FatoPedido ADD COLUMN mes_pedido INT;
UPDATE FatoPedido SET mes_pedido = MONTH(data_pedido);

-- Semana do ano
ALTER TABLE FatoPedido ADD COLUMN semana_do_ano INT;
UPDATE FatoPedido SET semana_do_ano = EXTRACT(WEEK FROM data_pedido);


-- FEATURES VALORES TOTAIS

-- Média de Valor Total por Cliente
ALTER TABLE FatoPedido ADD COLUMN media_valor_total_por_cliente DECIMAL(10, 2);
UPDATE FatoPedido AS fp
JOIN (
    SELECT cliente_id, AVG(valor_total_pedido) AS media_cliente
    FROM FatoPedido
    GROUP BY cliente_id
) AS media_cliente ON fp.cliente_id = media_cliente.cliente_id
SET fp.media_valor_total_por_cliente = media_cliente.media_cliente;

-- Média de Valor Total por Vendedor
ALTER TABLE FatoPedido ADD COLUMN media_valor_total_por_vendedor DECIMAL(10, 2);
UPDATE FatoPedido AS fp
JOIN (
    SELECT vendedor_id, AVG(valor_total_pedido) AS media_vendedor
    FROM FatoPedido
    GROUP BY vendedor_id
) AS media_vendedor ON fp.vendedor_id = media_vendedor.vendedor_id
SET fp.media_valor_total_por_vendedor = media_vendedor.media_vendedor;

