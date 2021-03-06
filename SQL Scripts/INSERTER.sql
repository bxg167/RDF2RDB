use Test
delete from dbo.Taken
delete from dbo.Student
delete from dbo.Classes
go

use Test
insert into dbo.Classes(Cid,Subject,[Number]) values(15643,N'EECS',208)
insert into dbo.Classes(Cid,Subject,[Number]) values(10920,N'CHEM',161)
insert into dbo.Classes(Cid,Subject,[Number]) values(13048,N'MATH',299)
insert into dbo.Classes(Cid,Subject,[Number]) values(10630,N'USSY',248)
insert into dbo.Classes(Cid,Subject,[Number]) values(17789,N'BIO',279)
insert into dbo.Classes(Cid,Subject,[Number]) values(12186,N'EECS',316)
insert into dbo.Classes(Cid,Subject,[Number]) values(19414,N'EECS',421)
insert into dbo.Classes(Cid,Subject,[Number]) values(18203,N'PHYS',199)
insert into dbo.Classes(Cid,Subject,[Number]) values(15991,N'USSO',217)
insert into dbo.Classes(Cid,Subject,[Number]) values(19818,N'ECON',120)
insert into dbo.Classes(Cid,Subject,[Number]) values(19540,N'ENGR',335)
insert into dbo.Classes(Cid,Subject,[Number]) values(15033,N'BIO',290)
insert into dbo.Classes(Cid,Subject,[Number]) values(14677,N'PHED',391)
insert into dbo.Classes(Cid,Subject,[Number]) values(12083,N'CHEM',336)
insert into dbo.Classes(Cid,Subject,[Number]) values(14363,N'CHEM',405)
insert into dbo.Classes(Cid,Subject,[Number]) values(12587,N'MATH',282)
insert into dbo.Classes(Cid,Subject,[Number]) values(10102,N'CHEM',377)
insert into dbo.Classes(Cid,Subject,[Number]) values(19984,N'MATH',172)
insert into dbo.Classes(Cid,Subject,[Number]) values(16882,N'BIO',367)
insert into dbo.Classes(Cid,Subject,[Number]) values(15816,N'BIO',428)
insert into dbo.Classes(Cid,Subject,[Number]) values(13456,N'BIO',436)
insert into dbo.Classes(Cid,Subject,[Number]) values(14272,N'STAT',295)
insert into dbo.Classes(Cid,Subject,[Number]) values(11644,N'USSY',471)
insert into dbo.Classes(Cid,Subject,[Number]) values(14316,N'PHED',195)
insert into dbo.Classes(Cid,Subject,[Number]) values(18793,N'USSN',437)
insert into dbo.Classes(Cid,Subject,[Number]) values(15196,N'PHED',222)
insert into dbo.Classes(Cid,Subject,[Number]) values(14540,N'BIO',440)
insert into dbo.Classes(Cid,Subject,[Number]) values(17104,N'EECS',163)
insert into dbo.Classes(Cid,Subject,[Number]) values(14286,N'USSN',136)
insert into dbo.Classes(Cid,Subject,[Number]) values(19630,N'MATH',226)
insert into dbo.Classes(Cid,Subject,[Number]) values(10954,N'PHYS',486)
insert into dbo.Classes(Cid,Subject,[Number]) values(16363,N'ENGR',125)
insert into dbo.Classes(Cid,Subject,[Number]) values(16339,N'EECS',323)
insert into dbo.Classes(Cid,Subject,[Number]) values(14975,N'PHED',473)
insert into dbo.Classes(Cid,Subject,[Number]) values(12880,N'CHEM',442)
insert into dbo.Classes(Cid,Subject,[Number]) values(19117,N'ECON',269)
insert into dbo.Classes(Cid,Subject,[Number]) values(13146,N'USSO',412)
insert into dbo.Classes(Cid,Subject,[Number]) values(19092,N'PHYS',454)
insert into dbo.Classes(Cid,Subject,[Number]) values(10501,N'CHEM',245)
insert into dbo.Classes(Cid,Subject,[Number]) values(17234,N'BIO',134)
insert into dbo.Classes(Cid,Subject,[Number]) values(15920,N'MATH',278)
insert into dbo.Classes(Cid,Subject,[Number]) values(10163,N'EECS',104)
insert into dbo.Classes(Cid,Subject,[Number]) values(18930,N'USSO',364)
insert into dbo.Classes(Cid,Subject,[Number]) values(11079,N'ENGR',390)
insert into dbo.Classes(Cid,Subject,[Number]) values(15447,N'STAT',228)
insert into dbo.Classes(Cid,Subject,[Number]) values(14291,N'BIO',311)
insert into dbo.Classes(Cid,Subject,[Number]) values(14531,N'ENGR',316)
insert into dbo.Classes(Cid,Subject,[Number]) values(19336,N'ENGR',307)
insert into dbo.Classes(Cid,Subject,[Number]) values(11719,N'USSO',419)
insert into dbo.Classes(Cid,Subject,[Number]) values(10230,N'USSN',345)
go

insert into dbo.Student(Sid,Name,Addr) values(9943,N'Berta',N'West 50th Avenue')
insert into dbo.Student(Sid,Name,Addr) values(9908,N'Clotilde',N'Longriggend Road')
insert into dbo.Student(Sid,Name,Addr) values(6716,N'Marybeth',N'Jedburgh PIace')
insert into dbo.Student(Sid,Name,Addr) values(580,N'Bryanna',N'Petersburg Street')
insert into dbo.Student(Sid,Name,Addr) values(2124,N'Shawnta',N'Barbegs Crescent')
insert into dbo.Student(Sid,Name,Addr) values(9922,N'June',N'AIexander Avenue')
insert into dbo.Student(Sid,Name,Addr) values(8703,N'Shaunta',N'Frolick Wind Road South')
insert into dbo.Student(Sid,Name,Addr) values(517,N'Delora',N'Capstan Court')
insert into dbo.Student(Sid,Name,Addr) values(3068,N'Daphine',N'Admiralty Place')
insert into dbo.Student(Sid,Name,Addr) values(2547,N'Lorine',N'Tinto Court')
insert into dbo.Student(Sid,Name,Addr) values(5439,N'Adaline',N'Hace Street')
insert into dbo.Student(Sid,Name,Addr) values(2135,N'Dulce',N'Church Crescent')
insert into dbo.Student(Sid,Name,Addr) values(3925,N'Rosia',N'Schuss Drive')
insert into dbo.Student(Sid,Name,Addr) values(2536,N'Charolett',N'Joy Avenue')
insert into dbo.Student(Sid,Name,Addr) values(9473,N'Min',N'Davis Place')
insert into dbo.Student(Sid,Name,Addr) values(7466,N'Malika',N'Anderson Street')
insert into dbo.Student(Sid,Name,Addr) values(6982,N'Lashell',N'Braeside Gardens')
insert into dbo.Student(Sid,Name,Addr) values(84,N'Coleman',N'Passage Way')
insert into dbo.Student(Sid,Name,Addr) values(1968,N'Caryn',N'Rhu Quadrant')
insert into dbo.Student(Sid,Name,Addr) values(1272,N'Angla',N'Lilac Hill')
insert into dbo.Student(Sid,Name,Addr) values(9888,N'Raymon',N'Pirnie PIace')
insert into dbo.Student(Sid,Name,Addr) values(9851,N'Lino',N'Borland Drive')
insert into dbo.Student(Sid,Name,Addr) values(8423,N'Milissa',N'Balbakie Road')
insert into dbo.Student(Sid,Name,Addr) values(9455,N'Crysta',N'Tamarack Crescent')
insert into dbo.Student(Sid,Name,Addr) values(2521,N'Jerlene',N'East 57th Circle')
insert into dbo.Student(Sid,Name,Addr) values(3044,N'Reggie',N'Jodhpur Street')
insert into dbo.Student(Sid,Name,Addr) values(3049,N'Jacquline',N'Anderson Avenue')
insert into dbo.Student(Sid,Name,Addr) values(4690,N'Lili',N'Lomond Way')
insert into dbo.Student(Sid,Name,Addr) values(7768,N'Aretha',N'Joseph Street')
insert into dbo.Student(Sid,Name,Addr) values(308,N'Gregoria',N'Tiros Avenue')
insert into dbo.Student(Sid,Name,Addr) values(5513,N'Shelley',N'Viscount Circle')
insert into dbo.Student(Sid,Name,Addr) values(900,N'Ciara',N'Ledora Circle')
insert into dbo.Student(Sid,Name,Addr) values(9421,N'Sharron',N'Bonasila Circle')
insert into dbo.Student(Sid,Name,Addr) values(5836,N'Harmony',N'Ailsa Avenue')
insert into dbo.Student(Sid,Name,Addr) values(3730,N'Bobbye',N'Garnkirk Lane')
insert into dbo.Student(Sid,Name,Addr) values(6966,N'Kasha',N'Alyeska Avenue')
insert into dbo.Student(Sid,Name,Addr) values(6683,N'Crystal',N'Twenty Grand Road')
insert into dbo.Student(Sid,Name,Addr) values(6911,N'Trista',N'Snowflower Loop')
insert into dbo.Student(Sid,Name,Addr) values(9749,N'Nelda',N'Boden Quadrant')
insert into dbo.Student(Sid,Name,Addr) values(7660,N'Jetta',N'Manse Avenue')
insert into dbo.Student(Sid,Name,Addr) values(4843,N'Crystal',N'Lammermoor Drive')
insert into dbo.Student(Sid,Name,Addr) values(7902,N'Keira',N'BurnhalI PIace')
insert into dbo.Student(Sid,Name,Addr) values(9756,N'Abel',N'Eide Street')
insert into dbo.Student(Sid,Name,Addr) values(8692,N'Tristan',N'Dane Court')
insert into dbo.Student(Sid,Name,Addr) values(7309,N'Viviana',N'Ettrick Court')
insert into dbo.Student(Sid,Name,Addr) values(1354,N'Karyl',N'Golf HilI Quadrant')
insert into dbo.Student(Sid,Name,Addr) values(6455,N'Patrica',N'Burnside Road')
insert into dbo.Student(Sid,Name,Addr) values(3166,N'Trista',N'BalmoraI Crescent')
insert into dbo.Student(Sid,Name,Addr) values(9115,N'Concha',N'Gemini Grove')
insert into dbo.Student(Sid,Name,Addr) values(5914,N'Randall',N'Fireball Street')
go

insert into dbo.Taken(Sid,Cid,Grade) values(3925,10163,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(9888,19336,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(6683,12083,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(3049,15643,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(9851,19540,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(2536,19818,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(9888,11644,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(3044,14272,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(2135,14286,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(9473,19117,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(9756,10163,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(308,15816,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(9922,17234,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(2547,18930,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(9943,14540,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(6911,10102,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(3166,12880,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(1354,18930,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(8703,11719,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(3730,18930,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(4843,15447,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(6982,15643,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(9749,19092,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(2521,15991,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(2536,12880,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(7660,16339,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(1354,16339,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(9115,19092,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(8692,10230,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(5513,19092,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(9922,10954,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(3730,10230,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(9851,15447,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(9455,14272,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(900,12880,N'B')
insert into dbo.Taken(Sid,Cid,Grade) values(7309,14272,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(2547,19630,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(8423,15816,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(3049,11719,N'D')
insert into dbo.Taken(Sid,Cid,Grade) values(1968,17104,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(9851,10501,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(6982,13048,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(2536,15816,N'A')
insert into dbo.Taken(Sid,Cid,Grade) values(2536,10163,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(308,11079,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(6966,10163,N'C')
insert into dbo.Taken(Sid,Cid,Grade) values(7660,17234,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(1272,14316,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(9851,11079,N'F')
insert into dbo.Taken(Sid,Cid,Grade) values(8703,17104,N'F')
go