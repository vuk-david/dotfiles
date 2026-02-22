#!/bin/sh

nohup java -jar /home/student/web/app.war &
nohup java -jar /home/student/web/app1_1.jar &
nohup java -jar /home/student/web/app1_2.jar &
nohup java -jar /home/student/web/app2.jar &
nohup java -jar /home/student/web/app3.jar &
nohup java -jar /home/student/web/csrf.jar &