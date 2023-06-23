WITH 
    tb_vendas_cep AS (
        SELECT 
            v.*, 
            c.estado, 
            c.regiao
        FROM Vendas_1 AS v
        LEFT JOIN Cep AS c
            ON v.cep = c.cep
    ),

    tb_agg_filial AS (
        SELECT            
            regiao, estado,
            filial,
            COUNT(DISTINCT _id_$oid) AS qtde_vendas,
            SUM(meses_1_rs_sellin_value) AS sell_in_total,
            SUM(meses_1_rs_sellout_value) AS sell_out_total,
            SUM(meses_1_rs_sellout_value) - SUM(meses_1_rs_sellin_value) AS diff_sell_out_sell_in
        FROM tb_vendas_cep
        GROUP BY regiao, estado, filial
        ORDER BY diff_sell_out_sell_in DESC
    )

    SELECT * FROM tb_agg_filial