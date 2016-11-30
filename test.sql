show tables;
insert into movie values(default,'반지의제왕','졸라잼있음',now(),'판타지','스트븐','12세')

insert into theater values(default,'강남점',
	'1234','강남대로 123-11 2층','02-1234-5678'
);

insert into theater values(default,'잠실점',
	'1234','잠실로 123-11 2층','02-1234-5678'
);

insert into kmoon.theater values(default,'종로점',
	'1234','종각로 123-11 2층','02-1234-5678'
);

insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='종로점'),3,100);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='잠실점'),3,100);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='강남점'),3,100);
 
insert into viewing_time values(default,1,1,'반지의제왕',20,100);
 
select * from theater;
select * from theater_room;
