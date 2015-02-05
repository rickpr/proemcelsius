%%%%%%%%%%%%%%Electrical Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Electrical Engineering
satisfyEE('BS',List) :-
satisfyCourses(['MATH 162','ECE 101','PHYC 160','ECE 131','MATH 163','CHEM 121','CHEM 123L','PHYC 161','PHYC 161L','ENGL 120','ECE 203','MATH 264','MATH 316','PHYC 262','ENGL 219','ECE 206L','ECE 213','MATH 314','ECE 238L','ECE 314','ECE 321L','ECE 340','ECE 344L','ECE 419','ECE 420'],List,Z,Newlist1),!,
satisfyRequirement('ECON 105 or ECON 106',Newlist1,Newlist2,1),!,
satisfyRequirement('ENGL 110',Newlist2,Newlist3),!,
satisfyRequirement('EE Completeness',Newlist3,Newlist4,6),!,
satisfyRequirement('EE Track Elective',Newlist4,Newlist5),!,
satisfyRequirement('Humanities',Newlist5,Newlist6,2),!,
satisfyRequirement('Foreign Language',Newlist6,Newlist7,1),!,
satisfyRequirement('Fine Arts',Newlist7,Newlist8,1),!,
satisfyRequirement('Social Behavior Science',Newlist8,Newlist9,1),!.



