USE persianas;

DELIMITER $$

CREATE TRIGGER gerar_id_cliente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    SET NEW.id_cliente = CONCAT(
        'C',
        LPAD(
            COALESCE(
                (SELECT MAX(CAST(SUBSTRING(id_cliente, 2) AS UNSIGNED))
                 FROM clientes),
                0
            ) + 1,
            3,
            '0'
        )
    );
END$$


CREATE TRIGGER gerar_id_estoque
BEFORE INSERT ON estoque
FOR EACH ROW
BEGIN
    SET NEW.id_estoque = CONCAT(
        'E',
        LPAD(
            COALESCE(
                (SELECT MAX(CAST(SUBSTRING(id_estoque, 2) AS UNSIGNED))
                 FROM estoque),
                0
            ) + 1,
            3,
            '0'
        )
    );
END$$


CREATE TRIGGER gerar_id_venda
BEFORE INSERT ON vendas
FOR EACH ROW
BEGIN
    SET NEW.id_venda = CONCAT(
        'V',
        LPAD(
            COALESCE(
                (SELECT MAX(CAST(SUBSTRING(id_venda, 2) AS UNSIGNED))
                 FROM vendas),
                0
            ) + 1,
            3,
            '0'
        )
    );
END$$


DELIMITER ;