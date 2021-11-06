drop database if exists basic_school_system;
create database basic_school_system;
use basic_school_system;


create table gender (
    g_id int(11) not null auto_increment,
    gender varchar(2) not null, 
    primary key (g_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
insert into gender (gender) values ("M"), ("F");

create table subject (
    sub_id int(11) not null auto_increment,
    subject varchar(50) not null,
    primary key (sub_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

insert into subject (subject) values ("Arabic"), ("Python"), ("MySQL");

create table student (
    st_id int(11) not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    brith_of_date date not null,
    gender_id int(11) not null,
    primary key (st_id),
    foreign key gender_id references gender(g_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

create table teacher (
    teacher_id int(11) not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    brith_of_date date not null,
    gender_id int(11) not null,
    subject_id int(11) not null,
    primary key (teacher_id),
    foreign key subject_id references subject (sub_id),
    foreign key gender_id references gender (g_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
insert into teacher (first_name, last_name, birth_of_date, gender_id, subject_id) values
    ("Ahmed", "Icho", "1995-10-10", 1, 2);

create table class (
    cl_id int(11) not null auto_increment,
    teacher_id int(11) not null,
    subject_id int(11) not null, -- use the subject name to name the class on the code
    primary key(cl_id),
    foreign key teacher_id references teacher (teacher_id),
    foreign key subject_id references subject (subject_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
insert into class (teacher_id, subject_id) values ();

create table class_to_student (
    cl_st_id int(11) not null auto_increment,
    st_id int(11) not null,
    cl_id int(11) not null,
    foreign key st_id references student(st_id),
    foreign key cl_id references class(cl_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
