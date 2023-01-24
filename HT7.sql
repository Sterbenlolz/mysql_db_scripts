use vk;

-- 1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

update friend_requests set status = 'approved';

update friend_requests set target_user_id = target_user_id + 1
where target_user_id = initiator_user_id;


select * from users
join messages on users.id = messages.from_user_id;

select u.id, concat(u.firstname, ' ', u.lastname) as 'name', count(*) as cnt from users u
join messages m on u.id = m.from_user_id and m.to_user_id = 9
join friend_requests fr on u.id = fr.initiator_user_id and fr.target_user_id = 9 and fr.status = 'approved'
group by u.id
order by cnt desc
limit 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.

select count(*) as cnt from likes l
join media m on m.id = l.media_id
join profiles p on timestampdiff(year, p.birthday, now()) < 11 and p.user_id = m.user_id;

-- 3. 

select p.gender, count(*) as cnt from profiles p
join likes l on l.user_id = p.user_id
group by gender;
