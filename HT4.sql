use vk;

select distinct firstname from users
where is_deleted = 0
order by firstname;

update users set is_deleted = 1
limit 5;

update messages set to_user_id = RAND()*(20-1)+1
where to_user_id = from_user_id;

select * from messages where to_user_id = from_user_id;

