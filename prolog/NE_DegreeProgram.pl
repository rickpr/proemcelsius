%%%%%%%%%%%%%%Nuclear Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Nuclear Engineering
satisfyNE('BS',List) :-
satisfyCourses(['MATH 162','NE 101','CHEM 121','CHEM 123L','ENGL 120','MATH 163','PHYC 160','CS 151L','CHEM 122','CHEM 124L','NE 230','MATH 264','PHYC 161','ECON 105','ENGL 219','NE 231','NE 213','MATH 316','NE 372','NE 314','PHYC 262','NE 311','NE 317','NE 323L','CE 202','NE 312','NE 313L','NE 310','NE 330','NE 410','NE 464','NE 497L','NE 462','NE 413L',Newlist34,'NE 452','NE 498L'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
%satisfyRequirement('NE Technical Elective',Newlist2,Newlist3,2),!,
satisfyRequirement('Humanities',Newlist3,Newlist4,1),!,
satisfyRequirement('Foreign Language',Newlist4,Newlist5,1),!,
satisfyRequirement('Fine Arts',Newlist5,Newlist6,1),!,
satisfyRequirement('Social Behavior Science',Newlist6,Newlist7,1),!.
