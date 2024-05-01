/*
https://www.programiz.com/sql/online-compiler/
*/

-- Cliente de mayor edad

select max(age) from customers;

select * 
from customers
where age = (select max(age) from customers);


/*
Los pedidos de cada cliente
*/

select c.customer_id, c.first_name, o.order_id, o.amount
from customers c
join orders o on c.customer_id = o.customer_id
order by 1;



/*
Cantidad de pedidos de cada cliente y el importe respectivo.
*/

/* Caso 2 */

select 
	customer_id, 
    count(order_id) pedidos,
    sum(amount) importe
from orders
group by customer_id;


/* Caso 1 */

select 
	c.customer_id, c.first_name, c.last_name,
    count(o.order_id) pedidos,
    sum(o.amount) importe
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.first_name, c.last_name;




