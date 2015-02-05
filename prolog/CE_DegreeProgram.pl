%%%%%%%%%%%%%%Civil Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Civil Engineering
satisfyCE('BS',List) :-
satisfyCourses(['MATH 162','CE 160L','CHEM 121','CHEM 123L','ENGL 120','MATH 163','PHYC 160','ENGL 219',
'PHYC 167','CS 151L','CE 202','CE 283','MATH 264','PHYC 161','MATH 316','STAT 345','ME 306','CE 302','CE 305','CE 331','CE 372','CE 382','CE 308','CE 335','CE 350','CE 360','CE 409','CE 499'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
satisfyRequirement('BIOL 110 or EPS 101',Newlist2,Newlist3,1),!,
satisfyRequirement('ECON 105 or ECON 106',Newlist3,Newlist4,1),!,
satisfyRequirement('ECE 203 or ME 301',Newlist4,Newlist5,1),!,
satisfyRequirement('CE Breadth Elective',Newlist5,Newlist6,DepthCourses,0),!,
satisfyRequirement('CE Depth Elective',DepthCourses,Newlist6,Newlist7,2),!,
satisfyRequirement('Humanities',Newlist7,Newlist8,2),!,
satisfyRequirement('Fine Arts',Newlist8,Newlist9,1),!,
satisfyRequirement('Foreign Language',Newlist9,Newlist10,1),!,
satisfyRequirement('Social Behavior Science',Newlist10,Newlist11,1),!.


