/* ROOM */

roomcap(z06,10).
roomcap(z11,10).

roomeqp(z06,[projector]).
roomeqp(z11,[hcapped]).

/* OCCUPANY */

where(cse341,z06).
where(cse331,z06).
where(cse343,z11).
where(cse321,z11).

when(cse341,8).
when(cse341,9).
when(cse341,10).
when(cse341,11).

when(cse331,13).
when(cse331,14).
when(cse331,15).

when(cse343,8).
when(cse343,9).
when(cse343,10).
when(cse343,11).

when(cse321,14).
when(cse321,15).
when(cse321,16).

/* COURSE */
courseinstructor(cse341,genc).
courseinstructor(cse343,turker).
courseinstructor(cse331,bayrakci).
courseinstructor(cse321,gozupek).

coursecapacity(cse341,10).
coursecapacity(cse343, 6).
coursecapacity(cse331, 5).
coursecapacity(cse321,10).

coursehour(cse341, 4).
coursehour(cse343, 3).
coursehour(cse331, 3).
coursehour(cse321, 4).

courseclass(cse341, z06).
courseclass(cse343, z11).
courseclass(cse331, z06).
courseclass(cse321, z11).

courseneed(cse341,[projector]).
courseneed(cse343,[hcapped,projector]).
courseneed(cse331,[hcapped]).
courseneed(cse321,[]).


/* STUDENT */

studentcourse(1 ,[cse341,cse343,cse321]).
studentcourse(2 ,[cse341,cse343]).
studentcourse(3 ,[cse341,cse331]).
studentcourse(4 ,[cse341]).
studentcourse(5 ,[cse343,cse331]).
studentcourse(6 ,[cse341,cse343,cse331]).
studentcourse(7 ,[cse341,cse343]).
studentcourse(8 ,[cse341,cse331]).
studentcourse(9 ,[cse341]).
studentcourse(10,[cse341,cse321]).
studentcourse(11,[cse341,cse321]).
studentcourse(12,[cse343,cse321]).
studentcourse(13,[cse343,cse321]).
studentcourse(14,[cse343,cse321]).
studentcourse(15,[cse343,cse321]).

studenthcapped(1 ,no).
studenthcapped(2 ,no).
studenthcapped(3 ,no).
studenthcapped(4 ,no).
studenthcapped(5 ,no).
studenthcapped(6 ,yes).
studenthcapped(7 ,no).
studenthcapped(8 ,yes).
studenthcapped(9 ,no).
studenthcapped(10,no).
studenthcapped(11,no).
studenthcapped(12,no).
studenthcapped(13,no).
studenthcapped(14,no).
studenthcapped(15,yes).


cmplist([], []).
cmplist([H1|T1], [H2|T2]):- H1 = H2, cmplist(T1, T2).

/* INSTRUCTOR */
inscourse(genc,cse341).
inscourse(turker,cse343).
inscourse(bayrakci,cse331).
inscourse(gozupek,cse321).

insneed(genc,projector).
insneed(turker,smartboard).
insneed(gozupek,smartboard).

/* 1. sorgu */

conflicts(X,Y):- when(X, XTIME),
			     when(Y, YTIME),
			     (XTIME =:= YTIME).


/* 2. sorgu ve 3.sorgu */

assign(RoomID,CourseID):-	roomcap(RoomID,C1),coursecapacity(CourseID,C2), C1 >= C2,
							roomeqp(RoomID,Eq1),courseneed(CourseID,Eq2), cmplist(Eq1,Eq2).

/* 4. sorgu ve 5. sorgu */

 enroll(StudentID,CourseID):- studentcourse(StudentID,CourseList), 
 							  studenthcapped(StudentID,Reply), 
 							  courseneed(CourseID,Eqlist),
 							  not(member(CourseID,CourseList)),
 							  (Reply==no-> not(member([],Eqlist)); member(hcapped,Eqlist)).

