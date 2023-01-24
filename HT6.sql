use vk;

update messages set created_at = now() + 1000
where id = 43;

delete from messages where created_at > NOW();

SELECT from_user_id, (select concat(firstname, ' ', lastname) from users
where id = messages.from_user_id) as name, count(*) as cnt
from messages 
WHERE to_user_id = 9
group by from_user_id 
order by cnt desc
limit 1;

select count(*) as cnt from likes 
where user_id in (select user_id from profiles 
where timestampdiff(year, birthday, now()) < 11);

select count(*) as cnt from likes where media_id in(
select id from media where user_id in (
select user_id from profiles where timestampdiff(year, birthday, now()) < 11));


select gender, count(*) from (
select user_id as user, (select gender from profiles
where user_id = user) as gender from likes) as dummy
group by gender;

update profiles set gender = 'm'
where user_id in (8, 9, 12);
