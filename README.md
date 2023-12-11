## Моделирование данных в Хранилище (с использованием Data Vault и dbt)

1. Постройте витрину данных над Data Vault
* Динамика изменения количества заказов в разрезе календарной недели и статуса заказа

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/14ebd31f-26ca-4e63-9fd5-342f33801c86)

2. Покажите изменения атрибутного состава клиентов
* Постройте представление Point-in-time table которое покажет актуальные атрибуты клиента (first name, last name, email) на заданный момент времени.

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/23381ef3-2289-4960-9b96-bda7da4f0b28)

3. Имитируйте добавление нового источника данных о клиентах
* Добавьте данные из нового файла в Hub customer

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/bcc2d756-984b-422a-893a-6cfa2615390e)

* Добавьте новые атрибуты в отдельный Satellite

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/db77d658-8b63-4e00-bf29-06f1e99a48ed)

* Обновите представление Point-in-time table которое покажет все актуальные атрибуты клиента (first name, last name, email, country, age) 

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/74780812-48f4-4d0b-8be9-9c7212528681)

* Покажите, как данные отражаются в Хабе и Сателлите

![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/6c0cbb59-5bca-4fba-80bd-a66e1a73f7f6)


![image](https://github.com/savadevel/jaffle_shop_dbtvault/assets/69199994/4553af80-b26b-4701-8dfc-9be24d2d9918)


