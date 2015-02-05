%%%%%%%%%%%%%%Construction Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Construction Engineering
satisfyCONE('BS',List) :-
satisfyCourses(['MATH 162','CE 160L','CHEM 121','CHEM 123L','ENGL 120','MATH 163','PHYC 160','CS 151L','CE 202','MATH 264','PHYC 161','MATH 316','MGMT 202','ME 306','ENGL 219','CE 302','CE 305','CE 350','CE 376','CE 238','CE 308','CE 310','CE 360','CE 370','CE 377','STAT 345','CE 331','CE 455','CE 477','CE 495','CE 409','CE 473','CE 475','CE 499'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
satisfyRequirement('ECON 105 or ECON 106',Newlist2,Newlist3,1),!,
satisfyRequirement('CONE Science Elective',Newlist3,Newlist4),!,
satisfyRequirement('CONE Engineering Elective or CONE Science Elective',Newlist4,Newlist5),!,
satisfyRequirement('Humanities',Newlist5,Newlist6,2),!,
satisfyRequirement('Fine Arts',Newlist6,Newlist7,1),!,
satisfyRequirement('Foreign Language',Newlist7,Newlist8,1),!,
satisfyRequirement('Social Behavior Science',Newlist8,Newlist9,1),!.



