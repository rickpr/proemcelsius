
%%%%%%%%%%%%%%Mechanical Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Mechanical Engineering
satisfyME('BS',List) :-
satisfyCourses(['MATH 162','CS 151L','CHEM 121','CHEM 123L','ENGL 120','MATH 163','PHYC 160','ME 160L','CHEM 122','CHEM 124L','CE 202','ME 260L','MATH 264','PHYC 161','ME 217','ME 306','MATH 316','ECE 203','ME 318L','ME 317L','ME 301','CE 302','ECON 105','ME 302','ME 360L','ME 357','ME 352L','ME 370','ME 320L','ME 459','ME 380'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
satisfyRequirement('Foreign Language or ME 406L',Newlist2,Newlist3,1),!,
satisfyRequirement('ME 460 or ME 408',Newlist3,Newlist4,1),!,
satisfyRequirement('Humanities',Newlist4,Newlist5,2),!,
satisfyRequirement('Fine Arts',Newlist5,Newlist6,1),!.


