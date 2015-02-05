%%%%%%%%%%%%%%Construction Management Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Construction Management
satisfyCONM('BS',List) :-
satisfyCourses(['MATH 121','CE 130','EPS 101','ENGL 120','MATH 123','CE 160L','CE 171','CS 150L','CE 279','MATH 180','CHEM 121','CHEM 123L','PHYC 151','CE 283','CE 371','STAT 145','MGMT 202','ENGL 219','CJ 130','CE 305','CE 350','CE 376','CE 478','MGMT 303','CE 370','CE 377','MGMT 310','CE 455','CE 474','CE 477','CE 495','MGMT 300','CE 409','CE 473','CE 475','CE 497L'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',List,Newlist1),!,
satisfyRequirement('ECON 105 or ECON 106',Newlist1,Newlist2,1),!,
satisfyRequirement('CONM Construction Elective',Newlist2,Newlist3,1),!,
satisfyRequirement('CONM Management Elective',Newlist3,Newlist4,1),!,
satisfyRequirement('Humanities',Newlist4,Newlist5,2),!,
satisfyRequirement('Fine Arts',Newlist5,Newlist6,1),!,
satisfyRequirement('Foreign Language',Newlist6,Newlist7,1),!,
satisfyRequirement('Social Behavior Science',Newlist7,Newlist8,1),!.


