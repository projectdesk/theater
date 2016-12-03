show tables;

insert into movie values(default,'a123456789','����������','����������',20161111,'��Ÿ��','��Ƽ��','12��������');

insert into theater values(default,'강남점',
	'1234','강남구 123-11','02-1234-5678'
);

insert into theater values(default,'종로점',
	'1234','종로구 123-11','02-1234-5678'
);

insert into kmoon.theater values(default,'잠실점',
	'1234','잠실로 123-11','02-1234-5678'
);

insert into movie_in_theater value(1,'반지의제왕');
insert into movie_in_theater value(1,'해리포터');
insert into movie_in_theater value(1,'엘리스');

insert into theater_room values(default,1,'1��',100);
insert into theater_room values(default,1,'2��',200);
insert into theater_room values(default,1,'3��',300);

insert into theater_room values(default,(select idx from theater
 where theater_name='잠실점'),'1관',100);
insert into theater_room values(default,(select idx from theater
 where theater_name='잠실점'),'2관',200);
insert into theater_room values(default,(select idx from theater
 where theater_name='잠실점'),'3관',300);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),100,1);
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),100,2);
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),100,3);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),100,1);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),100,2);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),100,3);
 
insert into viewing_time values(default,
(select serial from movie where title='����������'),
'����������3',
200,
1,
(select theater_no from theater_room where room_idx=1))

insert into date_time values(default,20161111,123000,1);
 
select * from theater;
select * from theater_room;
