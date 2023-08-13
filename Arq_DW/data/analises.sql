USE arq_dw;

-- Número de ordens por dia
SELECT data_pedido, COUNT(*) AS numero_ordens
FROM FatoPedido
GROUP BY data_pedido
ORDER BY data_pedido;

-- Número de ordens por semana
SELECT semana_do_ano, COUNT(*) AS numero_ordens
FROM FatoPedido
GROUP BY semana_do_ano
ORDER BY semana_do_ano;

-- Número de ordens por mês
SELECT mes_pedido, COUNT(*) AS numero_ordens
FROM FatoPedido
GROUP BY mes_pedido
ORDER BY mes_pedido;

-- Análise de Valores por Cliente
SELECT 
    cliente_id,
    COUNT(DISTINCT pedido_id) AS numero_pedidos_por_cliente,
    SUM(valor_total_pedido) AS total_valor_por_cliente,
    MIN(valor_total_pedido) AS valor_minimo_pedido_por_cliente,
    AVG(valor_total_pedido) AS media_valor_por_cliente,    
    MAX(valor_total_pedido) AS valor_maximo_pedido_por_cliente,
    CASE
        WHEN AVG(valor_total_pedido) >= 2000 THEN 'Cliente de Alto Valor'
        WHEN AVG(valor_total_pedido) >= 500 AND AVG(valor_total_pedido) < 2000 THEN 'Cliente de Valor Médio'
        ELSE 'Cliente de Baixo Valor'
    END AS segmento
FROM FatoPedido
GROUP BY cliente_id
ORDER BY media_valor_por_cliente DESC, segmento;

-- Análise de Valores por Vendedor
SELECT 
    vendedor_id,
    COUNT(DISTINCT pedido_id) AS numero_pedidos_por_vendedor,
    SUM(valor_total_pedido) AS total_vendas_por_vendedor,
    AVG(valor_total_pedido) AS media_valor_por_vendedor,
FROM FatoPedido
GROUP BY vendedor_id
ORDER BY media_valor_por_vendedor DESC;

-- Performance de Vendas por Vendedor ao longo do tempo
SELECT 
    vendedor_id, ano, mes, total_vendas_mes,
    total_vendas_mes - LAG(total_vendas_mes) OVER (PARTITION BY vendedor_id ORDER BY ano, mes) AS diferenca_vendas_mes_anterior
FROM (
    SELECT 
        vendedor_id,
        YEAR(data_pedido) AS ano,
        MONTH(data_pedido) AS mes,
        SUM(valor_total_pedido) AS total_vendas_mes
    FROM FatoPedido
    GROUP BY vendedor_id, YEAR(data_pedido), MONTH(data_pedido)
) AS vendas_por_mes
ORDER BY vendedor_id, ano, mes;
