WITH 
    tb_vendas_cep AS (
        SELECT 
            1 AS mes,
            v.*, 
            c.estado, 
            c.regiao
        FROM Vendas_1 AS v
        LEFT JOIN Cep AS c
            ON v.cep = c.cep

        UNION

        SELECT 
            2 AS mes,
            v.*, 
            c.estado, 
            c.regiao
        FROM Vendas_2 AS v
        LEFT JOIN Cep AS c
            ON v.cep = c.cep

        UNION

        SELECT 
            3 AS mes,
            v.*, 
            c.estado, 
            c.regiao
        FROM Vendas_3 AS v
        LEFT JOIN Cep AS c
            ON v.cep = c.cep
    )

SELECT
    mes, 
    regiao, estado,
    categoria, subcategoria,
    COUNT(DISTINCT _id_$oid) AS qtde_vendas,
    SUM(meses_1_rs_sellin_value) AS sell_in_total,
    SUM(meses_1_rs_sellout_value) AS sell_out_total,
    SUM(meses_1_rs_sellout_value) - SUM(meses_1_rs_sellin_value) AS diff_sell_out_sell_in
FROM tb_vendas_cep
GROUP BY mes, regiao, estado, categoria, subcategoria
ORDER BY mes, regiao, diff_sell_out_sell_in DESC