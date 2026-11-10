-- 1. Создание ролей
CREATE ROLE bank_manager LOGIN PASSWORD 'manager_pass';
CREATE ROLE agro_analyst LOGIN PASSWORD 'analyst_pass';

-- 2. Отзыв прав у PUBLIC 
REVOKE ALL ON DATABASE demo FROM PUBLIC;
REVOKE ALL ON SCHEMA bookings FROM PUBLIC;

-- 3. Выдача прав на подключение и использование схемы
GRANT CONNECT ON DATABASE demo TO bank_manager, agro_analyst;
GRANT USAGE ON SCHEMA bookings TO bank_manager, agro_analyst;

-- 4. Права для bank_manager 
GRANT SELECT ON bookings.tickets TO bank_manager;

-- 5. Права для agro_analyst 
GRANT SELECT (ticket_no, book_ref, passenger_id) ON bookings.tickets TO agro_analyst;