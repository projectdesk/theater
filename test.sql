show tables;

insert into movie values(default,'a123456789','반지의제왕','졸라잼있음',20161111,'판타지','스티븐','12세관람과');

insert into theater values(default,'강남점',
	'1234','강남대로 123-11 2층','02-1234-5678'
);

insert into theater values(default,'잠실점',
	'1234','잠실로 123-11 2층','02-1234-5678'
);

insert into kmoon.theater values(default,'종로점',
	'1234','종각로 123-11 2층','02-1234-5678'
);

insert into movie_in_theater value(1,'반지의제왕');
insert into movie_in_theater value(1,'해리포터');
insert into movie_in_theater value(1,'엘리스');

insert into theater_room values(default,1,'1관',100);
insert into theater_room values(default,1,'2관',200);
insert into theater_room values(default,1,'3관',300);

insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),100,1);
 insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),100,2);
 insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),100,3);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),100,1);
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),100,2);
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),100,3);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),100,1);
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),100,2);
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),100,3);
 
insert into viewing_time values(default,
(select serial from movie where title='반지의제왕'),
'반지의제왕3',
200,
1,
(select theater_no from theater_room where room_idx=1))

insert into date_time values(default,20161111,123000,1);
 
select * from theater;
select * from theater_room;
