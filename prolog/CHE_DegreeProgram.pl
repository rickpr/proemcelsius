%%%%%%%%%%%%%%Chemical Engineering Degree Program(S)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BS in Chemical Engineering
satisfyCHE('BS',List) :-
satisfyCourses(['MATH 162',
'CHBE 101','CHEM 121','CHEM 123L','ENGL 120','MATH 163','PHYC 160','CS 151L','CHEM 122','CHEM 124L','CHBE 251','MATH 264','PHYC 161','ECON 105','CHEM 301','CHEM 303L','CHEM 303L','MATH 316','CHBE 253','CHBE 302','CHBE 311','CHBE 317','CHBE 361','CHBE 318L','CHBE 318L','ENGL 219','CHBE 312','CHBE 321','CHBE 319L','CHBE 371','CHBE 418','CHBE 451','CHBE 461','CHBE 493L','CHBE 419L','CHBE 454','CHBE 494L'],List,Z,Newlist1),!,
satisfyRequirement('ENGL 110',Newlist1,Newlist2),!,
satisfyRequirement('CHE Basic Science Concentration',Newlist2,Newlist3,X),!,
satisfyRequirement('CHE Advanced Chemistry Concentration',Newlist3,Newlist4,X),!,
satisfyRequirement('CHE Basic Engineering Elective',Newlist4,Newlist5,1),!,
satisfyRequirement('Humanities',Newlist5,Newlist6,2),!,
satisfyRequirement('Fine Arts',Newlist6,Newlist7,1),!,
satisfyRequirement('Foreign Language',Newlist7,Newlist8,1),!,
satisfyRequirement('Social Behavior Science',Newlist8,Newlist9,1),!.




