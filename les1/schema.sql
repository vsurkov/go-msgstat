-- schema.sql
-- Кратко (не более 10 предложений) описать суть проекта и основной use-case в файле schema.sql (описывать как sql комментарий в начале файла).
-- 
-- Суть проекта:
-- Приложение для хранения статистической информации по отправляемым сообщениям (sms, push), информации по отправке, доставке, операторам связи использованным для доставки sms-сообщений. 
-- Учет затрат, ввод данных по фактическим затратам (на основе счетов от контрагентов), бюджетирование и прогнозирование расходов. Статистика и тренды.
-- Текущая структура предполагает что
--  - мы заполняем различные источники (системы) сообщений, для того бы считать по источникам
--  - мы заполняем различные ресурсы назначения (операторы связи или агрегаторы) для сообщений, для того бы считать по затратам.

	DROP TABLE IF EXISTS sources;
	DROP TABLE IF EXISTS senders;
	DROP TABLE IF EXISTS messages;


	CREATE TABLE IF NOT EXISTS sources (
		id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
		name VARCHAR(200) NOT NULL UNIQUE,
		description VARCHAR(1000) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS senders (
		id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
		name VARCHAR(200) NOT NULL UNIQUE,
		description VARCHAR(1000) NOT NULL
	);

	CREATE TABLE IF NOT EXISTS messages (
		id INT GENERATED ALWAYS AS IDENTITY,
		day DATE,
		source INT NOT NULL,
		sender INT NOT NULL,
		success INT,
		failed INT,
		fail_safe INT,
		FOREIGN KEY (source) REFERENCES sources(id),
		FOREIGN KEY (sender) REFERENCES senders(id)
	);

