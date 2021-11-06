# make db and tables
import mysql.connector as mdb
from queries import *

def connect_to_db():
    global conn
    global cur

    conn = mdb.connect(host="localhost", user="root", password="toor")
    cur = conn.cursor()

    drop_query = " drop database if exists basic_school_system "
    cur.execute(drop_query)
    conn.commit()

    create_query = " create database basic_school_system "
    cur.execute(create_query)
    conn.commit()

    use_query = " use basic_school_system "
    cur.execute(use_query)
    conn.commit()

    print("[+] connected successfully")

def create_tables():
    query_list = [gender_query, subject_query, student_query, teacher_query, class_query, cl_to_st_query] 

    for query in query_list:
        cur.execute(query)
        conn.commit()

    print("[+] tables created successfully")


def main():
    connect_to_db()
    create_tables()

if __name__ == "__main__":
    main()
