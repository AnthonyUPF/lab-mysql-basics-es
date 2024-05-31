use bank;

show tables;

-- Consulta 1
-- Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.

select  client_id
from client
where district_id = 1
limit 5;

-- Consulta 2
-- En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.

select  client_id
from client
where district_id = 72
order by client_id desc
limit 1;

-- Consulta 3
-- Obtén las 3 cantidades más bajas en la tabla loan.

select amount
from loan
order by amount asc
limit 3;

-- Consulta 4
-- ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?

select status
from loan
group by status
order by status asc;

-- Consulta 5
-- ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?

select loan_id
from loan
order by payments desc
limit 1;

-- Consulta 6
-- ¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.

select account_id, amount
from loan
order by account_id asc
limit 5;

-- Consulta 7
-- ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?

SELECT account_id
FROM loan
WHERE duration = 60
GROUP BY account_id
ORDER BY min(amount) asc;

-- Consulta 8
-- ¿Cuáles son los valores únicos de k_symbol en la tabla order?

select distinct k_symbol 
from `order`;

-- Consulta 9
-- En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?

select order_id
from `order`
where account_id = 34;

-- Consulta 10
-- En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?

select account_id
from `order`
where order_id between 29540 and 29560
group by account_id;

-- Consulta 11
-- En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?

select amount
from `order`
where account_to = 30067122;

-- Consulta 12
-- En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas.

select trans_id, date, type, amount
from trans
where account_id = 793
order by date desc
limit 10;

-- Consulta 13
-- En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id? Muestra los resultados ordenados por district_id en orden ascendente.

select district_id, count(district_id) as num_clients
from client
where district_id < 10
group by district_id
order by district_id asc;

-- Consulta 14
-- En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.

select type, count(type) as num_cards
from card
group by type;

-- Query 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

select account_id, sum(amount) as total_amount
from loan
group by account_id
order by total_amount desc
limit 10;

-- Query 16
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

select date, count(date) as num_loans
from loan
where date < 930907
group by date
order by date desc;

-- Query 17
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

select date, duration, count(duration) as num_loans
from loan
where date >= 971201 and date < 980101
group by date, duration
order by date asc, duration asc
limit 14;

-- Query 18
-- In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.

select account_id, type, sum(amount) as total_amount
from trans
where account_id = 396
group by type;
