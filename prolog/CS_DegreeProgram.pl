%%%%%%%%%%%%%%Computer Science Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Computer Science
satisfyCS('BS',List) :-
satisfyCourses(['MATH 162','CS 152L','ENGL 120','MATH 163','CS 251L','CS 261','ECE 238L','CS 241L','CS 293','MATH 314','CS 351L','CS 375','STAT 345','CS 361L','CS 357L','CS 362L','CS 341L','CS 460','CS 481'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
satisfyRequirement('Humanities',Newlist2,Newlist3,2),!,
satisfyRequirement('Foreign Language',Newlist3,Newlist4,1),!,
satisfyRequirement('Fine Arts',Newlist4,Newlist5,1),!,
satisfyRequirement('Social Behavior Science',Newlist5,Newlist6,2),!.



