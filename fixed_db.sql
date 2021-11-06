drop database if exists basic_school_system;
create database basic_school_system;
use basic_school_system;

create table gender (
    gender_id int(11) not null auto_increment,
    gender varchar(2) not null, 
    primary key (gender_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
insert into gender values (1, "M"), (2, "F");

create table subject (
    subject_id int(11) not null auto_increment,
    subject varchar(50) not null,
    primary key (subject_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
truncate table subject;
insert into subject (subject) values ("Arabic"), ("Python"), ("MySQL");

create table student (
    st_id int(11) not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_of_date date not null,
    gender_id int(11) not null,
    primary key (st_id),
    FOREIGN KEY (gender_id) references gender (gender_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
truncate table student;
insert into student (first_name, last_name, birth_of_date, gender_id) values ("Karim", "Ibrahim", "2001-10-10", 1);

create table teacher (
    teacher_id int(11) not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_of_date date not null,
    gender_id int(11) not null,
    primary key (teacher_id),
    foreign key (gender_id) references gender (gender_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
insert into teacher values (1, "Ahmed", "Icho", "1995-10-10", 1);

create table class (
    cl_id int(11) not null auto_increment,
    teacher_id int(11) not null,
    subject_id int(11) not null, -- use the subject name to name the class on the code
    primary key(cl_id),
    foreign key (teacher_id) references teacher (teacher_id),
    foreign key (subject_id) references subject (subject_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
truncate table class;
insert into class (teacher_id, subject_id) values (1, 2);
select * from class;

create table class_to_student (
    cl_st_id int(11) not null auto_increment,
    st_id int(11) not null,
    cl_id int(11) not null,
    primary key (cl_st_id),
    foreign key (st_id) references student (st_id),
    foreign key (cl_id) references class (cl_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

truncate table class_to_student;
insert into class_to_student (st_id, cl_id) values (1, 1);
