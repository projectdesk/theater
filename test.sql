show tables;
insert into movie values(default,'����������','����������',now(),'��Ÿ��','��Ʈ��','12��')

insert into theater values(default,'������',
	'1234','������� 123-11 2��','02-1234-5678'
);

insert into theater values(default,'�����',
	'1234','��Ƿ� 123-11 2��','02-1234-5678'
);

insert into kmoon.theater values(default,'������',
	'1234','������ 123-11 2��','02-1234-5678'
);

insert into theater_room values(default,(select no from theater
 where theater_name='������'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),3,100);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='�����'),3,100);
 
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),1,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),2,100);
 insert into theater_room values(default,(select no from theater
 where theater_name='������'),3,100);
 
insert into viewing_time values(default,1,1,'����������',20,100);
 
select * from theater;
select * from theater_room;
