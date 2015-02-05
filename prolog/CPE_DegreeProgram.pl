%%%%%%%%%%%%%%Computer Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Computer Engineering
satisfyCPE('BS',List) :-
satisfyCourses(['MATH 162','ECE 101','PHYC 160','ECE 131','MATH 163','ECE 231','PHYC 161','PHYC 161L','ENGL 120','ECE 203','ECE 238L','MATH 316','ENGL 219','ECE 206L','ECE 213','MATH 264','ECE 330','ECE 321','MATH 327','ECE 314','ECE 377','ECE 331','ECE 344L','ECE 340','ECE 419','ECE 437','ECE 420','ECE 440'],List,Z,Newlist1),!,
satisfyRequirement('ECON 105 or ECON 106',Newlist1,Newlist2,1),!,
satisfyRequirement('ENGL 110',Newlist2,Newlist3),!,
satisfyRequirement('CPE Science with Lab',Newlist3,Newlist4),!,
satisfyRequirement('CPE Math Elective',Newlist4,Newlist5,1),!,
satisfyRequirement('CPE Track Elective',Newlist5,Newlist6),!,
satisfyRequirement('Humanities',Newlist6,Newlist7,2),!,
satisfyRequirement('Foreign Language',Newlist7,Newlist8,1),!,
satisfyRequirement('Fine Arts',Newlist8,Newlist9,1),!,
satisfyRequirement('Social Behavior Science',Newlist9,Newlist10,1),!.
