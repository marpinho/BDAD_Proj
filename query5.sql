-- Obter todos os clientes que foram só aos carrosséis. (E o nome dos carrosséis) 
SELECT Nome, NomeDeServico
FROM Pessoas, Servicos, Visitas
WHERE IDcliente NOT IN 
(
    SELECT
    IDcliente
    FROM
    Visitas, Lojas, Restaurantes, Eventos
    WHERE
    Visitas.ServiceID  = Lojas.StoreServiceID
    OR
    Visitas.ServiceID = Restaurantes.RestaurantServiceID
    OR
    Visitas.ServiceID = Eventos.EventServiceID
)
AND
Pessoas.ID = Visitas.IDcliente
AND
Visitas.ServiceID = Servicos.ServiceID;