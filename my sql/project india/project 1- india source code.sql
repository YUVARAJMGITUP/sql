create database india;
use india;
drop database india;

select * from indian_states;
select * from state_symbols;
select * from state_sectors;

desc indian_details;
desc state_symbols;
desc state_sectors;

/* this first table */

create table indian_states(id int auto_increment,state varchar(55),capital varchar(55),languages varchar(55),chief_minister varchar(55),governor varchar(55),
primary key(id));
insert into indian_states(state,capital,languages,chief_minister,governor) values
("tamil nadu","chennai","tamil","mk stalin","rn ravi"),
("maharahtra","mumbai","marathi","eknathnshinde","bhagat singh koshyari"),
("uttra pradesh","lucknow","hindi","yogi aditiyanath","anandiben petel"),
("gujarat","gandhinagar","gujarati","bhupendrabhai patel","acharya devvrat"),
("karnataka","bangalore","kannada","basavaraj sommappa bommai","thawar chand geholt"),
("west bengal","kolkata","bengali","mamata banerjee","cv ananda bose"),
("rajasthan","jaipur","rajasthani","ashok gehlot","kalraj mishra"),
("andhra pradesh","amarvati","telugu","ys jagan mohan reddy","biswabhusan harichandan"),
("telangana","hydrabath","telungu","k chandrashekar rao","tamilisai soundarajan"),
("kerla","thiruvanadhapurami","malayalam","pinarayi vijayan","arif mohammad khon");
select * from indian_states;

/* this second table */

create table state_symbols(id int auto_increment,state_no int, animals varchar(55),birds varchar(66),trees varchar(66),flowers varchar(55),sdate date, key(state_no),
foreign key(id) references indian_states(id));

insert into state_symbols(state_no,animals,birds,trees,flowers,sdate) values
(1,"tiger","falcon","coconut","lily","2001-11-08"),
(2,"dog","crows","ginkgo","daisy","2015-12-09"),
(3,"lion","owls","coast","rose","2019-08-12"),
(6,"horse","bluebird","neem","tulip","2021-10-12"),
(8,"cat","falcon","papaya","iris","2022-11-03"),
(9,"tiger","crows","banyan","lotus","2012-02-11"),
(10,"lion","owls","baylaurel","jasmine","2001-05-11"),
(11,"cat","chicken","pistachio","peony","2005-12-07"),
(12,"horse","parrots","ginkgo","rose","2003-11-08"),
(13,"lion","blueray","coconut","jasmine","2002-11-10");
select * from state_symbols;

/* this third table */
drop table state_sectors;
create table state_sectors(id int auto_increment,state_regno int,trains varchar(55),flaights varchar(66),banks varchar(66),
gst_percentage int,primary key(state_regno),
foreign key(id) references indian_states(id));
insert into state_sectors (state_regno,trains,flaights,banks,gst_percentage) values
(1,"brindhavan express","indigo","iob",65),
(2,"mumbai express","air india","icici bank",89),
(4,"nellai express","spice jet","axis bank",89),
(6,"bagmati express","go first","hdfc bank",34),
(7,"kochuveli","tru jet","sbi",32),
(10,"andaman express","air india","iob",45),
(15,"kovai express","go first","indian bank",76),
(18,"chennai express","vistara","union bank",43),
(20,"kovai express","airasia india","bank of india",45),
(5,"chennai express","alliance air","cbi",98); 
select * from state_sectors; 

/* commands */

drop table indian_states;
drop table state_symbols;
drop table state_sectors;

update state_sectors set gst_percentage = 78 where id=1;

delete from state_sectors where state_regno =1;
/*joins -------------------------------- * --------------------------------------- */

select * from indian_states left join state_symbols on indian_states.id=state_symbols.state_no ;
select * from indian_states right join state_symbols on indian_states.id=state_symbols.state_no ;

select * from indian_states left join state_symbols on indian_states.id=state_symbols.state_no
union
select * from indian_states right join state_symbols on indian_states.id=state_symbols.state_no ;

select indian_states.id,indian_states.state,indian_states.languages,state_symbols.animals from indian_states 
inner join state_symbols on indian_states.id = state_symbols.state_no;

select  indian_states.id,indian_states.state,indian_states.chief_minister,state_symbols.bird,
state_symbols.tree,state_sectors.train,state_sectors.bank from 
((indian_states inner join state_symbols on indian_states.id=state_symbols.state_no) 
inner join state_sectors on indian_states.id=state_sectors.state_regno);

select * from indian_states where state="Tamil nadu"; 
select * from indian_states where not state="Tamil nadu";

select * from indian_states order by state,chief_minister,languages desc;
select state,concat(chief_minister," - ",governor) from indian_states order by id;

select count(id) from state_sectors;
select max(gst_percentage) from state_sectors ;
select min(gst_percentage) from state_sectors ;
select avg(gst_percentage)from state_sectors ;
select sum(gst_percentage) from state_sectors ;


select * from indian_states where chief_minister like "m%";
select *  from indian_states where languages like "%a";
select *  from indian_states where state like "_a%";
select *  from indian_states where languages like "%t___l";
select *  from indian_states where chief_minister like "%mk%";
select *  from indian_states where capital  like "che_nai%";


select * from  state_sectors  order by gst_percentage  desc limit 5;
select * from state_sectors  having gst_percentage >65 and gst_percentage <89  limit 5;


select * from indian_states where state="Tamil nadu" and capital="chennai";
select * from indian_states where state="Tamil nadu" or state="kerla";
select * from indian_states where not state="Tamil nadu" ;

select distinct train from state_sectors;

select birds as state_bird from state_symbols;
select concat(birds , " ," ,trees) as animals from state_symbols;

select * from state_symbols where birds in("crows","owls"); 
select * from state_symbols where birds not in("crows","owls"); 













