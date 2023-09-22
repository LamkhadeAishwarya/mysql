use Simple
create table movie
(
movie_id int primary key,
movie_name varchar(255),
Release_year int,
box_office_collection decimal(10,2)
)

create table celebrity
(
celeb_id int primary key,
celeb_name varchar(255),
celeb_bdate date,
ph_no varchar(20),
email varchar(255)
)

create table roles
(
role_id int primary key,
role_name varchar(255)
)

create table Bollywooddata
(
boll_data_id int primary key,
celeb_id int,
movie_id int,
role_id int,
foreign key(celeb_id) references celebrity(celeb_id),
foreign key(movie_id) references movie(movie_id),
foreign key(role_id) references roles(role_id)
)
