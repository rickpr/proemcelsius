%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Electrical Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('EE Completeness',X):- X=['ECE 381','ECE 345','ECE 371','ECE 322L','ECE 360','ECE 341'].
courseList('EE Signals and Communication track',X):- X=['ECE 439','ECE 441','ECE 442'].
courseList('EE Systems and Controls track',X):-X=['ECE 446'].
courseList('EE Electromagnetics track',X):-X=['ECE 439','ECE 464'].
courseList('EE Microelectronics track',X):-X=['ECE 474L','ECE 487'].
courseList('EE Computer Systems (Hardware) track',X):-X=['ECE 338','ECE 438'].
courseList('EE Computer Systems (Software) track',X):-X=['ECE 231','ECE 331'].
courseList('EE Energy/Power Systems track',X):-X=['ECE 482','ECE 483','ECE 484','ECE 488'].
courseList('EE Optoelectronics track',X):-X=['ECE 471','ECE 475'].

/**
satisfyRequirement('EE Track Elective',List,Newlist):-
(courseList('EE Signals and Communication track',L1),checkRequirement('EE Signals and Communication track',List,L1,2,A)), 
(courseList('EE Systems and Controls track',L2),checkRequirement('EE Systems and Controls track',List,L2,2,B)),
(courseList('EE Electromagnetics track',L3),checkRequirement('EE Electromagnetics track',List,L3,2,C)), 
(courseList('EE Microelectronics track',L4),checkRequirement('EE Microelectronics track',List,L4,2,D)), 
(courseList('EE Computer Systems(Hardware) track',L5),checkRequirement('EE Computer Systems(Hardware) track',List,L5,2,E)), 
(courseList('EE Computer Systems(Software) track',L6),checkRequirement('EE Computer Systems(Software) track',List,L6,2,F)),
(courseList('EE Energy/Power Systems track',L7),checkRequirement('EE Energy/Power Systems track',List,L7,2,G)), 
(courseList('EE Optoelectronics track',L8),checkRequirement('EE Optoelectronics track',List,L8,2,H)),
longest([A,B,C,D,E,F,G,H],X),deletelist(List,X,Newlist).
*/

satisfyRequirement('EE Track Elective',List,Newlist):-
courseList('EE Signals and Communication track',L1),
intersection(L1,List,Z1),
courseList('EE Systems and Controls track',L2),
intersection(L2,List,Z2),
courseList('EE Electromagnetics track',L3),
intersection(L3,List,Z3),
courseList('EE Microelectronics track',L4),
intersection(L4,List,Z4),
courseList('EE Computer Systems (Hardware) track',L5),
intersection(L5,List,Z5),
courseList('EE Computer Systems (Software) track',L6),
intersection(L6,List,Z6),
courseList('EE Energy/Power Systems track',L7),
intersection(L7,List,Z7),
courseList('EE Optoelectronics track',L8),
intersection(L8,List,Z8),
longest([Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8],Z),length(Z,N),(N>=2 ->select(2,Z,X),deletelist(List,X,Newlist),write('EE Track Elective'),write('------is satisfied------'),write(X),nl;deletelist(List,Z,Newlist),write('EE Track Elective'),write('------is NOT satisfied------'),write(Z),nl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Civil Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('CE Breadth Elective Construction',X):-X=['CE 455','CE 473','CE 573','CE 474','CE 574','CE 475','CE 575','CE 477','CE 577','CE 478','CE 578','CE 491','CE 578','CE 598'], write(X).
courseList('CE Breadth Elective Environmental',X):-X=['CE 433','CE 533','CE 435','CE 535','CE 436','CE 536','CE 437L','CE 537L','CE 491','CE 531','CE 428','CE 538','CE 539'].
courseList('CE Breadth Elective Geotechnical',X):-X=['CE 462','CE 562','CE 463','CE 563','CE 466','CE 566','CE 567'].
courseList('CE Breadth Elective Structures',X):-X=['CE 411','CE 511','CE 413','CE 513','CE 424','CE 524','CE 521','CE 448','CE 548'].
courseList('CE Breadth Elective Transportation',X):-X=['CE 481','CE 581','CE 482','CE 582','CE 491'].
courseList('CE Breadth Elective Water Resources',X):-X=['CE 440','CE 540','CE 441','CE 541','CE 442','CE 547','CE 598'].

%% CE Breadth Elective......
satisfyRequirement('CE Breadth Elective',List,Newlist,DepthCourses,N):-
courseList('CE Breadth Elective Construction',L1),
(intersectsAtLeastZ(L1,List,1,[],Z1)-> M1 is N+1,deletelist(L1,Z1,L11),append([],L11,L111),append([],Z1,X1);L111=[],M1=N,X1=[]),
courseList('CE Breadth Elective Environmental',L2),
(intersectsAtLeastZ(L2,List,1,[],Z2)-> M2 is M1+1,deletelist(L2,Z2,L22),append(L111,L22,L222),append(X1,Z2,X2);L222=L111,M2=M1,X2=X1),
courseList('CE Breadth Elective Geotechnical',L3),
(intersectsAtLeastZ(L3,List,1,[],Z3)-> M3 is M2+1,deletelist(L3,Z3,L33),append(L222,L33,L333),append(X2,Z3,X3);L333=L222,M3=M2,X3=X2),
courseList('CE Breadth Elective Structures',L4),
(intersectsAtLeastZ(L4,List,1,[],Z4)-> M4 is M3+1,deletelist(L4,Z4,L44),append(L333,L44,L444),append(X3,Z4,X4);L444=L333,M4=M3,X4=X3),
courseList('CE Breadth Elective Transportation',L5),
(intersectsAtLeastZ(L5,List,1,[],Z5)-> M5 is M4+1,deletelist(L5,Z5,L55),append(L444,L55,L555),append(X4,Z5,X5);L555=L444,M5=M4,X5=X4),
courseList('CE Breadth Elective Water Resources',L6),
(intersectsAtLeastZ(L6,List,1,[],Z6)-> M6 is M5+1,deletelist(L6,Z6,L66),append(L555,L66,L666),append(X5,Z6,X6);L666=L555,M6=M5,X6=X5),
(M6 >=4 -> select(4,X6,X7),deletelist(List,X7,Newlist),write('CE Breadth Elective'),write('------is satisfied------'),write(X7),nl;deletelist(List,X6,Newlist),write('CE Breadth Elective'),write('------is NOT satisfied------'),write(X6),nl),DepthCourses=L666.
         
%% CE Depth Elective........
satisfyRequirement('CE Depth Elective',DepthCourses,List,Newlist,N):-checkRequirementDelete('CE Depth Elective',List,DepthCourses,N,Newlist).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Construction Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyRequirement('CONE Science Elective',List,Newlist):-
(member('EPS 101',List)->del('EPS 101',List,Newlist),write('CONE Science Elective'),write('------is satisfied------'),write(['EPS 101']),nl);
courseList('CHEM 122 and CHEM 124L',L1),
intersection(L1,List,X),length(X,N)->(N >=2,deletelist(List,X,Newlist),write('CONE Science Elective'),write('------is satisfied------'),write(X),nl;deletelist(List,X,Newlist),write('CONE Science Elective'),write('------is NOT satisfied------'),write(X),nl);
write('CONE Science Elective'),write('------is NOT satisfied'),nl.

satisfyRequirement('CONE Engineering Elective or CONE Science Elective',List,Newlist):-
courseList('ECE 203 or ME 301',L1),
intersectsAtLeastZ(L1,List,1,[],Z)->(deletelist(List,Z,Newlist),write('CONE Engineering Elective or CONE Science Elective'),write('------is satisfied------'),write(Z),nl);
(member('EPS 101',List)->del('EPS 101',List,Newlist),write('CONE Engineering Elective or CONE Science Elective'),write('------is satisfied------'),write(['EPS 101']),nl);
courseList('CHEM 122 and CHEM 124L',L2),
intersection(L2,List,X),length(X,N)->(N >=2,deletelist(List,X,Newlist),write('CONE Engineering Elective or CONE Science Elective'),write('------is satisfied------'),write(X),nl;deletelist(List,X,Newlist),write('CONE Engineering Elective or CONE Science Elective'),write('------is NOT satisfied------'),write(X),nl);
write('CONE Engineering Elective or CONE Science Elective'),write('------is NOT satisfied'),nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Construction Mangement Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('CONM Construction Elective',X):-X=['ARCH 385', 'CRP 433', 'CRP 435', 'CRP 465', 'CRP 466', 'CRP 480', 'CRP 485', 'CE 382', 'EPS 333', 'LA 335', 'LA 480'].
courseList('CONM Management Elective',X):-X=['MGMT 306', 'MGMT 308', 'MGMT 322', 'MGMT 324', 'MGMT 326', 'MGMT 328', 'MGMT 329', 'MGMT 330', 'MGMT 459'].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Computer Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('CPE Science',X):-X=['BIOL 110','BIOL 123','CHEM 121','PHYC 262','ASTR 270','ASTR 271'].
courseList('CPE Lab',X):- X=['BIOL 112L','BIOL 124L','CHEM 123L','PHYC 262L','ASTR 270L','ASTR 271L'].
courseList('CPE Math Elective',X):-X=['MATH 314', 'MATH 321', 'MATH 375'].
courseList('CPE Hardware track',X):-X=['ECE 338','ECE 438'].
courseList('CPE Software track',X):-X=['ECE 335','ECE 435'].

satisfyRequirement('CPE Track Elective',List,Newlist):-
courseList('CPE Hardware track',L1),
intersection(L1,List,Z1),
courseList('CPE Software track',L2),
intersection(L2,List,Z2),
longest([Z1,Z2],Z),length(Z,N),(N>=2 ->select(2,Z,X),deletelist(List,X,Newlist),write('CPE Track Elective'),write('------is satisfied------'),write(X),nl;deletelist(List,Z,Newlist),write('CPE Track Elective'),write('------is NOT satisfied------'),write(Z),nl).

satisfyRequirement('CPE Science with Lab',List,Newlist):-
(member('BIOL 201',List)->del('BIOL 201',List,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(['BIOL 201']),nl);
(member('BIOL 202',List)->del('BIOL 202',List,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write('BIOL 202'),nl);
(courseList('BIOL 110 and BIOL 112L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('BIOL 123 and BIOL 124L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('CHEM 121 and CHEM 123L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('PHYC 262 and PHYC 262L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('ASTR 270 and ASTR 270L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('ASTR 271 and ASTR 271L',L1),intersectsAtLeastZ(L1,List,2,[],Z)->deletelist(List,Z,Newlist),write('CPE Science with Lab'),write('------is satisfied------'),write(Z),nl);
(courseList('CPE Science',L1),(intersectsAtLeastZ(L1,List,1,[],Z1)->deletelist(List,Z1,List1);List1=List,Z1=[]),courseList('CPE Lab',L2),(intersectsAtLeastZ(L2,List1,1,[],Z2)->deletelist(List1,Z2,Newlist);Newlist=List1,Z2=[]),append(Z1,Z2,Z),write('CPE Science with Lab'),write('------is NOT satisfied------'),write(Z),nl).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Chemical Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

courseList('CHE Basic Science Concentration',X):-X=['PHYC 262','BIOL 201L'].
courseList('CHE Basic Engineering Elective',X):-X=['CHNE 213','CE 202','ECE 203'].

courseList('CHE Chemical Process Engineering Concentration',X):-X=['CHEM 302','CHEM 311','CHEM 312'].
courseList('CHE Bioengineering Concentration',X):-X=['CHEM 302','CHEM 312','BIOL 202', 'BIOL 237', 'BIOL 238', 'BIOL 239L', 'BIOC 423', 'CHEM 421'].
courseList('CHE Materials Processing Concentration',X):-X=['CHEM 311', 'CHEN 312', 'CHEM 431', 'CHNE 475'].
courseList('CHE Semiconductor Manufacturing Concentration',X):-X=['CHEM 311', 'CHEM 312', 'CHEM 431', 'ECE 371L'].
courseList('CHE Environmental Engineering Concentration',X):-X=['CHEM 302', 'CHEM 312','BIOC 423','BIOL 202', 'BIOL 237', 'BIOL 238', 'BIOL 239L', 'CHEM 421'].

satisfyRequirement('CHE Basic Science Concentration',List,Newlist,X):-courseList('CHE Basic Science Concentration',L),intersectsAtLeastZ(L,List,1,[],X),deletelist(List,X,Newlist),write('CHE Basic Science Concentration'),write('------is satisfied------'),write(X),nl;X=[],Newlist=List,write('CHE Basic Science Concentration'),write('------is NOT satisfied------'),write(X),nl.


satisfyRequirement('CHE Advanced Chemistry Concentration',List,Newlist,X):-
(X==['PHYC 262']->
courseList('CHE Chemical Process Engineering Concentration',L1),intersection(L1,List,Z1),
courseList('CHE Materials Processing Concentration',L2),intersection(L2,List,Z2),
courseList('CHE Semiconductor Manufacturing Concentration',L3),intersection(L3,List,Z3),
longest([Z1,Z2,Z3],Z),length(Z,N),(N>=3 ->select(3,Z,Y),deletelist(List,Y,Newlist),write('CHE Advanced Chemistry Concentration'),write('------is satisfied------'),write(Y),nl;deletelist(List,Z,Newlist),write('CHE Advanced Chemistry Concentration'),write('------is NOT satisfied------'),write(Z),nl));
(X==['BIOL 201L']->
courseList('CHE Bioengineering Concentration',L1),intersection(L1,List,Z1),
courseList('CHE Materials Processing Concentration',L2),intersection(L2,List,Z2),
courseList('CHE Environmental Engineering Concentration',L3),intersection(L3,List,Z3),
longest([Z1,Z2,Z3],Z),length(Z,N),(N>=3 ->select(3,Z,Y),deletelist(List,Y,Newlist),write('CHE Advanced Chemistry Concentration'),write('------is satisfied------'),write(Y),nl;deletelist(List,Z,Newlist),write('CHE Advanced Chemistry Concentration'),write('------is NOT satisfied------'),write(Z),nl));
write('CHE Advanced Chemistry Concentration'),write('------is NOT satisfied------'),Newlist=List,write([]),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules exclusively used by 'Mechanical Engineering Degree Program'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('Foreign Language or ME 406L',X):- X=['ARAB 101', 'ARAB 102', 'ARAB 111', 'ARAB 112', 'ARAB 201', 'ARAB 202', 'ARAB 211', 'ARAB 212', 'CHIN 101', 'CHIN 102', 'CHIN 111', 'CHIN 112', 'CHIN 201', 'CHIN 202', 'FREN 101', 'FREN 102', 'FREN 175', 'FREN 201', 'FREN 202', 'FREN 203', 'FREN 276', 'GRMN 101', 'GRMN 102', 'GRMN 201', 'GRMN 202', 'GRMN 276', 'ITAL 101', 'ITAL 102', 'ITAL 175', 'ITAL 176', 'JAPN 101', 'JAPN 102', 'JAPN 201', 'JAPN 202', 'NVJO 101', 'NVJO 102', 'NVJO 103', 'NVJO 105', 'NVJO 201', 'NVJO 202', 'NVJO 206', 'PORT 101', 'PORT 102', 'PORT 275', 'PORT 276', 'PORT 277', 'RUSS 101', 'RUSS 201', 'RUSS 202', 'SIGN 201', 'SIGN 210', 'SIGN 211', 'SIGN 212', 'SIGN 214', 'SPAN 101', 'SPAN 102', 'SPAN 103', 'SPAN 104', 'SPAN 111', 'SPAN 112', 'SPAN 200', 'SPAN 201', 'SPAN 202', 'SPAN 203', 'SPAN 211', 'SPAN 212', 'SPAN 275', 'SPAN 276', 'SWAH 101', 'SWAH 102', 'ME 406L'].
courseList('ME 460 or ME 408',X):- X=['ME 460', 'ME 408'].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rules that are common. These rules can be used by different degree programs.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
courseList('Humanities',X):- X=['AFST 104', 'AMST 186', 'CCS 201', 'CLCS 222', 'CLCS 224', 'CLST 107', 'CLST 204', 'CLST 205', 'COMP 222', 'COMP 224', 'ENGL 150', 'ENGL 292', 'ENGL 293', 'GEOG 140', 'HIST 101', 'HIST 102', 'HIST 161', 'HIST 162', 'HIST 181', 'HIST 182', 'MLNG 101', 'NATV 150', 'PHIL 101', 'PHIL 201', 'PHIL 202', 'RELG 107', 'RELG 263', 'RELG 264', 'UHON 205'].

courseList('Foreign Language',X):- X=['ARAB 101', 'ARAB 102', 'ARAB 111', 'ARAB 112', 'ARAB 201', 'ARAB 202', 'ARAB 211', 'ARAB 212', 'CHIN 101', 'CHIN 102', 'CHIN 111', 'CHIN 112', 'CHIN 201', 'CHIN 202', 'FREN 101', 'FREN 102', 'FREN 175', 'FREN 201', 'FREN 202', 'FREN 203', 'FREN 276', 'GRMN 101', 'GRMN 102', 'GRMN 201', 'GRMN 202', 'GRMN 276', 'ITAL 101', 'ITAL 102', 'ITAL 175', 'ITAL 176', 'JAPN 101', 'JAPN 102', 'JAPN 201', 'JAPN 202', 'NVJO 101', 'NVJO 102', 'NVJO 103', 'NVJO 105', 'NVJO 201', 'NVJO 202', 'NVJO 206', 'PORT 101', 'PORT 102', 'PORT 275', 'PORT 276', 'PORT 277', 'RUSS 101', 'RUSS 201', 'RUSS 202', 'SIGN 201', 'SIGN 210', 'SIGN 211', 'SIGN 212', 'SIGN 214', 'SPAN 101', 'SPAN 102', 'SPAN 103', 'SPAN 104', 'SPAN 111', 'SPAN 112', 'SPAN 200', 'SPAN 201', 'SPAN 202', 'SPAN 203', 'SPAN 211', 'SPAN 212', 'SPAN 275', 'SPAN 276', 'SWAH 101', 'SWAH 102'].

courseList('Fine Arts',X):- X=['ARCH 121', 'ARTH 101', 'ARTH 201', 'ARTH 202', 'DANC 105', 'FA 284', 'MA 210', 'MUS 139', 'MUS 142', 'THEA 105', 'UHON 207'].

courseList('Social Behavior Science',X):- X=['AFST 109', 'CCS 109', 'NATV 109', 'SUST 109', 'WMST 109', 'AMST 182', 'AMST 185', 'ANTH 101', 'ANTH 110', 'ANTH 130', 'CRP 181', 'ECON 105', 'ECON 106', 'ENG 200', 'GEOG 102', 'LING 101', 'POLS 110', 'POLS 200', 'POLS 220', 'POLS 240', 'PSY 105', 'SOC 101', 'UHON 204'].


courseList('ENGL 110 or ENGL 113',X):-X=['ENGL 110','ENGL 113'].
courseList('ECON 105 or ECON 106',X):-X=['ECON 105','ECON 106'].
courseList('ENGL 111 and ENGL 112',X):-X=['ENGL 111','ENGL 112'].
courseList('BIOL 110 or EPS 101',X):-X=['BIOL 110','EPS 101'].
courseList('ECE 203 or ME 301',X):-X=['ECE 203','ME 301'].
courseList('CHEM 122 and CHEM 124L',X):-X=['CHEM 122','CHEM 124L'].
courseList('CHEM 121 and CHEM 123L',X):-X=['CHEM 121','CHEM 123L'].
courseList('BIOL 110 and BIOL 112L',X):-X=['BIOL 110','BIOL 112L'].
courseList('BIOL 123 and BIOL 124L',X):-X=['BIOL 123','BIOL 124L'].
courseList('PHYC 262 and PHYC 262L',X):-X=['PHYC 262','PHYC 262L'].
courseList('ASTR 270 and ASTR 270L',X):-X=['ASTR 270','ASTR 270L'].
courseList('ASTR 271 and ASTR 271L',X):-X=['ASTR 270','ASTR 270L'].
courseList('ASTR 271 and ASTR 271L',X):-X=['ASTR 270','ASTR 270L'].


satisfyRequirement(Requirement,List,Newlist,N) :- courseList(Requirement,L), checkRequirementDelete(Requirement,List,L,N,Newlist).

satisfyCourse(Course,List,Newlist) :- checkCourseDelete(Course,List,Newlist).

satisfyCourses([],X,Y,Z):- Z=X,!.
satisfyCourses([H|T],List,Newlist,Z):-satisfyCourse(H,List,Newlist),satisfyCourses(T,Newlist,Newlist1,Z).

satisfyRequirement('ENGL 110',List,Newlist) :- 
courseList('ENGL 110 or ENGL 113',L1),
intersectsAtLeastZ(L1,List,1,[],Z)->(deletelist(List,Z,Newlist),write('ENGL 110'),write('------is satisfied------'),write(Z),nl);
courseList('ENGL 111 and ENGL 112',L2),
intersection(L2,List,X),length(X,N)->(N >=2,deletelist(List,X,Newlist),write('ENGL 110'),write('------is satisfied------'),write(X),nl;deletelist(List,X,Newlist),write('ENGL 110'),write('------is NOT satisfied------'),write(X),nl);
write('ENGL 110'),write('------is NOT satisfied'),nl.











