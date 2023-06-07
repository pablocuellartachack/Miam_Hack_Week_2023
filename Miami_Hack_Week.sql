create database Miami_HW;

select *
from Miami_HW.hackers;

create table Miami_HW.hackers (
	id int auto_increment PRIMARY KEY,
    username varchar(30) UNIQUE,
	email varchar(60) UNIQUE,
    first_name varchar(20),
    last_name varchar(30),
    hacker_tags varchar(10),
    github text,
    linkedin text,
    twitter text,
    website text,
    shirt_sz varchar(5),
    phone_number int UNIQUE,
    join_date date,
	house varchar(10) Default 'NA',
    applications text
);

drop table Miami_HW.hackers;

rename table 
Miami_HW.2023_hacker_info to Miami_HW.hacker_info_2023;

rename table 
Miami_HW.2022_hacker_info to Miami_HW.hacker_info_2022;

select *
from Miami_HW.hacker_info_2022;

select *
from Miami_HW.hacker_info_2023;

select id
from Miami_HW.hackers
where id = 1;

show columns from Miami_HW.hacker_info_2022;

alter table hacker_info_2022
rename column `role/name` to role_name;

alter table hacker_info_2022
rename column `role/id` to role_id;

alter table hacker_info_2022
rename column `role/description` to role_description;

alter table hacker_info_2022
rename column `role/type` to role_type;

alter table hacker_info_2022
rename column `house/id` to house_id;

alter table hacker_info_2022
rename column `house/name` to house_name;

alter table hacker_info_2022
rename column `house/tags/0` to house_tags_0;

alter table hacker_info_2022
rename column `house/tags/1` to house_tags_1;

alter table hacker_info_2022
rename column `house/tags/2` to house_tags_2;

alter table hacker_info_2022
rename column `house/sponsorName` to house_sponsor_name;

alter table hacker_info_2022
rename column `hackerTags/0` to hackers_tags_0;

alter table hacker_info_2022
rename column `hackerTags/1` to hackers_tags_1;

alter table hacker_info_2022
rename column `hackerTags/2` to hackers_tags_2;

alter table hacker_info_2022
rename column `hackerTags/3` to hackers_tags_3;

alter table hacker_info_2022
rename column hackerLocation to hacker_location;

alter table hacker_info_2022
rename column hackerJob to hacker_job;

select distinct role_name
from Miami_HW.hacker_info_2022;

select *
from Miami_HW.hacker_info_2022;

alter table hacker_info_2022
add primary key (id); 

select distinct hackerJob
from Miami_HW.hacker_info_2022
where hacker_job is not null
union all
select distinct house_name
from Miami_HW.hacker_info_2022 
where house_name is not null
union all
select distinct hackerLocation
from Miami_HW.hacker_info_2022
where hacker_location is not null;

select distinct house_name, hacker_job, count(*) as count
from Miami_HW.hacker_info_2022
where not (hacker_job is null or house_name is null)
group by house_name, hacker_job;

create table hacker_house_info_2022 (
	house_name varchar(50), 
    hacker_job varchar(50),
    combo_count int
    );
    
insert into Miami_HW.hacker_house_info_2022
select distinct house_name, hacker_job, count(*) as count
from Miami_HW.hacker_info_2022
where not (hacker_job is null or house_name is null)
group by house_name, hacker_job;

select *
from hacker_house_info_2022;

select distinct hacker_job, hacker_location, count(*) as count
from Miami_HW.hacker_info_2022
where not (hacker_job is null or hacker_location is null)
group by hacker_job, hacker_location;

select distinct hacker_location
from hacker_info_2022;

create table hacker_location_info_2022 (
	hacker_job varchar(50), 
    hacker_location varchar(50),
    combo_count int
    );
    
set SQL_SAFE_UPDATES = 0;

select cast("33414" as char(50))
from hacker_info_2022;

update hacker_info_2022
set hacker_location = replace(hacker_location, '33414', 'NA');
	
select cast("\\\\ud83c\\\\uddea\\\\ud83c\\\\uddf8" as char(50))
from hacker_info_2022;

update hacker_info_2022
set hacker_location = replace(hacker_location, '\\\\ud83c\\\\uddea\\\\ud83c\\\\uddf8', 'NA');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'Hong Kong but from Vancouver (moving back soon)', 'NA');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'Mexico City, MX (I was already flying to Miami on the 21st for business, so don\'t need a flight if that is offered)', 'Mexico City, MX');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'Los Angeles, CA and Miami, FL', 'Los Angeles, CA');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'Toledo, Paran\\\\341 - Brazil', 'Brazil');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'Miami, FL + New York, NY', 'Miami, FL');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'NYC but currently in Jupiter, Florida 1 hour from Miami', 'Miami, FL');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'azarbayejan.iran', 'Iran');

update hacker_info_2022
set hacker_location = replace(hacker_location, 'explotara! Fl USA', 'Miami, FL');

select distinct hacker_location
from hacker_info_2022;

drop table Miami_HW.hacker_location_info_2022;

create table hacker_location_info_2022 (
	hacker_job varchar(100), 
    hacker_location varchar(100),
    combo_count int
    );   

insert into Miami_HW.hacker_location_info_2022
select distinct hacker_job, hacker_location, count(*) as count
from Miami_HW.hacker_info_2022
where not (hacker_job is null or hacker_location is null)
group by hacker_job, hacker_location;

select *
from hacker_location_info_2022;

#test!

create table idea (
job varchar(50),
location varchar(50),
combowombo int
);

update idea 
set location=concat(location, ', United States');

insert into Miami_HW.idea
select *
from Miami_HW.hacker_location_info_2022
where hacker_location = 'Miami, FL';

select location,
	substr(location, 1, length(location) - length(substring_index(location, ',', -2))) city,
	substring_index(substring_index(location, ',', -2), ',', 1) state,
	substring_index(location, ' ', -2) country
 from idea;

select * 
from idea;

#change hacker_location_info_2022 to city, state, country (TEST);

select distinct hacker_location
from hacker_location_info_2022;

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fort Lauderdale, FL', 'Fort Lauderdale, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boca Raton, FL', 'Boca Raton, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Miami', 'Miami, Florida, United States');

#(below is to split city, state, and country)
select location,
	substr(location, 1, length(location) - length(substring_index(location, ',', -2))) city,
	substring_index(substring_index(location, ',', -2), ',', 1) state,
	substring_index(location, ' ', -2) country
 from idea;
 
 #done
 
select (case when hacker_location like '%Miami, Florida, United States%'
		then concat(substring_index(hacker_location, 'Miami, Florida, United States', 1), 'Miami, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Miami, Florida, United States%'
		then concat(substring_index(hacker_location, 'Miami, Florida, United States', 1), 'Miami, Florida, United States')
		else hacker_location end);
        
select distinct hacker_location
from hacker_location_info_2022;

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'new', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'New', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'NY', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'NYC', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'nyc', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manhattan, Manhattan', 'Manhattan, New York City, United States');


select (case when hacker_location like '%Manhattan, New York City, United States%'
		then concat(substring_index(hacker_location, 'Manhattan, New York City, United States', 1), 'Manhattan, New York City, United States')
		else hacker_location end)
from hacker_location_info_2022;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Manhattan, New York City, United States%'
		then concat(substring_index(hacker_location, 'Manhattan, New York City, United States', 1), 'Manhattan, New York City, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Agra', 'Agra, Uttar Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Alameda, California, United States Ca, USA', 'Alameda, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Alexandria, Virginia, United States, VA', 'Alexandria, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Altadena, California, United States, CA', 'Altadena, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Amaranth', 'Amaranth, Pennsylvania, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ames', 'Ames, Iowa, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Andover, MA 01810', 'Andover, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ann Arbor', 'Ann Arbor, Michigan, United States');

select (case when hacker_location like '%Ann Arbor, Michigan, United States%'
		then concat(substring_index(hacker_location, 'Ann Arbor, Michigan, United States', 1), 'Ann Arbor, Michigan, United States')
		else hacker_location end)
from hacker_location_info_2022;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Ann Arbor, Michigan, United States%'
		then concat(substring_index(hacker_location, 'Ann Arbor, Michigan, United States', 1), 'Ann Arbor, Michigan, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Annandale, VA', 'Annandale, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'ARLINGTON', 'Arlington, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Aruba', 'Oranjestad, Aruba');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Astoria, Manhattan, New York City, United States', 'Manhattan, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Arlington, VA', 'Arlington, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Athens', 'Athens, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Atherton', 'Atherton, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Atl', 'Atlanta, Georgia, United States');

select (case when hacker_location like '%Atlanta, Georgia, United States%'
		then concat(substring_index(hacker_location, 'Atlanta, Georgia, United States', 1), 'Atlanta, Georgia, United States')
		else hacker_location end)
from hacker_location_info_2022;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Atlanta, Georgia, United States%'
		then concat(substring_index(hacker_location, 'Atlanta, Georgia, United States', 1), 'Atlanta, Georgia, United States')
		else hacker_location end);
        
select (case when hacker_location like '%Athens, Georgia, United States%'
		then concat(substring_index(hacker_location, 'Athens, Georgia, United States', 1), 'Athens, Georgia, United States')
		else hacker_location end)
from hacker_location_info_2022;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Athens, Georgia, United States%'
		then concat(substring_index(hacker_location, 'Athens, Georgia, United States', 1), 'Athens, Georgia, United State')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Austin', 'Austin, Texas, United States');

select (case when hacker_location like '%Austin, Texas, United States%'
		then concat(substring_index(hacker_location, 'Austin, Texas, United States', 1), 'Austin, Texas, United States')
		else hacker_location end)
from hacker_location_info_2022
order by hacker_location;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Austin, Texas, United States%'
		then concat(substring_index(hacker_location, 'Austin, Texas, United States', 1), 'Austin, Texas, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Aventura', 'Aventura, Florida, United States');

select (case when hacker_location like '%Aventura, Florida, United States%'
		then concat(substring_index(hacker_location, 'Aventura, Florida, United States', 1), 'Aventura, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
order by hacker_location;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Aventura, Florida, United States%'
		then concat(substring_index(hacker_location, 'Aventura, Florida, United States', 1), 'Aventura, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Avon, Colorado, United States, CO', 'Avon, Colorado, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bainbridge Island', 'Bainbridge Island, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bal Harbour, Florida, USA', 'Bal Harbour, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Baltimore', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Baltimore, Maryland, United States, Maryland, United States', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bamberg, SC', 'Bamberg, South Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bangalore', 'Bengaluru, Karnataka, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bangkok', 'Bangkok, Thailand');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Barbados', 'Bridgetown, Barbados');

select (case when hacker_location like '%Bengaluru, Karnataka, India%'
		then concat(substring_index(hacker_location, 'Bengaluru, Karnataka, India', 1), 'Bengaluru, Karnataka, India')
		else hacker_location end)
from hacker_location_info_2022
order by hacker_location;
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Bengaluru, Karnataka, India%'
		then concat(substring_index(hacker_location, 'Bengaluru, Karnataka, India', 1), 'Bengaluru, Karnataka, India')
		else hacker_location end);
        
update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Barcelona', 'Barcelona, Spain');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Barueri', 'Barueri, Brazil');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Battersea', 'Battersea, London, UK');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bay area, California', 'San Francisco, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bay City, MI', 'Bay City, Michigan, United States');
#
update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Beachwood', 'Beachwood, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Belgium', 'Brussels, Belgium');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Belle Mead, Tennessee, United States, New Jersey, United States', 'Belle Mead, Tennessee, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bellingham', 'Bellingham, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Berkeley', 'Berkeley, California, United States');

select (case when hacker_location like '%Berkeley, California, United States%'
		then concat(substring_index(hacker_location, 'Berkeley, California, United States', 1), 'Berkeley, California, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Berkeley, California, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Berkeley, California, United States%'
		then concat(substring_index(hacker_location, 'Berkeley, California, United States', 1), 'Berkeley, California, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Berlin', 'Berlin, Germany');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bethany', 'Bethany, Oklahoma, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bethlehem, PA, United States', 'Bethlehem, Pennsylvania, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bikaner', 'Bikaner, Rajasthan, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Blacksburg', 'Blacksburg, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boca Raton', 'Boca Raton, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bogota, Colomba', 'Bogota, Colombia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boca Raton, Florida, United States, Florida, United States', 'Boca Raton, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Blacksburg, Virginia, United States, VA', 'Blacksburg, Virginia, United States');


select (case when hacker_location like '%Boca Raton, Florida, United States%'
		then concat(substring_index(hacker_location, 'Boca Raton, Florida, United States', 1), 'Boca Raton, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Boca Raton, Florida, United States';

update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Boca Raton, Florida, United States%'
		then concat(substring_index(hacker_location, 'Boca Raton, Florida, United States', 1), 'Boca Raton, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boston', 'Boston, Massachusetts, United States');

select (case when hacker_location like '%Boston, Massachusetts, United States%'
		then concat(substring_index(hacker_location, 'Boston, Massachusetts, United States', 1), 'Boston, Massachusetts, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Boston, Massachusetts, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Boston, Massachusetts, United States%'
		then concat(substring_index(hacker_location, 'Boston, Massachusetts, United States', 1), 'Boston, Massachusetts, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bowie', 'Bowie, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bournemouth', 'Bournemouth, UK');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boynton', 'Boynton Beach, Florida, United States');

select (case when hacker_location like '%Boynton Beach, Florida, United States%'
		then concat(substring_index(hacker_location, 'Boynton Beach, Florida, United States', 1), 'Boynton Beach, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Boynton Beach, Florida, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Boynton Beach, Florida, United States%'
		then concat(substring_index(hacker_location, 'Boynton Beach, Florida, United States', 1), 'Boynton Beach, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bozeman, MT', 'Bozeman, Montana, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bozeman,Mt', 'Bozeman, Montana, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brampton', 'Brampton, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brazil, Rio de Janeiro', 'Rio de Janeiro, Brazil');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brickell, FL', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bronx', 'Bronx, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brooklyn', 'Brooklyn, New York CIty, United States');

select (case when hacker_location like '%Bronx, New York City, United States%'
		then concat(substring_index(hacker_location, 'Bronx, New York City, United States', 1), 'Bronx, New York City, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Bronx, New York City, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Bronx, New York City, United States%'
		then concat(substring_index(hacker_location, 'Bronx, New York City, United States', 1), 'Bronx, New York City, United States')
		else hacker_location end);

select (case when hacker_location like '%Brooklyn, New York City, United States%'
		then concat(substring_index(hacker_location, 'Brooklyn, New York City, United States', 1), 'Brooklyn, New York City, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Brooklyn, New York City, United States';

update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Brooklyn, New York City, United States%'
		then concat(substring_index(hacker_location, 'Brooklyn, New York City, United States', 1), 'Brooklyn, New York City, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brooklyn, New York CIty, United States Manhattan, New York City, United States', 'Brooklyn, New York CIty, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brooklyn, New York CIty, United States', 'Brooklyn, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brooklyn, New York CIty, United States', 'Brooklyn, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Broward Countru', 'Deerfield, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Burlington, VT', 'Burlington, Vermont, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'CA', 'California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Calgary, Canada', 'Calgary, Alberta, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'California', 'California, United States');

select (case when hacker_location like '%California, United States%'
		then concat(substring_index(hacker_location, 'California, United States', 1), 'California, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'California, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%California, United States%'
		then concat(substring_index(hacker_location, 'California, United States', 1), 'California, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cambridge', 'Cambridge, Massachusetts, United States');

select (case when hacker_location like '%Cambridge, Massachusetts, United States%'
		then concat(substring_index(hacker_location, 'Cambridge, Massachusetts, United States', 1), 'Cambridge, Massachusetts, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Cambridge, Massachusetts, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Cambridge, Massachusetts, United States%'
		then concat(substring_index(hacker_location, 'Cambridge, Massachusetts, United States', 1), 'Cambridge, Massachusetts, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Canoas', 'Canoas, Brazil');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Canton and Michigan', 'Canton, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Champaign, IL', 'Champaign, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chandigarh, India', 'Chandigarh, Punjab, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'CHARLOTTE', 'Charlotte, North Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chennai', 'Chennai, Tamil Nadu, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chicago', 'Chicago, Illinois, United States');

select (case when hacker_location like '%Chicago, Illinois, United States%'
		then concat(substring_index(hacker_location, 'Chicago, Illinois, United States', 1), 'Chicago, Illinois, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Chicago, Illinois, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Chicago, Illinois, United States%'
		then concat(substring_index(hacker_location, 'Chicago, Illinois, United States', 1), 'Chicago, Illinois, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cincinnati', 'Cincinnati, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cincinnati, Ohio, United States, OH', 'Cincinnati, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Colombia', 'Bogota, Colombia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'City-Gumla , State-Jharkhand , India', 'City-Gumla, State-Jharkhand, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Colorado', 'Colorado, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Columbia, South Carolina', 'Columbia, South Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Columbus', 'Columbus, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'CORAL GABLES', 'Coral Gables, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Coral Springs', 'Coral Springs, Florida, United States');

select (case when hacker_location like '%Coral Springs, Florida, United States%'
		then concat(substring_index(hacker_location, 'Coral Springs, Florida, United States', 1), 'Coral Springs, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Coral Springs, Florida, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Coral Springs, Florida, United States%'
		then concat(substring_index(hacker_location, 'Coral Springs, Florida, United States', 1), 'Coral Springs, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Covington', 'Covington, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cutler Bay', 'Cutlery Bay, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Dallas', 'Dallas, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davie', 'Davie, Florida, United States');

select (case when hacker_location like '%Dallas, Texas, United States%'
		then concat(substring_index(hacker_location, 'Dallas, Texas, United States', 1), 'Dallas, Texas, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Dallas, Texas, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Dallas, Texas, United States%'
		then concat(substring_index(hacker_location, 'Dallas, Texas, United States', 1), 'Dallas, Texas, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davie, Florida, United States FL', 'Davie, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davie, Florida, United States, FL', 'Davie, Florida, United States');


update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davis', 'Davis, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Dayton, OH', 'Dayton, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'DC', 'Washington, DC, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Decatur', 'Decatur, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'deerfield beach, fl', 'Deerfield Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Deerfield Beach, Florida, United States, Florida, United States', 'Deerfield Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Dehradun', 'Dehradun, Uttarakhand, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'DELRAY BEACH', 'Decatur, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Delray Beach, FL', 'Delray Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Denton', 'Denton, Texas, United States');

select (case when hacker_location like '%Denton, Texas, United States%'
		then concat(substring_index(hacker_location, 'Denton, Texas, United States', 1), 'Denton, Texas, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Denton, Texas, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Denton, Texas, United States%'
		then concat(substring_index(hacker_location, 'Denton, Texas, United States', 1), 'Denton, Texas, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'denver', 'Denver, Colorado, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Detroit, MI', 'Detroit, Michigan, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Digital Nomad', 'Antarctica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Doral', 'Doral, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'DORAL', 'Doral, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Durham, NC', 'Durham, North Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'East Brunswick', 'East Brunswick, New Jersey, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'EAST California, United States', 'Palm Desert, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'East Coast & LA', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Edmonds', 'Edmonds, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Edmonds Canada', 'Edmonds, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Egypt', 'Aswan, Egypt');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Egypt, Aswan', 'Aswan, Egypt');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Aswan, Aswan, Egypt', 'Aswan, Egypt');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Edmonton Canada', 'Edmonton, Alberta, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ellicott City', 'Ellicott City, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'ENGLEWOOD CLIFFS', 'Englewood Cliffs, New Jersey, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Epping, Manhattan, New York City, United States', 'Epping, New Hampshire, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Escondido', 'Escondido, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Evanston, IL', 'Evanston, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fairfax', 'Fairfax, Virginia, United States');

select (case when hacker_location like '%Fairfax, Virginia, United States%'
		then concat(substring_index(hacker_location, 'Fairfax, Virginia, United States', 1), 'Fairfax, Virginia, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Fairfax, Virginia, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Fairfax, Virginia, United States%'
		then concat(substring_index(hacker_location, 'Fairfax, Virginia, United States', 1), 'Fairfax, Virginia, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'FL', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'FL, USA', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fl', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Aventura, Florida, United States, United Statesorida, United States', 'Aventura, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bal Harbour, Florida, United States, United Statesorida, United States', 'Bal Harbour, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boca Raton, Florida, United States, United Statesorida, United States', 'Boca Raton, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Boynton Beach, Florida, United States, United Statesorida, United States', 'Boynton Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Coral Gables, Florida, United States, United Statesorida, United States', 'Coral Gables, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Coral Springs, Florida, United States, United Statesorida, United States', 'Coral Springs, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cutlery Bay, Florida, United States, United Statesorida, United States', 'Cutler Bay, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davie, Florida, United States, United Statesorida, United States', 'Davie, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Davis, Florida, United States, United Statesorida, United States', 'Davis, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Deerfield Beach, Florida, United States, United Statesorida, United States', 'Deerfield Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Delray Beach, Florida, United States, United Statesorida, United States', 'Delray Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Doral, Florida, United States, United Statesorida, United States', 'Doral, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United States', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United Statesemington', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United Statesorida', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United Statesorida, United States', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United Statesorida, United States, US', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States ', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fort Lauderdale', 'Fort Lauderdale, Florida, United States');

select (case when hacker_location like '%Fort Lauderdale, Florida, United States%'
		then concat(substring_index(hacker_location, 'Fort Lauderdale, Florida, United States', 1), 'Fort Lauderdale, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Fort Lauderdale, Florida, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Fort Lauderdale, Florida, United States%'
		then concat(substring_index(hacker_location, 'Fort Lauderdale, Florida, United States', 1), 'Fort Lauderdale, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fort Lauederdale', 'Fort Lauderdale, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fremont', 'Fremont, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'From Paris to Miami, Florida, United States', 'Pairs, France');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ft Lauderdale', 'Fort Lauderdale, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fort Lauderdale, Florida, United States Florida, United States', 'Fort Lauderdale, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fremont, California, United States, California, United States', 'Fremont, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Fulshear', 'Fulshear, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gainesville', 'Gainesville, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gainesville, Florida, United States Florida, United States', 'Gainesville, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ghaziabad , Uttar Pradesh', 'Ghaziabad , Uttar Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Glen Rock', 'Glen Rock, New Jersey, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Golden Valley', 'Golden Valley, Minnesota, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gurgaon', 'Gurgaon, New Delhi, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gwalior', 'Madhya Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hagerstown, MD', 'Hagerstown, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hallandale', 'Hallandale Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'HALLANDLE BEACH', 'Hallandale Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hernando, Mississippi', 'Hernando, Mississippi, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hialeah', 'Hialeah, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hialeah, Florida, United States, Florida, United States', 'Hialeah, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hoboken, Manhattan, New York City, United States', 'Hoboken, New York City, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hollywood', 'Hollywood, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hollywood, Florida, United States, Florida, United States', 'Hollywood, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hoover', 'Hoover, Alabama, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Houston', 'Houston, Texas, United States');

select (case when hacker_location like '%Houston, Texas, United States%'
		then concat(substring_index(hacker_location, 'Houston, Texas, United States', 1), 'Houston, Texas, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Houston, Texas, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Houston, Texas, United States%'
		then concat(substring_index(hacker_location, 'Houston, Texas, United States', 1), 'Houston, Texas, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Huntington Beach', 'Huntington Beach, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Iceland', 'Reykjavík, Iceland');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Illinois', 'Chicago, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'IN', 'Chicago, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'India', 'Gwalior, Madhya Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Internet', 'Antarctica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Iran', 'Tehran, Iran');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Irvine', 'Irvine, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Israel', 'Tel Aviv-Yafo, Israel');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ithaca', 'Ithaca, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Irvine, California, United States, California, United States', 'Irvine, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gurgaon, New Delhi, Gwalior, Madhya Pradesh, India', 'Gurgaon, New Delhi, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ghaziabad , Uttar Pradesh, India', 'Ghaziabad, Uttar Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Dehradun, Uttarakhand, Gwalior, Madhya Pradesh, India', 'Dehradun, Uttarakhand, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'City-Gumla, State-Jharkhand, Gwalior, Madhya Pradesh, India', 'City-Gumla, State-Jharkhand, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chennai, Tamil Nadu, Gwalior, Madhya Pradesh, India', 'Chennai, Tamil Nadu, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chandigarh, Punjab, Gwalior, Madhya Pradesh, India', 'Chandigarh, Punjab, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bikaner, Rajasthan, Gwalior, Madhya Pradesh, India', 'Bikaner, Rajasthan, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bengaluru, Karnataka, Gwalior, Madhya Pradesh, India', 'Bengaluru, Karnataka, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Agra, Uttar Pradesh, Gwalior, Madhya Pradesh, India', 'Bengaluru, Karnataka, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Avon, Colorado, United States, United States', 'Avon, Colorado, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bogota, Bogota, Colombia', 'Bogota, Colombia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Champaign, Chicago, Illinois, United States, United States', 'Champaign, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Chicago, Chicago, Illinois, United States, United States', 'Chicago, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Evanston, Chicago, Illinois, United States, United States', 'Evanston, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Jersey City', 'Jersey City, New Jersey, United States');

select (case when hacker_location like '%Jersey City, New Jersey, United States%'
		then concat(substring_index(hacker_location, 'Jersey City, New Jersey, United States', 1), 'Jersey City, New Jersey, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Jersey City, New Jersey, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Jersey City, New Jersey, United States%'
		then concat(substring_index(hacker_location, 'Jersey City, New Jersey, United States', 1), 'Jersey City, New Jersey, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Kansas City, KS', 'Kansas City, Missouri, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Katy', 'Katy, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'KEY BISCalifornia, United States', 'Key Biscayne, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Key Biscayne, Florida, United States, Florida, United States', 'Key Biscayne, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Kingston', 'Kingston, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'LA', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'La Jolla', 'La Jolla, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Lake Jackson, Texas', 'Lake Jackson, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Kingston, Ontario, Canada, Canada, Ontario', 'Kingston, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Kingston, Ontario, Canada, Jamaica', 'Kingston, Jamaica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Lakewood Ranch', 'Lakewood Ranch, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Las Vegas', 'Las Vegas, Nevada, United States');

select (case when hacker_location like '%Las Vegas, Nevada, United States%'
		then concat(substring_index(hacker_location, 'Las Vegas, Nevada, United States', 1), 'Las Vegas, Nevada, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Las Vegas, Nevada, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Las Vegas, Nevada, United States%'
		then concat(substring_index(hacker_location, 'Las Vegas, Nevada, United States', 1), 'Las Vegas, Nevada, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Las Vegas, Nevada, United States, Nevada, United States', 'Las Vegas, Nevada, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Lewisville, Texas', 'Lewisville, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Lisbon', 'Lisbon, Portugal');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'LittleHaiti', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Lomas de Cuernavaca', 'Cuernavaca, Morelos, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'London', 'London, UK');

select (case when hacker_location like '%London, UK%'
		then concat(substring_index(hacker_location, 'London, UK', 1), 'London, UK')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'London, UK';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%London, UK%'
		then concat(substring_index(hacker_location, 'London, UK', 1), 'London, UK')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'LOS ANGELES', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Los Angeles', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'los angeles', 'Los Angeles, California, United States');

select (case when hacker_location like '%Los Angeles, California, United States%'
		then concat(substring_index(hacker_location, 'Los Angeles, California, United States', 1), 'Los Angeles, California, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Los Angeles, California, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Los Angeles, California, United States%'
		then concat(substring_index(hacker_location, 'Los Angeles, California, United States', 1), 'Los Angeles, California, United States')
		else hacker_location end);

select distinct hacker_location
from hacker_location_info_2022
order by hacker_location;

select distinct hacker_location, count(*) as wombo
from hacker_location_info_2022
group by hacker_location; 

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Los Angles', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'LOUISVILLE', 'Louisville, Kentucky, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Louisville, Kentucky', 'Louisville, Kentucky, United States');
     
update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Louisville, Kentucky, United States, United States', 'Louisville, Kentucky, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Macerata', 'Macerata, Italy');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Madhya Pradesh, Gwalior, Madhya Pradesh, India', 'Indore, Madhya Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manassas VA', 'Manassas, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manhattan', 'Manhattan, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manhattan, New York, United States Beach, California, United States', 'Manhattan Beach, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manhattan, New York, United States, New York City, United States', 'Manhattan, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Manhattan, New York, United States ', 'Manhattan, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Markham', 'Markham, Illinois, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Marietta', 'Marietta, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Maryland', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Baltimore, Baltimore, Maryland, United States, United States', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Maryland', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mexico', 'Mexico City, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bowie, Baltimore, Maryland, United States, United States', 'Bowie, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cuernavaca, Morelos, Mexico City, Mexico, United States', 'Cuernavaca, Morelos, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ellicott City, Baltimore, Maryland, United States, United States', 'Ellicott City, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hagerstown, Baltimore, Maryland, United States, United States', 'Hagerstown, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Las Vegas, Nevada, United States, Nevada, United States', 'Las Vegas, Nevada, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Key West, Florida, United Statesorida, United States', 'Key West, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Jacksonville, Florida, United Statesorida, United States', 'Jacksonville, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Homestead, Florida, United Statesorida, United States', 'Homestead, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hollywood, Florida, United Statesorida, United States', 'Hollywood, Florida, United States');

select (case when hacker_location like '%Hialeah, Florida, United States%'
		then concat(substring_index(hacker_location, 'Hialeah, Florida, United States', 1), 'Hialeah, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Hialeah, Florida, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Hialeah, Florida, United States%'
		then concat(substring_index(hacker_location, 'Hialeah, Florida, United States', 1), 'Hialeah, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Hagerstown, Baltimore, Maryland, United States, United States', 'Hagerstown, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ghaziabad , Uttar Pradesh, Gwalior, Madhya Pradesh, India', 'Ghaziabad, Uttar Pradesh, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Gainesville, Florida, United Statesorida, United States', 'Gainesville, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Key Biscayne, Florida, United States, Florida, United States', 'Key Biscayne, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Key Biscayne, Florida, United States, Florida, United States', 'Key Biscayne, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United Statesemington', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United Statesorida', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United Statesorida, United States, United States', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United Statesorida, United States, US', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United States, US', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States, United States', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Florida, United States ', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ellicott City, Baltimore, Maryland, United States, United States', 'Ellicott City, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Deerfield, Florida, United States', 'Deerfield Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Cutlery Bay, Florida, United States', 'Cutler Bay, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'cambridge', 'Cambridge, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bowie, Baltimore, Maryland, United States, United States', 'Bowie, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Belle Mead', 'Belle Mead, Tennessee, United States');

select (case when hacker_location like '%Baltimore, Maryland, United States%'
		then concat(substring_index(hacker_location, 'Baltimore, Maryland, United States', 1), 'Baltimore, Maryland, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Baltimore, Maryland, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Baltimore, Maryland, United States%'
		then concat(substring_index(hacker_location, 'Baltimore, Maryland, United States', 1), 'Baltimore, Maryland, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Avon, CO', 'Avon, Colorado, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Alexandria, VA', 'Alexandria, Virginia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Alameda Ca, USA', 'Alameda, California, United States');

#ALL IS FIXED IN THE DATA, CONTINIUNG TO UPDATE LOCATIONS BELOW

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Maryalnd', 'Baltimore, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Melbourne', 'Melbourne, Australia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Melbourne, Australia, Florida, United States', 'Melbourne, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Metuchen', 'Metuchen, New Jersey, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mexico City, Mexico, Mexico', 'Mexico City, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mexico City', 'Mexico City, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mexico City', 'Mexico City, Mexico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'MIA', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'miami', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Milpitas, Florida, United States', 'Milpitas, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Milwaukee, WI', 'Milwaukee, Wisconsin, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mineola, Manhattan, New York, United States', 'Long Island, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Miramar Florida, United States', 'Miramar, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mississauga', 'Mississauga, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Montana', 'Helena, Montana, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Montreal, Canada', 'Montreal, Quebec, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mount Kisco', 'Mount Kisco, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mountain View', 'Mountain View, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Myrtle Beach', 'Myrtle Beach, South Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mississauga, Ontario, Canada , ON, Canada', 'Mississauga, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mountain View, California, United States ', 'Mountain View, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Nashik, Gwalior, Madhya Pradesh, India', 'Nashik, Maharashtra, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Nashville', 'Nashville, Tennessee, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Nashville, Tennessee, United States, Tennessee, United States', 'Nashville, Tennessee, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Nomad', 'Antarctica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'North Miami, Florida, United States', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'NA', 'Antarctica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'North Wales, PA', 'North Wales, Pennsylvania, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Oakland Park', 'Oakland Park, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ontario, Canada', 'Ottawa, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Opa-locka', 'Opa-locka, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Orford, NH', 'Orford, New Hampshire, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Orlando', 'Orlando, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Orlando, Florida, United States, Florida, United States', 'Orlando, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Orono, Maine', 'Orono, Maine, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ottawa', 'Ottawa, Ontario, Canada');

select (case when hacker_location like '%Ottawa, Ontario, Canada%'
		then concat(substring_index(hacker_location, 'Ottawa, Ontario, Canada', 1), 'Ottawa, Ontario, Canada')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Ottawa, Ontario, Canada';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Ottawa, Ontario, Canada%'
		then concat(substring_index(hacker_location, 'Ottawa, Ontario, Canada', 1), 'Ottawa, Ontario, Canada')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Oviedo', 'Oviedo, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'PABengaluru, Karnataka, IndiaMA CITY', 'Panama City, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pairs, Franceorida, United States', 'Paris, France');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Palm coast', 'Palm Coast, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Palmetto Bay', 'Palmetto Bay, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Palo Alto', 'Palo Alto, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Panama City Beach, Florida, United States', 'Panama City, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Palo Alto, California, United States, California, United States', 'Palo Alto, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Paris', 'Paris, France');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Paris, France, France', 'Paris, France');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Peach Bottom', 'Peach Bottom, Pennsylvania, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'PEMBROKE PChicago, Illinois, United StatesES', 'Pembroke Pines, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pewaukee', 'Pewaukee, Wisconsin, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'PHENIX CITY', 'Phoenix, Arizona, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Philadelphia', 'Philadelphia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Philadelphia, United States, PA', 'Philadelphia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Philadelphia, United StatesPA', 'Philadelphia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'PHILos Angeles, California, United States', 'Los Angeles, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'PHL', 'Antarctica');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Phoenix', 'Phoenix, Arizona, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Phoenix, Arizona, United States, Arizona, United States', 'Phoenix, Arizona, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pittsburgh', 'Pittsburgh, Pennsylvania, United States');

select (case when hacker_location like '%Pittsburgh, Pennsylvania, United States%'
		then concat(substring_index(hacker_location, 'Pittsburgh, Pennsylvania, United States', 1), 'Pittsburgh, Pennsylvania, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Pittsburgh, Pennsylvania, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Pittsburgh, Pennsylvania, United States%'
		then concat(substring_index(hacker_location, 'Pittsburgh, Pennsylvania, United States', 1), 'Pittsburgh, Pennsylvania, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Plantation', 'Plantation, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Plantation, Florida, United States, Florida, United States', 'Plantation, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pleasant Hill', 'Pleasant Hill, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pompano, fl', 'Pompano Beach, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Portland, Oregon, United States, OR', 'Portland, Oregon, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Princeton, NJ', 'Princeton, New Jersey, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Prosper, Texas', 'Prosper, Texas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Pune', 'Pune, Maharashtra, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Qld', 'Queensland, Brisbane, Australia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Quebec', 'Quebec City, Quebec, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Quito, Ecuador', 'Quito, Ecuador');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Raleigh, NC', 'Raleigh, North Carolina, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Rancho Santa Fe', 'Rancho Santa Fe, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Redmond City, Washington, United States City, Washington, United States', 'Redmond City, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Redwood City, C, United States', 'Redwood City, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Rehoboth', 'Rehoboth, Deleware, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Reno, NV', 'Reno, Nevada, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Rochester', 'Rochester, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Rogers', 'Rogers, Arkansas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Salt Lake City, UT', 'Salt Lake City, Utah, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'SACO', 'Saco, Maine, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sacramento', 'Sacramento, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'salt lake city, utah', 'Salt Lake City, Utah, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'SAN DIEGO', 'San Diego, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Diego ', 'San Diego, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Francisco', 'San Francisco, California, United States');

select (case when hacker_location like '%San Francisco, California, United States%'
		then concat(substring_index(hacker_location, 'San Francisco, California, United States', 1), 'San Francisco, California, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'San Francisco, California, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%San Francisco, California, United States%'
		then concat(substring_index(hacker_location, 'San Francisco, California, United States', 1), 'San Francisco, California, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Montreal, Quebec City, Quebec, Canada, Canada', 'Montreal, Quebec, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Francsico', 'San Francisco, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Jose', 'San Jose, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Jose, California, United States California, United States', 'San Jose, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Jose, California, United States, California, United States', 'San Jose, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Juan', 'San Juan, Puerto Rico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Mateo', 'San Mateo, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Santa Barbara', 'Santa Barbara, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Santa Clara', 'Santa Clara, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Santa Monica', 'Santa Monica, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Juan, Puerto Rico, Puerto Rico ', 'San Juan, Puerto Rico');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Santa Monica, California, United States, California, United States', 'Santa Monica, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Santiago', 'Santiago, Chile');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sarasota Florida, United States', 'Sarasota, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Savannah', 'Savannah, Georgia, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Scarsdale, ny', 'Scarsdale, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Schwenksville', 'Schwenksville, Pennsylvania, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Seattle', 'Seattle, Washington, United States');

select (case when hacker_location like '%Seattle, Washington, United States%'
		then concat(substring_index(hacker_location, 'Seattle, Washington, United Statess', 1), 'Seattle, Washington, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Seattle, Washington, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Seattle, Washington, United States%'
		then concat(substring_index(hacker_location, 'Seattle, Washington, United States', 1), 'Seattle, Washington, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Seoul', 'Seoul, South Korea');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Seoul, South Korea, South Korea', 'Seoul, South Korea');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'SF', 'San Francisco, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'San Francisco, California, United States, California, United States', 'San Francisco, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Shahbad, Haryana,Gwalior, Madhya Pradesh, India', 'Shahbad, Haryana, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sharon, MA', 'Sharon, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sherwood', 'Sherwood, Arkansas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Silver Spring, MD', 'Silver Spring, Maryland, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'South Beach', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Miami, Florida, United States Florida, United StatesUSA', 'Miami, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'South Lake Tahoe', 'South Lake Tahoe, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Springfield', 'Springfield, Missouri, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Stanford', 'Stanford, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Stanford, California, United States, California, United States', 'Stanford, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Stittsville', 'Ottawa, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sunny Isles', 'Sunny Isles, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Sunnyvale', 'Sunnyvale, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Tampa', 'Tampa, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Tampa, Florida, United States, Florida, United States', 'Tampa, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Tempe, Arizona', 'Tempe, Arizona, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Tempe, AZ', 'Tempe, Arizona, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Thane, Maharashtra, United States', 'Thane, Maharashtra, India');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'The Netherlands', 'Amsterdam, Netherlands');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Toronto', 'Toronto, Ontario, Canada');

select (case when hacker_location like '%Toronto, Ontario, Canada%'
		then concat(substring_index(hacker_location, 'Toronto, Ontario, Canada', 1), 'Toronto, Ontario, Canada')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'Toronto, Ontario, Canada';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%Toronto, Ontario, Canada%'
		then concat(substring_index(hacker_location, 'Toronto, Ontario, Canada', 1), 'Toronto, Ontario, Canada')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Toronto', 'Toronto, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Torrent', 'Torrent, Spain');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Ulaanbaatar', 'Ulaanbaatar, Mongolia');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Union city California, United States', 'Union CIty, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'United States ', 'United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'United StatesA', 'United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Utica', 'Utica, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Vancouver', 'Vancouver, New York, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Vantaa', 'Vantaa, Finland');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Walpole', 'Walpole, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Waltham', 'Waltham, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Waltham, Massachusetts, United States, Massachusetts, United States', 'Waltham, Massachusetts, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Washington', 'Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bainbridge Island, Washington, United States, United States', 'Bainbridge Island, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bellingham, Washington, United States, United States', 'Bellingham, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bozeman, Helena, Montana, Canada, United States', 'Bozeman, Montana, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Edmonds, Washington, United States, United States', 'Edmonds, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Redmond City, Washington, United States, United States', 'Redmond City, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Seattle, Washington, United States, United States', 'Seattle, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Helena, Montana, Canada', 'Helena, Montana, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Brampton, Ottawa, Ontario, Canada', 'Brampton, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Kingston, Ottawa, Ontario, Canada', 'Kingston, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Mississauga, Ottawa, Ontario, Canada', 'Mississauga, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Waterloo, Ottawa, Ontario, Canada', 'Waterloo, Ontario, Canada');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Washington, United States, DC, United States', 'Washington D.C, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Washington, United States, D.C.', 'Washington D.C, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Washington, United States', 'Washington D.C, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Wellington', 'Wellington, New Zealand');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Wesley chapel', 'Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'West Hollywood, Florida, United States', 'Hollywood, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'West Palm beach Florida, United StatesUnited States', 'West Palm Beach, Florida, United States');

select (case when hacker_location like '%West Palm Beach, Florida, United States%'
		then concat(substring_index(hacker_location, 'West Palm Beach, Florida, United States', 1), 'West Palm Beach, Florida, United States')
		else hacker_location end)
from hacker_location_info_2022
where hacker_location = 'West Palm Beach, Florida, United States';
 
update hacker_location_info_2022
    set hacker_location = (case when hacker_location like '%West Palm Beach, Florida, United States%'
		then concat(substring_index(hacker_location, 'West Palm Beach, Florida, United States', 1), 'West Palm Beach, Florida, United States')
		else hacker_location end);

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bainbridge Island, Washington D.C, United States', 'Bainbridge Island, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Bellingham, Washington D.C, United States', 'Bellingham, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Edmonds, Washington D.C, United States', 'Edmonds, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Redmond City, Washington D.C, United States', 'Redmond City, Washington, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Seattle, Washington D.C, United States', 'Seattle, Washington, United States');
#
update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Westerville', 'Westerville, Ohio, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Westminster', 'Westminster, California, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Weston ', 'Weston, Florida, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Wichita, Kansas', 'Wichita, Kansas, United States');

update hacker_location_info_2022
set hacker_location = replace(hacker_location, 'Winter Park', 'Winter Park, Florida, United States');

#DONE WITH UPDATING LOCATIONS (NOW SEPERATING DATA INTO CITY, STATE, COUNTRY & INSERTING INTO NEW TABLE)

select distinct hacker_location
from hacker_location_info_2022
order by hacker_location;

drop table hacker_location_2022;
create table hacker_location_2022 (
	hacker_job varchar(50),
    hacker_location varchar (50),
    combo_count int,
    City varchar (50),
    State varchar (50),
    Country varchar(50)
);

select *,
	substr(hacker_location, 1, length(hacker_location) - length(substring_index(hacker_location, ',', -2))) City,
	substring_index(substring_index(hacker_location, ',', -2), ',', 1) State,
	substring_index(hacker_location, ' ', -2) Country
 from hacker_location_info_2022;
 
 insert into hacker_location_2022
 select *,
	substr(hacker_location, 1, length(hacker_location) - length(substring_index(hacker_location, ',', -2))) City,
	substring_index(substring_index(hacker_location, ',', -2), ',', 1) State,
	substring_index(hacker_location, ' ', -2) Country
 from hacker_location_info_2022;
 
select *
from hacker_location_2022;
 
 drop table idea;
 
update hacker_location_2022
set State = replace(State, 'Jamaica', '');
#########
update hacker_location_2022
set City = 'Buenos Aires'
where State = 'Buenos Aires';

update hacker_location_2022
set State = ' '
where City = 'Buenos Aires';

update hacker_location_2022
set Country = replace(Country, 'Aires, Argentina', 'Argentina');
#########
update hacker_location_2022
set Country = replace(Country, 'Alberta, Canada', 'Canada');

update hacker_location_2022
set Country = replace(Country, 'Amsterdam, Netherlands', 'Netherlands');

update hacker_location_2022
set State = ' '
where Country = 'Antarctica';

update hacker_location_2022
set Country = replace(Country, 'Aswan, Egypt', 'Egypt');

select *
from hacker_location_2022;

update hacker_location_2022
set Country = replace(Country, 'Aviv-Yafo, Israel', 'Israel');

update hacker_location_2022
set Country = replace(Country, 'Bangkok, Thailand', 'Thailand');

update hacker_location_2022
set Country = replace(Country, 'Barcelona, Spain', 'Spain');

update hacker_location_2022
set Country = replace(Country, 'Barueri, Brazil', 'Brazil');

update hacker_location_2022
set Country = replace(Country, 'Berlin, Germany', 'Germany');

update hacker_location_2022
set Country = replace(Country, 'Bogota, Colombia', 'Colombia');

select *
from hacker_location_2022;

update hacker_location_2022
set Country = replace(Country, 'Bournemouth, UK', 'UK');

update hacker_location_2022
set State = ' '
where State = 'Brazil';

update hacker_location_2022
set Country = replace(Country, 'Bridgetown, Barbados', 'Barbados');

update hacker_location_2022
set Country = replace(Country, 'Brisbane, Australia', 'Australia');

update hacker_location_2022
set State = ' '
where State = ' Brisbane';

update hacker_location_2022
set City = 'Brisbane'
where City = 'Queensland,';

update hacker_location_2022
set Country = replace(Country, 'Bournemouth, UK', 'UK');

update hacker_location_2022
set City = 'Dorset'
where State = 'Dorset';

update hacker_location_2022
set State = ' '
where State = 'Dorset';

select *
from hacker_location_2022;

update hacker_location_2022
set Country = replace(Country, 'Bridgetown, Barbados', 'Barbados');

update hacker_location_2022
set City = 'Bridgetown'
where State = 'Bridgetown';

update hacker_location_2022
set State = ' '
where State = 'Bridgetown';

update hacker_location_2022
set City = 'Barueri'
where State = 'Barueri';

update hacker_location_2022
set State = ' '
where State = 'Barueri';

update hacker_location_2022
set Country = replace(Country, 'Brussels, Belgium', 'Belgium');

update hacker_location_2022
set City = 'Brussels'
where State = 'Brussels';

update hacker_location_2022
set State = ' '
where State = 'Brussels';

select *
from hacker_location_2022;

update hacker_location_2022
set State = ' '
where State = 'Canada';

update hacker_location_2022
set State = 'Alberta'
where State = ' Alberta';

update hacker_location_2022 
set City = trim(both ',' from City);

update hacker_location_2022 
set State = trim(leading ' ' from State);

update hacker_location_2022
set City = 'Buenos Aires'
where Country = 'Argentina';

update hacker_location_2022
set City = 'Brisbane'
where Country = 'Australia';

update hacker_location_2022
set City = 'Bridgetown'
where Country = 'Barbados';

update hacker_location_2022
set City = 'Brussels'
where Country = 'Belgium';

update hacker_location_2022
set City = 'Barueri'
where Country = 'Brazil';

update hacker_location_2022
set City = 'Edmonton'
where hacker_location = 'Edmonton, Alberta, Canada';

update hacker_location_2022
set City = 'Calgary'
where hacker_location = 'Calgary, Alberta, Canada';

update hacker_location_2022
set State = ' '
where State = 'Canoas';

update hacker_location_2022
set Country = replace(Country, 'Canoas, Brazil', 'Brazil');

update hacker_location_2022
set State = ' '
where Country = 'China';

update hacker_location_2022
set City = ' '
where Country = 'China';

update hacker_location_2022
set Country = replace(Country, 'City, Mexico', 'Mexico');

update hacker_location_2022
set State = ' '
where City = 'Mexico City';

update hacker_location_2022
set State = ' '
where City = 'Bogota';

update hacker_location_2022
set Country = replace(Country, 'Columbia, Canada', 'Canada');

update hacker_location_2022
set City = ' '
where State = 'British Columbia';

update hacker_location_2022
set State = ' '
where Country = 'Costa Rica';

update hacker_location_2022
set City = ' '
where Country = 'Costa Rica';

update hacker_location_2022
set State = ' '
where City = 'New Delhi';

update hacker_location_2022
set Country = replace(Country, 'Delhi, India', 'India');

update hacker_location_2022
set State = ' '
where Country = 'Dublin, Ireland';

update hacker_location_2022
set Country = replace(Country, 'Dublin, Ireland', 'Ireland');

update hacker_location_2022
set State = ' '
where City = 'Aswan';

update hacker_location_2022
set State = ' '
where Country = 'France';

update hacker_location_2022
set City = 'Paris'
where Country = 'France';

update hacker_location_2022
set City = 'Berlin'
where hacker_location = 'Germany';

update hacker_location_2022
set State = ' '
where hacker_location = 'Germany';

update hacker_location_2022
set State = ' '
where City = 'Berlin';

update hacker_location_2022
set City = 'Munich'
where State = 'Bavaria';

update hacker_location_2022
set State = ' '
where State = 'Bavaria';

update hacker_location_2022
set State = ' '
where Country = 'Haiti';

update hacker_location_2022
set City = ' '
where Country = 'Haiti';

update hacker_location_2022
set State = ' '
where City = 'Haryana';

update hacker_location_2022
set State = ' '
where City = 'Helsinki';

update hacker_location_2022
set Country = replace(Country, 'Haryana, India', 'India');

update hacker_location_2022
set Country = replace(Country, 'Helsinki, Finland', 'Finland');

update hacker_location_2022
set State = ' '
where City = 'Tel Aviv-Yafo';

update hacker_location_2022
set State = ' '
where City = 'Macerata';

update hacker_location_2022
set Country = replace(Country, 'Janeiro, Brazil', 'Brazil');

update hacker_location_2022
set State = ' '
where City = 'Rio de Janeiro';

update hacker_location_2022
set Country = replace(Country, 'Karnataka, India', 'India');

update hacker_location_2022
set State = ' '
where City = 'Karnataka';

update hacker_location_2022
set City = 'Bengaluru'
where hacker_location = 'Bengaluru, Karnataka, India';

update hacker_location_2022
set Country = replace(Country, 'Kingston, Jamaica', 'Jamaica');

update hacker_location_2022
set State = ' '
where City = 'Kingston';

update hacker_location_2022
set City = 'Kingston'
where hacker_location = 'Jamaica';

update hacker_location_2022
set State = ' '
where Country = 'Korea';

update hacker_location_2022
set City = ' '
where Country = 'Korea';

update hacker_location_2022
set Country = replace(Country, 'Korea', 'South Korea');

update hacker_location_2022
set Country = replace(Country, 'Lima, Peru', 'Peru');

update hacker_location_2022
set State = ' '
where City = 'Lima';

update hacker_location_2022
set Country = replace(Country, 'Lisbon, Portugal', 'Portugal');

update hacker_location_2022
set State = ' '
where City = 'Lisbon';

update hacker_location_2022
set Country = replace(Country, 'London, UK', 'UK');

update hacker_location_2022
set Country = replace(Country, 'Maharashtra, India', 'India');

update hacker_location_2022
set City = 'Nashik'
where hacker_location = 'Nashik, Maharashtra, India';

update hacker_location_2022
set City = 'Pune'
where hacker_location = 'Pune, Maharashtra, India';

update hacker_location_2022
set City = 'Thane'
where hacker_location = 'Thane, Maharashtra, India';

update hacker_location_2022
set City = 'Shahabad'
where hacker_location = 'Shahbad, Haryana, India';

update hacker_location_2022
set Country = replace(Country, 'Melbourne, Australia', 'Australia');

update hacker_location_2022
set City = 'Melbourne'
where State = 'Melbourne';

update hacker_location_2022
set State = ' '
where State = 'Melbourne';

update hacker_location_2022
set City = ' '
where hacker_location = 'Mexico';

update hacker_location_2022
set State = ' '
where hacker_location = 'Mexico';

update hacker_location_2022
set Country = replace(Country, 'Morelos, Mexico', 'Mexico');

update hacker_location_2022
set City = 'Cuernavaca'
where hacker_location = 'Cuernavaca, Morelos, Mexico';

update hacker_location_2022
set State = ' '
where City = 'Cuernavaca';

update hacker_location_2022
set Country = replace(Country, 'Nadu, India', 'India');

update hacker_location_2022
set State = ' '
where City = 'Tamil Nadu';

update hacker_location_2022
set City = 'Chennai'
where City = 'Tamil Nadu';

update hacker_location_2022
set State = ' '
where City = 'Amsterdam';

update hacker_location_2022
set State = ' '
where hacker_location = 'Netherlands ';

update hacker_location_2022
set City = ' '
where hacker_location = 'Netherlands ';

update hacker_location_2022
set State = ' '
where City = 'Wellington';

update hacker_location_2022
set State = ' '
where Country = 'Nigeria ';

update hacker_location_2022
set City = ' '
where Country = 'Nigeria ';

update hacker_location_2022
set State = ' '
where Country = 'Ohio';

update hacker_location_2022
set Country = replace(Country, 'Ohio', 'United States');

update hacker_location_2022
set Country = replace(Country, 'Ontario, Canada', 'Canada');

update hacker_location_2022
set City = 'Toronto'
where hacker_location = 'Toronto, Ontario, Canada';

update hacker_location_2022
set City = 'Mississauga'
where hacker_location = 'Mississauga, Ontario, Canada';

update hacker_location_2022
set City = 'Ottawa'
where hacker_location = 'Ottawa, Ontario, Canada';

update hacker_location_2022
set City = 'Kingston'
where hacker_location = 'Kingston, Ontario, Canada';

update hacker_location_2022
set City = 'Brampton'
where hacker_location = 'Brampton, Ontario, Canada';

update hacker_location_2022
set State = ' '
where hacker_location = 'Oranjestad, Aruba';

update hacker_location_2022
set State = ' '
where hacker_location = 'Pakistan';

update hacker_location_2022
set City = ' '
where hacker_location = 'Pakistan';

update hacker_location_2022
set Country = replace(Country, 'Paris, France', 'France');

update hacker_location_2022
set State = ' '
where hacker_location = 'Paris, France';

update hacker_location_2022
set State = ' '
where hacker_location = 'Philippines';

update hacker_location_2022
set City = ' '
where hacker_location = 'Philippines';

update hacker_location_2022
set Country = replace(Country, 'Pradesh, India', 'India');

update hacker_location_2022
set City = 'Ghaziabad'
where hacker_location = 'Ghaziabad, Uttar Pradesh, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Ghaziabad, Uttar Pradesh, India';

update hacker_location_2022
set City = 'Gwalior'
where hacker_location = 'Gwalior, Madhya Pradesh, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Gwalior, Madhya Pradesh, India';

update hacker_location_2022
set City = 'Indore'
where hacker_location = 'Indore, Madhya Pradesh, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Indore, Madhya Pradesh, India';

update hacker_location_2022
set State = ' '
where Country = 'Puerto Rico';

update hacker_location_2022
set City = 'Chandigarh'
where hacker_location = 'Chandigarh, Punjab, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Chandigarh, Punjab, India';

update hacker_location_2022
set Country = replace(Country, 'Punjab, India', 'India');

update hacker_location_2022
set Country = replace(Country, 'Quebec, Canada', 'Canada');

update hacker_location_2022
set City = 'Quebec City'
where hacker_location = 'Quebec City, Quebec, Canada';

update hacker_location_2022
set City = 'Montreal'
where hacker_location = 'Montreal, Quebec, Canada';

update hacker_location_2022
set Country = replace(Country, 'Oranjestad, Aruba', 'Aruba');

update hacker_location_2022
set State = ''
where hacker_location = 'Quito, Ecuador';

update hacker_location_2022
set Country = replace(Country, 'Quito, Ecuador', 'Ecuador');

update hacker_location_2022
set City = 'Bikaner'
where hacker_location = 'Bikaner, Rajasthan, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Bikaner, Rajasthan, India';

update hacker_location_2022
set Country = replace(Country, 'Rajasthan, India', 'India');

update hacker_location_2022
set Country = replace(Country, 'Reykjavík, Iceland', 'Iceland');

update hacker_location_2022
set State = ' '
where hacker_location = 'Reykjavík, Iceland';

update hacker_location_2022
set City = 'Reykjavík'
where hacker_location = 'Reykjavík, Iceland';

update hacker_location_2022
set Country = replace(Country, 'Santiago, Chile', 'Chile');

update hacker_location_2022
set State = ' '
where hacker_location = 'Santiago, Chile';

update hacker_location_2022
set State = ' '
where hacker_location = 'Singapore';

update hacker_location_2022
set City = ' '
where hacker_location = 'Singapore';

update hacker_location_2022
set Country = replace(Country, 'South South Korea', 'South Korea');

update hacker_location_2022
set State = ' '
where hacker_location = 'Seoul, South Korea';

update hacker_location_2022
set State = ' '
where hacker_location = 'Barcelona, Spain';

update hacker_location_2022
set City = ' '
where hacker_location = 'Spain';

update hacker_location_2022
set State = ' '
where hacker_location = 'Spain';

update hacker_location_2022
set State = ' '
where hacker_location = 'City-Gumla, State-Jharkhand, India';

update hacker_location_2022
set City = 'Gumla'
where hacker_location = 'City-Gumla, State-Jharkhand, India';

update hacker_location_2022
set Country = replace(Country, 'State-Jharkhand, India', 'India');

update hacker_location_2022
set Country = replace(Country, 'Tegucigalpa, Honduras', 'Honduras');

update hacker_location_2022
set State = ' '
where hacker_location = 'Tegucigalpa, Honduras';

update hacker_location_2022
set State = ' '
where hacker_location = 'Sweden';

update hacker_location_2022
set City = ' '
where hacker_location = 'Sweden';

update hacker_location_2022
set State = ' '
where hacker_location = 'Tehran, Iran';

update hacker_location_2022
set Country = replace(Country, 'Tehran, Iran', 'Iran');

update hacker_location_2022
set State = ' '
where hacker_location = 'Bangkok, Thailand';

update hacker_location_2022
set City = ' '
where hacker_location = 'Thailand';

update hacker_location_2022
set State = ' '
where hacker_location = 'Thailand';

update hacker_location_2022
set Country = replace(Country, 'Torrent, Spain', 'Spain');

update hacker_location_2022
set State = ' '
where hacker_location = 'Torrent, Spain';

update hacker_location_2022
set Country = replace(Country, 'UK', 'England');

update hacker_location_2022
set City = 'Battersea'
where hacker_location = 'Battersea, London, UK';

update hacker_location_2022
set City = 'Bournemouth'
where hacker_location = 'Bournemouth, UK';

update hacker_location_2022
set State = ' '
where Country = 'England';

update hacker_location_2022
set Country = replace(Country, 'Ulaanbaatar, Mongolia', 'Mongolia');

update hacker_location_2022
set State = ' '
where hacker_location = 'Ulaanbaatar, Mongolia';
#UNITED STATES

update hacker_location_2022
set City = 'Athens'
where hacker_location = 'Athens, Georgia, United State';

update hacker_location_2022
set City = 'Fort Lauderdale'
where hacker_location = 'Fort Lauderdale, Florida, United States';

update hacker_location_2022
set City = 'Boca Raton'
where hacker_location = 'Boca Raton, Florida, United States';

update hacker_location_2022
set City = 'Miami'
where hacker_location = 'Miami, Florida, United States';

update hacker_location_2022
set City = 'Manhattan'
where hacker_location = 'Manhattan, New York, United States';

update hacker_location_2022
set City = 'Fairfax'
where hacker_location = 'Fairfax, Virginia, United States';

update hacker_location_2022
set City = 'San Francisco'
where hacker_location = 'San Francisco, California, United States';

update hacker_location_2022
set City = 'Atlanta'
where hacker_location = 'Atlanta, Georgia, United States';

update hacker_location_2022
set City = 'Denton'
where hacker_location = 'Denton, Texas, United States';

update hacker_location_2022
set City = 'Orlando'
where hacker_location = 'Orlando, Florida, United States';

update hacker_location_2022
set Country = 'United States'
where hacker_location = 'Athens, Georgia, United State';
update hacker_location_2022

set City = 'Reno'
where hacker_location = 'Reno, Nevada, United States';

update hacker_location_2022
set City = 'Chicago'
where hacker_location = 'Chicago, Illinois, United States';

update hacker_location_2022
set City = 'Cambridge'
where hacker_location = 'Cambridge, Massachusetts, United States';

update hacker_location_2022
set State = 'Pennsylvania'
where hacker_location = 'Philadelphia, United States';

update hacker_location_2022
set City = ' '
where hacker_location = 'California, United States';

update hacker_location_2022
set City = 'Cutler Bay'
where hacker_location = 'Cutler Bay, Florida, United States';

update hacker_location_2022
set City = 'Fulshear'
where hacker_location = 'Fulshear, Texas, United States';

update hacker_location_2022
set City = 'Boston'
where hacker_location = 'Boston, Massachusetts, United States';

update hacker_location_2022
set City = 'Irvine'
where hacker_location = 'Irvine, California, United States';

update hacker_location_2022
set City = 'Jersey City'
where hacker_location = 'Jersey City, New Jersey, United States';
#
update hacker_location_2022
set City = 'Sunnyvale'
where hacker_location = 'Sunnyvale, California, United States';

update hacker_location_2022
set State = 'New York'
where hacker_location = 'Brooklyn, New York City, United States';

update hacker_location_2022
set City = 'Brooklyn'
where hacker_location = 'Brooklyn, New York City, United States';

update hacker_location_2022
set City = 'Dayton'
where hacker_location = 'Dayton, Ohio, United States';

update hacker_location_2022
set State = 'Silver Spring'
where hacker_location = 'Silver Spring, Maryland, United States';

update hacker_location_2022
set City = 'Charlotte'
where hacker_location = 'Charlotte, North Carolina, United States';

update hacker_location_2022
set City = 'Pasadena'
where hacker_location = 'Pasadena, California, United States';

update hacker_location_2022
set City = 'Aventura'
where hacker_location = 'Aventura, Florida, United States';

update hacker_location_2022
set City = 'Fremont'
where hacker_location = 'Fremont, California, United States';

update hacker_location_2022
set City = 'Stanford'
where hacker_location = 'Stanford, California, United States';

update hacker_location_2022
set City = 'Blacksburg'
where hacker_location = 'Blacksburg, Virginia, United States';

update hacker_location_2022
set City = 'Silver Spring'
where hacker_location = 'Silver Spring, Maryland, United States';

update hacker_location_2022
set State = 'Maryland'
where hacker_location = 'Silver Spring, Maryland, United States';

update hacker_location_2022
set City = 'Evanston'
where hacker_location = 'Evanston, Illinois, United States';

update hacker_location_2022
set City = 'Palo Alto'
where hacker_location = 'Palo Alto, California, United States';

update hacker_location_2022
set City = 'East Brunswick'
where hacker_location = 'East Brunswick, New Jersey, United States';

update hacker_location_2022
set City = 'Helena'
where hacker_location = 'Helena, Montana, United States';

update hacker_location_2022
set City = 'Redmond City'
where hacker_location = 'Redmond City, Washington, United States';

update hacker_location_2022
set City = 'Rancho Santa Fe'
where hacker_location = 'Rancho Santa Fe, California, United States';

update hacker_location_2022
set City = ' '
where hacker_location = 'Florida, United States';

update hacker_location_2022
set City = 'Champaign'
where hacker_location = 'Champaign, Illinois, United States';

update hacker_location_2022
set City = 'Columbia'
where hacker_location = 'Columbia, South Carolina, United States';

update hacker_location_2022
set City = 'Tempe'
where hacker_location = 'Tempe, Arizona, United States';

update hacker_location_2022
set City = 'Santa Monica'
where hacker_location = 'Santa Monica, California, United States';

update hacker_location_2022
set City = 'Annandale'
where hacker_location = 'Annandale, Virginia, United States';

update hacker_location_2022
set City = 'Raleigh'
where hacker_location = 'Raleigh, North Carolina, United States';

update hacker_location_2022
set City = 'Dallas'
where hacker_location = 'Dallas, Texas, United States';

update hacker_location_2022
set City = 'Davie'
where hacker_location = 'Davie, Florida, United States';

update hacker_location_2022
set City = 'Milpitas'
where hacker_location = 'Milpitas, California, United States';

update hacker_location_2022
set City = 'Pembroke Pines'
where hacker_location = 'Pembroke Pines, Florida, United States';

update hacker_location_2022
set City = 'Lakewood Ranch'
where hacker_location = 'Lakewood Ranch, Florida, United States';

update hacker_location_2022
set City = 'Sharon'
where hacker_location = 'Sharon, Massachusetts, United States';

update hacker_location_2022
set City = 'Seattle'
where hacker_location = 'Seattle, Washington, United States';

update hacker_location_2022
set City = 'Los Angeles'
where hacker_location = 'Los Angeles, California, United States';

update hacker_location_2022
set State = 'Florida'
where hacker_location = 'Miami, FLorida, United States';

update hacker_location_2022
set City = 'Durham'
where hacker_location = 'Durham, North Carolina, United States';

update hacker_location_2022
set City = 'Hollywood'
where hacker_location = 'Hollywood, Florida, United States';

update hacker_location_2022
set City = 'Beachwood'
where hacker_location = 'Beachwood, Ohio, United States';

update hacker_location_2022
set City = 'Austin'
where hacker_location = 'Austin, Texas, United States';

update hacker_location_2022
set City = 'Saint Petersburg'
where hacker_location = 'Saint Petersburg, Florida, United States';

update hacker_location_2022
set City = 'Atherton'
where hacker_location = 'Atherton, California, United States';

update hacker_location_2022
set City = 'Walpole'
where hacker_location = 'Walpole, Massachusetts, United States';

update hacker_location_2022
set City = 'South Lake Tahoe'
where hacker_location = 'South Lake Tahoe, California, United States';

update hacker_location_2022
set City = 'Berkeley'
where hacker_location = 'Berkeley, California, United States';

update hacker_location_2022
set City = 'Coral Springs'
where hacker_location = 'Coral Springs, Florida, United States';

update hacker_location_2022
set City = 'Wichita'
where hacker_location = 'Wichita, Kansas, United States';

update hacker_location_2022
set City = 'Hallandale Beach'
where hacker_location = 'Hallandale Beach, Florida, United States';

update hacker_location_2022
set City = ' '
where hacker_location = 'Washington D.C, United States';

update hacker_location_2022
set City = 'Louisville'
where hacker_location = 'Louisville, Kentucky, United States';

update hacker_location_2022
set City = 'Sarasota'
where hacker_location = 'Sarasota, Florida, United States';

update hacker_location_2022
set City = 'Bellingham'
where hacker_location = 'Bellingham, Washington, United States';

update hacker_location_2022
set City = 'Portland'
where hacker_location = 'Portland, Oregon, United States';

update hacker_location_2022
set City = 'Las Vegas'
where hacker_location = 'Las Vegas, Nevada, United States';

update hacker_location_2022
set City = 'San Diego'
where hacker_location = 'San Diego, California, United States';

update hacker_location_2022
set City = 'Bozeman'
where hacker_location = 'Bozeman, Montana, United States';

update hacker_location_2022
set City = 'Alameda'
where hacker_location = 'Alameda, California, United States';

update hacker_location_2022
set City = 'Covington'
where hacker_location = 'Covington, Georgia, United States';

update hacker_location_2022
set City = 'Epping'
where hacker_location = 'Epping, New Hampshire, United States';

update hacker_location_2022
set City = 'Pittsburgh'
where hacker_location = 'Pittsburgh, Pennsylvania, United States';

update hacker_location_2022
set City = 'Sacramento'
where hacker_location = 'Sacramento, California, United States';

update hacker_location_2022
set City = 'Doral'
where hacker_location = 'Doral, Florida, United States';

update hacker_location_2022
set City = 'Orono'
where hacker_location = 'Orono, Maine, United States';

update hacker_location_2022
set State = 'Ohio'
where hacker_location = 'Ohio';

update hacker_location_2022
set City = ' '
where hacker_location = 'Ohio';

update hacker_location_2022
set City = 'San Jose'
where hacker_location = 'San Jose, California, United States';

update hacker_location_2022
set City = 'Bal Harbour'
where hacker_location = 'Bal Harbour, Florida, United States';

update hacker_location_2022
set City = 'Vancouver'
where hacker_location = 'Vancouver, New York, United States';

update hacker_location_2022
set Country = 'Canada'
where hacker_location = 'Vancouver, New York, United States';

update hacker_location_2022
set State = ' '
where hacker_location = 'Vancouver, New York, United States';

update hacker_location_2022
set City = 'Santa Clara'
where hacker_location = 'Santa Clara, California, United States';

update hacker_location_2022
set City = 'Phoenix'
where hacker_location = 'Phoenix, Arizona, United States';

update hacker_location_2022
set City = 'La Jolla'
where hacker_location = 'La Jolla, California, United States';

update hacker_location_2022
set City = 'Nashville'
where hacker_location = 'Nashville, Tennessee, United States';

update hacker_location_2022
set City = 'Tampa'
where hacker_location = 'Tampa, Florida, United States';

update hacker_location_2022
set City = 'Tallahassee'
where hacker_location = 'Tallahassee, Florida, United States';

update hacker_location_2022
set City = 'Ellicott City'
where hacker_location = 'Ellicott City, Maryland, United States';

update hacker_location_2022
set City = 'Canton'
where hacker_location = 'Canton, Ohio, United States';

update hacker_location_2022
set City = 'Redwood City'
where hacker_location = 'Redwood City, California, United States';

update hacker_location_2022
set City = 'Ann Arbor'
where hacker_location = 'Ann Arbor, Michigan, United States';

update hacker_location_2022
set City = 'Palmetto Bay'
where hacker_location = 'Palmetto Bay, Florida, United States';

update hacker_location_2022
set City = 'Manhattan Beach'
where hacker_location = 'Manhattan Beach, California, United States';

update hacker_location_2022
set City = 'Manassas'
where hacker_location = 'Manassas, Virginia, United States';

update hacker_location_2022
set City = 'Weston'
where hacker_location = 'Weston, Florida, United States';

update hacker_location_2022
set City = 'Andover'
where hacker_location = 'Andover, Massachusetts, United States';

update hacker_location_2022
set City = 'North Wales'
where hacker_location = 'North Wales, Pennsylvania, United States';

update hacker_location_2022
set City = 'Avon'
where hacker_location = 'Avon, Colorado, United States';

update hacker_location_2022
set City = 'Pewaukee'
where hacker_location = 'Pewaukee, Wisconsin, United States';

update hacker_location_2022
set City = 'Bronx'
where hacker_location = 'Bronx, New York City, United States';

update hacker_location_2022
set State = 'New York'
where hacker_location = 'Bronx, New York City, United States';

update hacker_location_2022
set City = 'Rogers'
where hacker_location = 'Rogers, Arkansas, United States';

update hacker_location_2022
set City = 'West Palm Beach'
where hacker_location = 'West Palm Beach, Florida, United States';

update hacker_location_2022
set City = 'Katy'
where hacker_location = 'Katy, Texas, United States';

update hacker_location_2022
set City = 'Kansas City'
where hacker_location = 'Kansas City, Missouri, United States';

update hacker_location_2022
set City = 'Milwaukee'
where hacker_location = 'Milwaukee, Wisconsin, United States';

update hacker_location_2022
set City = 'Gainesville'
where hacker_location = 'Gainesville, Florida, United States';

update hacker_location_2022
set City = 'Panama City'
where hacker_location = 'Panama City, Florida, United States';

update hacker_location_2022
set City = 'Charlottesville'
where hacker_location = 'Charlottesville, Virginia, United States';

update hacker_location_2022
set City = 'Boynton Beach'
where hacker_location = 'Boynton Beach, Florida, United States';

update hacker_location_2022
set City = 'Belle Mead'
where hacker_location = 'Belle Mead, Tennessee, United States';

update hacker_location_2022
set City = 'Palm Desert'
where hacker_location = 'Palm Desert, California, United States';

update hacker_location_2022
set City = 'Saco'
where hacker_location = 'Saco, Maine, United States';

update hacker_location_2022
set City = 'Utica'
where hacker_location = 'Utica, New York, United States';

update hacker_location_2022
set City = 'Hialeah'
where hacker_location = 'Hialeah, Florida, United States';

update hacker_location_2022
set City = 'Golden Valley'
where hacker_location = 'Golden Valley, Minnesota, United States';

update hacker_location_2022
set City = 'Peach Bottom'
where hacker_location = 'Peach Bottom, Pennsylvania, United States';

update hacker_location_2022
set City = 'Mount Kisco'
where hacker_location = 'Mount Kisco, New York, United States';

update hacker_location_2022
set City = 'Pompano Beach'
where hacker_location = 'Pompano Beach, Florida, United States';

update hacker_location_2022
set City = 'Orford'
where hacker_location = 'Orford, New Hampshire, United States';

update hacker_location_2022
set City = 'Escondido'
where hacker_location = 'Escondido, California, United States';

update hacker_location_2022
set City = 'Decatur'
where hacker_location = 'Decatur, Georgia, United States';

update hacker_location_2022
set City = 'Westerville'
where hacker_location = 'Westerville, Ohio, United States';

update hacker_location_2022
set City = 'Alexandria'
where hacker_location = 'Alexandria, Virginia, United States';

update hacker_location_2022
set City = 'Baltimore'
where hacker_location = 'Baltimore, Maryland, United States';

update hacker_location_2022
set City = 'Marietta'
where hacker_location = 'Marietta, Georgia, United States';

update hacker_location_2022
set City = 'Pinecrest'
where hacker_location = 'Pinecrest, Florida, United States';

update hacker_location_2022
set City = 'Altadena'
where hacker_location = 'Altadena, California, United States';

update hacker_location_2022
set City = 'Coral Gables'
where hacker_location = 'Coral Gables, Florida, United States';

update hacker_location_2022
set City = 'Port St Lucie'
where hacker_location = 'Port St Lucie, Florida, United States';

update hacker_location_2022
set City = 'Homestead'
where hacker_location = 'Homestead, Florida, United States';

update hacker_location_2022
set City = 'Houston'
where hacker_location = 'Houston, Texas, United States';

update hacker_location_2022
set City = 'Bamberg'
where hacker_location = 'Bamberg, South Carolina, United States';

update hacker_location_2022
set City = 'Sunny Isles'
where hacker_location = 'Sunny Isles, Florida, United States';

update hacker_location_2022
set City = 'Glen Rock'
where hacker_location = 'Glen Rock, New Jersey, United States';

update hacker_location_2022
set City = 'Rochester'
where hacker_location = 'Rochester, New York, United States';

update hacker_location_2022
set City = 'Salt Lake City'
where hacker_location = 'Salt Lake City, Utah, United States';

update hacker_location_2022
set City = 'Cincinnati'
where hacker_location = 'Cincinnati, Ohio, United States';

update hacker_location_2022
set City = 'Lake Jackson'
where hacker_location = 'Lake Jackson, Texas, United States';

update hacker_location_2022
set City = 'Hernando'
where hacker_location = 'Hernando, Mississippi, United States';

update hacker_location_2022
set City = 'Oviedo'
where hacker_location = 'Oviedo, Florida, United States';

update hacker_location_2022
set City = 'Denver'
where hacker_location = 'Denver, Colorado, United States';

update hacker_location_2022
set City = 'Bethany'
where hacker_location = 'Bethany, Oklahoma, United States';

update hacker_location_2022
set City = 'Santa Barbara'
where hacker_location = 'Santa Barbara, California, United States';

update hacker_location_2022
set City = 'Mountain View'
where hacker_location = 'Mountain View, California, United States';

update hacker_location_2022
set City = 'Lewisville'
where hacker_location = 'Lewisville, Texas, United States';

update hacker_location_2022
set City = 'Deerfield Beach'
where hacker_location = 'Deerfield Beach, Florida, United States';

update hacker_location_2022
set City = 'Bowie'
where hacker_location = 'Bowie, Maryland, United States';

update hacker_location_2022
set City = 'Miramar'
where hacker_location = 'Miramar, Florida, United States';

update hacker_location_2022
set City = 'Springfield'
where hacker_location = 'Springfield, Missouri, United States';

update hacker_location_2022
set City = 'Waltham'
where hacker_location = 'Waltham, Massachusetts, United States';

update hacker_location_2022
set City = 'Huntington Beach'
where hacker_location = 'Huntington Beach, California, United States';

update hacker_location_2022
set City = 'Bay City'
where hacker_location = 'Bay City, Michigan, United States';

update hacker_location_2022
set City = 'Amaranth'
where hacker_location = 'Amaranth, Pennsylvania, United States';

update hacker_location_2022
set City = 'Hagerstown'
where hacker_location = 'Hagerstown, Maryland, United States';

update hacker_location_2022
set City = 'Rehoboth'
where hacker_location = 'Rehoboth, Deleware, United States';

update hacker_location_2022
set City = 'Davis'
where hacker_location = 'Davis, Florida, United States';

update hacker_location_2022
set City = 'Arlington'
where hacker_location = 'Arlington, Texas, United States';

update hacker_location_2022
set City = 'San Mateo'
where hacker_location = 'San Mateo, California, United States';

update hacker_location_2022
set City = 'Bethlehem'
where hacker_location = 'Bethlehem, Pennsylvania, United States';

update hacker_location_2022
set City = 'Detroit'
where hacker_location = 'Detroit, Michigan, United States';

update hacker_location_2022
set City = 'Westminster'
where hacker_location = 'Westminster, California, United States';

update hacker_location_2022
set City = 'Key Biscayne'
where hacker_location = 'Key Biscayne, Florida, United States';

update hacker_location_2022
set City = 'Cupertino'
where hacker_location = 'Cupertino, California, United States';

update hacker_location_2022
set City = 'Prosper'
where hacker_location = 'Prosper, Texas, United States';

update hacker_location_2022
set City = 'Union City'
where hacker_location = 'Union CIty, California, United States';

update hacker_location_2022
set City = 'Oakland'
where hacker_location = 'Oakland, California, United States';

update hacker_location_2022
set City = 'Princeton'
where hacker_location = 'Princeton, New Jersey, United States';

update hacker_location_2022
set City = 'Palm Coast'
where hacker_location = 'Palm Coast, Florida, United States';

update hacker_location_2022
set City = 'Sherwood'
where hacker_location = 'Sherwood, Arkansas, United States';

update hacker_location_2022
set City = 'Myrtle Beach'
where hacker_location = 'Myrtle Beach, South Carolina, United States';

update hacker_location_2022
set City = 'Englewood Cliffs'
where hacker_location = 'Englewood Cliffs, New Jersey, United States';

update hacker_location_2022
set City = 'Pleasant Hill'
where hacker_location = 'Pleasant Hill, California, United States';

update hacker_location_2022
set City = 'Savannah'
where hacker_location = 'Savannah, Georgia, United States';

update hacker_location_2022
set City = 'Hoover'
where hacker_location = 'Hoover, Alabama, United States';

update hacker_location_2022
set City = 'Columbus'
where hacker_location = 'Columbus, Ohio, United States';

update hacker_location_2022
set City = 'Scarsdale'
where hacker_location = 'Scarsdale, New York, United States';

update hacker_location_2022
set City = 'Metuchen'
where hacker_location = 'Metuchen, New Jersey, United States';

update hacker_location_2022
set City = 'Edmonds'
where hacker_location = 'Edmonds, Washington, United States';

update hacker_location_2022
set City = 'Key West'
where hacker_location = 'Key West, Florida, United States';

update hacker_location_2022
set City = 'Oakland Park'
where hacker_location = 'Oakland Park, Florida, United States';

update hacker_location_2022
set City = 'Fairfield'
where hacker_location = 'Fairfield, California, United States';

update hacker_location_2022
set City = 'Markham'
where hacker_location = 'Markham, Illinois, United States';

update hacker_location_2022
set City = 'Delray Beach'
where hacker_location = 'Delray Beach, Florida, United States';

update hacker_location_2022
set City = 'Bainbridge Island'
where hacker_location = 'Bainbridge Island, Washington, United States';

update hacker_location_2022
set City = 'Ithaca'
where hacker_location = 'Ithaca, New York, United States';

update hacker_location_2022
set City = 'Arlington'
where hacker_location = 'Arlington, Virginia, United States';

update hacker_location_2022
set City = 'Hoboken'
where hacker_location = 'Hoboken, New York City, United States';

update hacker_location_2022
set State = 'New York'
where hacker_location = 'Hoboken, New York City, United States';

update hacker_location_2022
set City = 'Winter Park'
where hacker_location = 'Winter Park, Florida, United States';

update hacker_location_2022
set City = 'Opa-locka'
where hacker_location = 'Opa-locka, Florida, United States';

update hacker_location_2022
set City = 'Plantation'
where hacker_location = 'Plantation, Florida, United States';

update hacker_location_2022
set City = 'Ames'
where hacker_location = 'Ames, Iowa, United States';

update hacker_location_2022
set City = 'Naples'
where hacker_location = 'Naples, Florida, United States';

update hacker_location_2022
set City = 'Schwenksville'
where hacker_location = 'Schwenksville, Pennsylvania, United States';

update hacker_location_2022
set State = ' '
where hacker_location = 'Warsaw, Poland';

update hacker_location_2022
set State = ' '
where hacker_location = 'Vantaa, Finland';

update hacker_location_2022
set Country = replace(Country, 'Warsaw, Poland', 'Poland');

update hacker_location_2022
set Country = replace(Country, 'Vantaa, Finland', 'Finland');

update hacker_location_2022
set Country = replace(Country, 'Uttarakhand, India', 'India');

update hacker_location_2022
set City = 'Dehradun'
where hacker_location = 'Dehradun, Uttarakhand, India';

update hacker_location_2022
set State = ' '
where hacker_location = 'Dehradun, Uttarakhand, India';

# Double Checking Updates

select distinct City
from hacker_location_2022;  

select *
from hacker_location_2022
where city = 'Vermont';

update hacker_location_2022
set City = 'Burlington'
where hacker_location = 'Burlington, Vermont, United States';

select *
from hacker_location_2022
where city = 'Florida';

update hacker_location_2022
set City = 'Melbourne'
where hacker_location = 'Melbourne, Florida, United States';

update hacker_location_2022
set City = 'Jacksonville'
where hacker_location = 'Jacksonville, Florida, United States';

select *
from hacker_location_2022
where city = 'New York';

update hacker_location_2022
set City = 'Long Island'
where hacker_location = 'Long Island, New York, United States';

select *
from hacker_location_2022
where city = 'Ontario';

update hacker_location_2022
set City = 'Waterloo'
where hacker_location = 'Waterloo, Ontario, Canada';

select *
from hacker_location_2022
where city = 'Colorado';

update hacker_location_2022
set City = 'Boulder'
where hacker_location = 'Colorado, United States';

select *
from hacker_location_2022
where state = 'England';

select sum(combo_count)
from hacker_location_2022;

select count(id)
from hacker_info_2022;

select sum(combo_count)
from hacker_location_2022
where State = 'Florida';

select sum(combo_count)
from hacker_location_2022
where City = 'Miami';

select *
from hacker_location_2022
where City = 'Miami';

select count(*)
from hacker_location_2022
where City = 'Hialeah';

select *
from hacker_location_2022;

select *
from hacker_location_info_2022;

select sum(combo_count)
from hacker_location_2022
where State = 'New York';

select sum(combo_count)
from hacker_location_2022
where City = 'Manhattan';

select *
from hacker_location_2022
where City = 'Westminster';

#Mailer Lite

drop table newsletter_raw_data;

select left(Subscribed,char_length(Subscribed)-8)
from newsletter_raw_data;

select trim('00:00:00' from Subscribed) AS Trimmed 
from newsletter_raw_data;

select replace(trim(Subscribed), ' 00:00:00', '')
from newsletter_raw_data;

select Subscribed,
     SUBSTRING(Subscribed, 1, char_length(Subscribed) - 8) AS Subscribed_Date
	 from newsletter_raw_data;

#Using trim with my update clause isnt working i'm not sure why?
update newsletter_raw_data
set Subscribed = replace(trim(Subscribed), ' 00:00:00', ' ');

update newsletter_raw_data
set Subscribed = SUBSTRING(Subscribed, 1, char_length(Subscribed) - 8);


#Altered the table to make the 'Subscribed' data text to be able to manipulate its date format
#The below code updated it correctly.
update newsletter_raw_data
set Subscribed = str_to_date(date_format(Subscribed, '%Y-%m-%d'), '%Y-%m-%d');

select *
from newsletter_raw_data;

# % of Newsletter Subscribers That Registered For MHW 

truncate event_registered_2023;

load data infile '/Users/pc3/Desktop/Beyond_Function_LLC/Miami_Hack_Week/Total_Registered_2023.csv' ignore into table event_registered_2023;

select *
from event_registered_2023;

select * 
from newsletter_raw_data;

drop table attendees_2023;

create table attendees_2023 (
21_subs text,
21_to_23_subs text,
22_subs text,
22_to_23_subs text,
23_subs text,
23_to_23_subs text
);

truncate attendees_2023;

select *
from attendees_2023;

insert into attendees_2023 (21_to_23_subs)
select newsletter_raw_data.Subscriber
from newsletter_raw_data
inner join event_registered_2023 on event_registered_2023.email=newsletter_raw_data.Subscriber
where newsletter_raw_data.Subscribed = 2021;

insert into attendees_2023 (21_subs)
select Subscriber
from newsletter_raw_data
where Subscribed = 2021;

insert into attendees_2023 (22_to_23_subs)
select newsletter_raw_data.Subscriber
from newsletter_raw_data
inner join event_registered_2023 on event_registered_2023.email=newsletter_raw_data.Subscriber
where newsletter_raw_data.Subscribed = 2022;

insert into attendees_2023 (22_subs)
select Subscriber
from newsletter_raw_data
where Subscribed = 2022;

insert into attendees_2023 (23_to_23_subs)
select newsletter_raw_data.Subscriber
from newsletter_raw_data
inner join event_registered_2023 on event_registered_2023.email=newsletter_raw_data.Subscriber
where newsletter_raw_data.Subscribed = 2023;

insert into attendees_2023 (23_subs)
select Subscriber
from newsletter_raw_data
where Subscribed = 2023;

select count(22_subs)
from attendees_2023;

select *
from attendees_2023;

create table sub_attendees_2023(
	email_2021 text,
    email_2022 text,
    email_2023 text
);


#% of Newsletter attendees That went to Luma Events 

select count(distinct 21_to_23_subs) + count(distinct 22_to_23_subs) + count(distinct 23_to_23_subs) As temp_table
from attendees_2023;

select count(distinct 21_to_23_subs)
from attendees_2023;

select count(distinct _1)
from luma_events_2023;

select _1
from luma_events_2023;

select 21_to_23_subs
from attendees_2023;

select count(distinct attendees_2023.21_to_23_subs)
from attendees_2023
inner join luma_events_2023 event2 on attendees_2023.21_to_23_subs = event2._2;

SELECT count(distinct attendees_2023.21_to_23_subs)
FROM attendees_2023
INNER JOIN luma_events_2023 event1 ON attendees_2023.21_to_23_subs = event1._1
INNER JOIN luma_events_2023 event2 ON attendees_2023.21_to_23_subs = event2._2
INNER JOIN luma_events_2023 event3 ON attendees_2023.21_to_23_subs = event3._3
INNER JOIN luma_events_2023 event4 ON attendees_2023.21_to_23_subs = event4._4
INNER JOIN luma_events_2023 event5 ON attendees_2023.21_to_23_subs = event5._5
INNER JOIN luma_events_2023 event6 ON attendees_2023.21_to_23_subs = event6._6
INNER JOIN luma_events_2023 event7 ON attendees_2023.21_to_23_subs = event7._7
INNER JOIN luma_events_2023 event8 ON attendees_2023.21_to_23_subs = event8._8
INNER JOIN luma_events_2023 event9 ON attendees_2023.21_to_23_subs = event9._9;

SHOW VARIABLES LIKE 'tmpdir';

select count(distinct attendees_2023.22_to_23_subs)
from attendees_2023
inner join luma_events_2023 on attendees_2023.22_to_23_subs = luma_events_2023._2;

SELECT *
FROM attendees_2023
JOIN luma_events_2023 USING (_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16,
_17, _18, _19, _20, _21, _22, _23, _24, _25, _26, _27, _28, _29, _30, _31, _32, _33, _34, _35, _36,
_37, _38, _39, _40, _41, _42, _43, _44, _45, _46, _47, _48, _49, _50, _51, _52, _53, _54, _55);

#loading in all luma event emails in one column because doing a large amount of joins will crash my laptop lol

select count(*)
from all_luma_events_2023;

select *
from all_luma_events_2023;

select count(distinct attendees_2023.21_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.21_to_23_subs = all_luma_events_2023.emails;

select count(distinct 21_to_23_subs)
from attendees_2023;

select count(distinct attendees_2023.22_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.22_to_23_subs = all_luma_events_2023.emails;

select count(distinct 22_to_23_subs)
from attendees_2023;

select count(distinct attendees_2023.23_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.23_to_23_subs = all_luma_events_2023.emails;

select count(distinct 23_to_23_subs)
from attendees_2023;

alter table all_luma_events_2023
add column 21_subs_total int;

alter table all_luma_events_2023
add column 21_subs_at_events int;

alter table all_luma_events_2023
add column 22_subs_total int;

alter table all_luma_events_2023
add column 22_subs_at_events int;

alter table all_luma_events_2023
add column 23_subs_total int;

alter table all_luma_events_2023
add column 23_subs_at_events int;

#trying updating instead of inserting since inserting will allocate output in the last row

select *
from all_luma_events_2023;

select *
from attendees_2023;

update all_luma_events_2023 
set 21_subs_at_events = (
select count(distinct attendees_2023.21_to_23_subs)
from attendees_2023
where attendees_2023.21_to_23_subs = all_luma_events_2023.emails);

update all_luma_events_2023
set 21_subs_at_events = NULL
where 21_subs_at_events = 0;

update all_luma_events_2023
set 21_subs_at_events = NULL
where 21_subs_at_events = 1;

#updating isn't what I was looking for, so just inserting into table

insert into all_luma_events_2023 (21_subs_at_events)
select count(distinct attendees_2023.21_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.21_to_23_subs = all_luma_events_2023.emails;

insert into all_luma_events_2023 (21_subs_total)
select count(distinct 21_to_23_subs)
from attendees_2023;

insert into all_luma_events_2023 (22_subs_at_events)
select count(distinct attendees_2023.22_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.22_to_23_subs = all_luma_events_2023.emails;

insert into all_luma_events_2023 (22_subs_total)
select count(distinct 22_to_23_subs)
from attendees_2023;

insert into all_luma_events_2023 (23_subs_at_events)
select count(distinct attendees_2023.23_to_23_subs)
from attendees_2023
inner join all_luma_events_2023 on attendees_2023.23_to_23_subs = all_luma_events_2023.emails;

insert into all_luma_events_2023 (23_subs_total)
select count(distinct 23_to_23_subs)
from attendees_2023;

select *
from all_luma_events_2023;

# Lastly: % of General attendees That went to Luma Events

select count(distinct email)
from event_registered_2023
where num_events > 0;

select count(distinct email)
from event_registered_2023;

select *
from all_luma_events_2023;

select count(distinct event_registered_2023.email)
from event_registered_2023
inner join all_luma_events_2023 on event_registered_2023.email = all_luma_events_2023.emails;

create table registered_that_attended_luma (
  mhw_registered text,
  luma_registered text
);

insert into registered_that_attended_luma (mhw_registered)
select distinct email
from event_registered_2023;

insert into registered_that_attended_luma (luma_registered)
select distinct event_registered_2023.email
from event_registered_2023
inner join all_luma_events_2023 on event_registered_2023.email = all_luma_events_2023.emails;

select *
from registered_that_attended_luma;
