%% This file is only used to build, check and test rules and predicates. 
del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).

deletelist([], _, []).                  
deletelist([X|Xs], Y, Z) :- member(X, Y), deletelist(Xs, Y, Z), !.
deletelist([X|Xs], Y, [X|Zs]) :- deletelist(Xs, Y, Zs).

size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.

%% append List1 and List2 into List1AndList2
append([X|Y],Z,[X|W]) :- append(Y,Z,W).
append([],X,X).


%% Check if 'String' has a substring that matches 'Name'
match(String, Name) :-
        sub_string(String, Before, _, After, ' '),
        sub_string(String, 0, Before, _, Name).


%% Check if 'X' partially matches one of the elements in the list []
matchList(X,[H|T]):- match(X,H).
matchList(X,[Y|T]):- matchList(X,T).

%% Check if there are at least N partially (subString) matches between 2 lists
matchListAll(_,List,N) :- N =< 0.
matchListAll([H|T],List,N) :- matchList(H, List), M is N-1, matchListAll(T,List,M).
matchListAll([H|T],List,N) :- matchListAll(T,List,N).
 
notmember([],X).
notmember([Y|R],X):- X\=Y,notmember(R,X).


notmemberList(List,[X|R]) :- notmember(List,X), write(X),nl,M is 1,notmemberList(List,R,M).
notmemberList(List,[X|R],M) :- notmember(List,X),write(X),nl, N is M+1, notmemberList(List,R,N).
notmemberList(List,[X|R]) :- member(X,List), notmemberList(List,R,0).
notmemberList(List,[X|R],M) :- member(X,List), notmemberList(List,R,M).
notmemberList(List,[],M) :-  M =< 0.

try(A,List,B) :- member(A,List),B is 1.


try2(List,C) :- try(a,List,B), C is B+1.

%%satisfyEEReqMath :- B is 1,(satisfyEEReqEnglish(List) -> del(X,[X|Tail],Tail).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check if an element exists in a list
member(X,[X|R]).
member(X,[Y|R]) :- member(X,R).

%% Check if there is intersection between 2 lists
intersects(X, List,Newlist) :- member(X, List),del(X,List,Newlist).
intersects([H|_],List,Newlist) :- member(H,List),del(H,List,Newlist),!.
intersects([_|T],List,Newlist) :- intersects(T,List,Newlist).

%% Check if there are at least N intersections between 2 lists
%% L is the list of courses taken by a student
%% Newlist is the new list after deleting the courses matching [H|T]
%% C is the list of courses matching [H|T]
%% L = Newlist + C 
intersectsAtLeast([],_,N,Newlist,C,X):- X=Newlist,write(C),N=<0.
intersectsAtLeast(_,_,N,Newlist,C,X) :- N =< 0,write(C),X=Newlist, !.
intersectsAtLeast([H|T],L,N,Newlist1,C,X) :- member(H,L),del(H,L,Newlist),append([H],C,C1),!, M is N-1, intersectsAtLeast(T,Newlist,M,Newlist,C1,X).
intersectsAtLeast([_|T],L,N,Newlist,C,X) :- intersectsAtLeast(T,L,N,Newlist,C,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqENGL110(List,Newlist) :- (intersects('ENGL 110',List,Newlist);intersects('ENGL 113',List,Newlist))->write('ENGL 110 is satisfied'),nl; intersectsAtLeast1(['ENGL 111','ENGL 112'],List,2,[],X) -> write('ENGL 110 is satisfied     '),write(X),nl,deletelist(List,X,Newlist);intersection(['ENGL 111','ENGL 112'],List,X),deletelist(List,X,Newlist),write('ENGL 110 is NOT satisfied    '),write(X),nl; Newlist=List,write('ENGL 110 is NOT satisfied'),nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReq('ENGL 110',List,Newlist) :- 
member('ENGL 110',List)->deletelist(List,['ENGL 110'],Newlist),write('ENGL 110------is satisfied'),nl;
member('ENGL 113',List)->deletelist(List,['ENGL 113'],Newlist),write('ENGL 110------is satisfied------'),write('ENGL 113'),nl;
intersection(['ENGL 111','ENGL 112'],List,X),length(X,N)->(N >=2,deletelist(List,X,Newlist),write('ENGL 110------is satisfied------'),write(X),nl;deletelist(List,X,Newlist),write('ENGL 110------is NOT satisfied------'),write(X),nl).

satisfyEEReq('ECON 105/106',List,Newlist) :- 
member('ECON 105',List)->deletelist(List,['ECON 105'],Newlist),write('ECON 105/6------is satisfied'),nl;
member('ECON 106',List)->deletelist(List,['ECON 106'],Newlist),write('ECON 105/6------is satisfied------'),write('ECON 106'),nl;
Newlist=List,write('ECON 105/106------is NOT satisfied').

satisfyReq('Humanities',List,Newlist) :- 
intersection(List, ['AFST 104', 'AMST 186', 'CCS 201', 'CLCS 222', 'CLCS 224', 'CLST 107', 'CLST 204', 'CLST 205', 'COMP 222', 'COMP 224', 'ENGL 150', 'ENGL 292', 'ENGL 293', 'GEOG 140', 'HIST 101', 'HIST 102', 'HIST 161', 'HIST 162', 'HIST 181', 'HIST 182', 'MLNG 101', 'NATV 150', 'PHIL 101', 'PHIL 201', 'PHIL 202', 'RELG 107', 'RELG 263', 'RELG 264', 'UHON 205'],X),length(X,N)->(N >=2,select(2,X,Y),deletelist(List,Y,Newlist),write('Humanities------are satisfied------'),write(Y),nl;deletelist(List,X,Newlist),write('Humanities------are NOT satisfied------'),write(X),nl).

satisfyReq('Foreignlanguage',List,Newlist) :- 
intersection(List,['ARAB 101', 'ARAB 102', 'ARAB 111', 'ARAB 112', 'ARAB 201', 'ARAB 202', 'ARAB 211', 'ARAB 212', 'CHIN 101', 'CHIN 102', 'CHIN 111', 'CHIN 112', 'CHIN 201', 'CHIN 202', 'FREN 101', 'FREN 102', 'FREN 175', 'FREN 201', 'FREN 202', 'FREN 203', 'FREN 276', 'GRMN 101', 'GRMN 102', 'GRMN 201', 'GRMN 202', 'GRMN 276', 'ITAL 101', 'ITAL 102', 'ITAL 175', 'ITAL 176', 'JAPN 101', 'JAPN 102', 'JAPN 201', 'JAPN 202', 'NVJO 101', 'NVJO 102', 'NVJO 103', 'NVJO 105', 'NVJO 201', 'NVJO 202', 'NVJO 206', 'PORT 101', 'PORT 102', 'PORT 275', 'PORT 276', 'PORT 277', 'RUSS 101', 'RUSS 201', 'RUSS 202', 'SIGN 201', 'SIGN 210', 'SIGN 211', 'SIGN 212', 'SIGN 214', 'SPAN 101', 'SPAN 102', 'SPAN 103', 'SPAN 104', 'SPAN 111', 'SPAN 112', 'SPAN 200', 'SPAN 201', 'SPAN 202', 'SPAN 203', 'SPAN 211', 'SPAN 212', 'SPAN 275', 'SPAN 276', 'SWAH 101', 'SWAH 102'],X),length(X,N)->(N >=1,select(1,X,Y),deletelist(List,Y,Newlist),write('Foreign Language------is satisfied------'),write(Y),nl;deletelist(List,X,Newlist),write('Foreign Language------is NOT satisfied------'),write(X),nl).

satisfyReq('Finearts',List,Newlist) :- intersection(List,['ARCH 121', 'ARTH 101', 'ARTH 201', 'ARTH 202', 'DANC 105', 'FA 284', 'MA 210', 'MUS 139', 'MUS 142', 'THEA 105', 'UHON 207'],X),length(X,N)->(N >=1,select(1,X,Y),deletelist(List,Y,Newlist),write('Foreign Language------is satisfied------'),write(Y),nl;deletelist(List,X,Newlist),write('Foreign Language------is NOT satisfied------'),write(X),nl).


satisfyReq(Requirement,List,Newlist) :- member(Requirement,List),deletelist(List,[Requirement],Newlist),write(Requirement),write('------is satisfied'),nl;Newlist=List,write(Requirement),write('------is NOT satisfied').


%%satisfyEEReqENGL120(List,Newlist) :- intersects('ENGL 120',List,Newlist)->write('ENGL 120 is satisfied'),nl; Newlist=List,write('ENGL 120 is NOT satisfied'),nl.


satisfyEEReqMATH162(List,Newlist) :- intersects('MATH 162',List,Newlist)->write('MATH 162 is satisfied'),nl; Newlist=List,write('MATH 162 is NOT satisfied'),nl.

satisfyEEReqECE101(List,Newlist) :- intersects('ECE 101',List,Newlist)->write('ECE 101 is satisfied'),nl;Newlist=List,write('ECE 101 is NOT satisfied'),nl.

satisfyEEReqPHYC160(List,Newlist) :- intersects('PHYC 160',List,Newlist)->write('PHYC 160 is satisfied'),nl;Newlist=List,write('PHYC 160 is NOT satisfied'),nl.

satisfyEEReqECE131(List,Newlist) :- intersects('ECE 131',List,Newlist)->write('ECE 131 is satisfied'),nl;Newlist=List,write('ECE 131 is NOT satisfied'),nl.

%%satisfyEEReqECON105_106(List,Newlist) :- intersectsAtLeast1(['ECON 105','ECON 106'],List,1,[],X)->write('ECON 105/106 is satisfied     '),write(X),nl,deletelist(List,X,Newlist);Newlist=List,write('ECON 105/106 is NOT satisfied'),nl.

satisfyEEReqECON105_106(List,Newlist) :- intersection(['ECON 105','ECON 106'],List,X),length(X,N),(N >= 1 -> select(1,X,Y), deletelist(List,Y,Newlist),write('ECON 105/106 is satisfied'),nl;deletelist(List,X,Newlist),write('ECON 105/106 is NOT satisfied'),nl).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqMATH163(List,Newlist) :- intersects('MATH 163',List,Newlist)->write('MATH 163 is satisfied'),nl; Newlist=List,write('MATH 163 is NOT satisfied'),nl.

satisfyEEReqCHEM121(List,Newlist) :- intersects('CHEM 121',List,Newlist)->write('CHEM 121 is satisfied'),nl; Newlist=List,write('CHEM 121 is NOT satisfied'),nl.


satisfyEEReqCHEM123L(List,Newlist) :- intersects('CHEM 123L',List,Newlist)->write('CHEM 123L is satisfied'),nl; Newlist=List,write('CHEM 123L is NOT satisfied'),nl.

satisfyEEReqPHYC161(List,Newlist) :- intersects('PHYC 161',List,Newlist)->write('PHYC 161 is satisfied'),nl; Newlist=List,write('PHYC 161 is NOT satisfied'),nl.

satisfyEEReqPHYC161L(List,Newlist) :- intersects('PHYC 161L',List,Newlist)->write('PHYC 161L is satisfied'),nl; Newlist=List,write('PHYC 161L is NOT satisfied'),nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqECE203L(List,Newlist) :- intersects('ECE 203L',List,Newlist)->write('ECE 203L is satisfied'),nl; Newlist=List,write('ECE 203L is NOT satisfied'),nl.

satisfyEEReqMATH264(List,Newlist) :- intersects('MATH 264',List,Newlist)->write('MATH 264 is satisfied'),nl; Newlist=List,write('MATH 264 is NOT satisfied'),nl.

satisfyEEReqMATH316(List,Newlist) :- intersects('MATH 316',List,Newlist)->write('MATH 316 is satisfied'),nl; Newlist=List,write('MATH 316 is NOT satisfied'),nl.

satisfyEEReqPHYC262(List,Newlist) :- intersects('PHYC 262',List,Newlist)->write('PHYC 262 is satisfied'),nl; Newlist=List,write('PHYC 262 is NOT satisfied'),nl.

satisfyEEReqENGL219(List,Newlist) :- intersects('ENGL 219',List,Newlist)->write('ENGL 219 is satisfied'),nl; Newlist=List,write('ENGL 219 is NOT satisfied'),nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqECE206L(List,Newlist) :- intersects('ECE 206L',List,Newlist)->write('ECE 206L is satisfied'),nl; Newlist=List,write('ECE 206L is NOT satisfied'),nl.

satisfyEEReqECE213(List,Newlist) :- intersects('ECE 213',List,Newlist)->write('ECE 213 is satisfied'),nl; Newlist=List,write('ECE 213 is NOT satisfied'),nl.

satisfyEEReqMATH314(List,Newlist) :- intersects('MATH 314',List,Newlist)->write('MATH 314 is satisfied'),nl; Newlist=List,write('MATH 314 is NOT satisfied'),nl.

satisfyEEReqECE238L(List,Newlist) :- intersects('ECE 238L',List,Newlist)->write('ECE 238L is satisfied'),nl; Newlist=List,write('ECE 238L is NOT satisfied'),nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqECE314(List,Newlist) :- intersects('ECE 314',List,Newlist)->write('ECE 314 is satisfied'),nl; Newlist=List,write('ECE 314 is NOT satisfied'),nl.

satisfyEEReqECE321L(List,Newlist) :- intersects('ECE 321L',List,Newlist)->write('ECE 321L is satisfied'),nl; Newlist=List,write('ECE 321L is NOT satisfied'),nl.

%%satisfyEEReqCompleteness(List,Newlist) :- intersectsAtLeast1(['ECE 381','ECE 345','ECE 371','ECE 322L','ECE 360','ECE 341'],List,6,[],X)->write('    EE Completeness is satisfied'),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 381','ECE 345','ECE 371','ECE 322L','ECE 360','ECE 341'],List,X),deletelist(List,X,Newlist),write('EE Completeness is NOT satisfied    '),write(X),nl.

satisfyEEReqCompleteness(List,Newlist) :- intersection(['ECE 381','ECE 345','ECE 371','ECE 322L','ECE 360','ECE 341'],List,X),length(X,N),(N >= 6 -> select(6,X,Y),deletelist(List,Y,Newlist),write('EE Completeness is satisfied');deletelist(List,X,Newlist),write('EE Completeness is NOT satisfied    '),write(X),nl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfyEEReqECE340(List,Newlist) :- intersects('ECE 340',List,Newlist)->write('ECE 340 is satisfied'),nl; Newlist=List,write('ECE 340 is NOT satisfied'),nl.

satisfyEEReqECE344L(List,Newlist) :- intersects('ECE 344L',List,Newlist)->write('ECE 344L is satisfied'),nl; Newlist=List,write('ECE 344L is NOT satisfied'),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Signals and Communication track
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 439','ECE 441','ECE 442'],List,2,[],X)->write('Signals and Communication track is satisfied    '),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 439','ECE 441','ECE 442'],List,X),deletelist(List,X,Newlist),write('Signals and Communication track is NOT satisfied    '),write(X),nl),fail.

%%Systems and Controls track
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 446'],List,2,[],X)->write('Systems and Controls track is satisfied    '),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 446'],List,X),deletelist(List,X,Newlist),write('Systems and Controls track is NOT satisfied    '),write(X),nl),fail.

%%Electromagnetics
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 439','ECE 464'],List,2,[],X)->write('Electromagnetics track is satisfied    '),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 439','ECE 464'],List,X),deletelist(List,X,Newlist),write('Electromagnetics track is NOT satisfied    '),write(X),nl),fail.


%%Microelectronics
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 474L','ECE 487'],List,2,[],X)->write('Microelectronics track is satisfied    '),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 474L','ECE 487'],List,X),deletelist(List,X,Newlist),write('Microelectronics track is NOT satisfied    '),write(X),nl),fail.


%%Computer Systems(Hardware)
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 338','ECE 438'],List,2,[],X)->write('Computer Systems(Hardware) track is satisfied'),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 338','ECE 438'],List,X),deletelist(List,X,Newlist),write('Computer Systems(Hardware) track is NOT satisfied    '),write(X),nl),fail.

%%Computer Systems(Software)
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 231','ECE 331'],List,2,[],X)->write('Computer Systems(Software) track is satisfied'),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 231','ECE 331'],List,X),deletelist(List,X,Newlist),write('Computer Systems(Software) track is NOT satisfied    '),write(X),nl),fail.

%%Energy/Power Systems
satisfyEEReqTrackelective(List,Newlist) :- 
(intersectsAtLeast1(['ECE 482','ECE 483','ECE 484','ECE 488'],List,2,[],X)->write('Energy/Power Systems track is satisfied'),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 482','ECE 483','ECE 484','ECE 488'],List,X),deletelist(List,X,Newlist),write('Energy/Power Systems track is NOT satisfied    '),write(X),nl),fail.

%%Optoelectronics
satisfyEEReqTrackelective(List,Newlist) :- 
intersectsAtLeast1(['ECE 471','ECE 475'],List,2,[],X)->write('Optoelectronics track is satisfied    '),write(X),nl,deletelist(List,X,Newlist);intersection(['ECE 471','ECE 475'],List,X),deletelist(List,X,Newlist),write('Optoelectronics track is NOT satisfied    '),write(X),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
satisfy(List) :- 
satisfyEEReqMATH162(List,Newlist),
satisfyEEReqENGL110(Newlist,Newlist0),
satisfyEEReqECE101(Newlist0,Newlist1),
satisfyEEReqPHYC160(Newlist1,Newlist2),
satisfyEEReqECE131(Newlist2,Newlist3),
satisfyEEReqECON105_106(Newlist3,Newlist4),
satisfyEEReqMATH163(Newlist4,Newlist5),
satisfyEEReqCHEM121(Newlist5,Newlist6),
satisfyEEReqCHEM123L(Newlist6,Newlist7),
satisfyEEReqPHYC161(Newlist7,Newlist8),
satisfyEEReqPHYC161L(Newlist8,Newlist9),
satisfyEEReqECE203L(Newlist9,Newlist10),
satisfyEEReqMATH264(Newlist10,Newlist11),
satisfyEEReqMATH316(Newlist11,Newlist12),
satisfyEEReqPHYC262(Newlist12,Newlist13),
satisfyEEReqENGL219(Newlist13,Newlist14),
satisfyEEReqECE206L(Newlist14,Newlist15),
satisfyEEReqECE213(Newlist15,Newlist16),
satisfyEEReqMATH314(Newlist16,Newlist17),
satisfyEEReqECE238L(Newlist17,Newlist18),
satisfyEEReqECE314(Newlist18,Newlist19),
satisfyEEReqECE321L(Newlist19,Newlist20),
satisfyEEReqCompleteness(Newlist20,Newlist21),
satisfyEEReqECE340(Newlist21,Newlist22),
satisfyEEReqECE344L(Newlist22,Newlist23),
satisfyEEReqTrackelective(Newlist23,Newlist24).


%%(satisfyEEReqECE420(NewList3,Newlist4);Newlist4=NewList3),
%%(satisfyEEReqECE420(NewList4,Newlist5);Newlist5=NewList4),


hello(List,NewList):- del(a,List,Newlist), member(b,Newlist),write(Newlist). 



%%satisfy(List) :- (intersects(a,List,Newlist) -> B is 1,write('a is satisfied'),nl; Newlist = List, write('a not satisfied'),nl),(intersects(b,NewList,Newlist1) -> B is 1,write('b is satisfied'),nl; Newlist1 = Newlist,write('b is not satisfied'),nl). 

select(0,_,[]).
select(N,[H|T],[H|U]):- M is N-1, select(M,T,U).


intersectsAtLeast1(_,_,N,X,Z) :- Z=X,N =< 0, !.
intersectsAtLeast1([H|T],L,N,X,Z) :- member(H,L),!,append([H],X,Y), M is N-1, intersectsAtLeast1(T,L,M,Y,Z).
intersectsAtLeast1([_|T],L,N,X,Z) :- intersectsAtLeast1(T,L,N,X,Z).


try('A') :- write('Hello Ahmad').
try('B') :- write('Hello Ameer').
try1(X) :- write('loop1'),nl,X==1 -> write('X=1'),nl,fail.
try1(X) :- write('loop2'),nl,X==2 -> write('X=1').

longest([L], L) :- !.
longest([H|T], H) :- length(H, N), longest(T, X), length(X, M), N > M,!.
longest([H|T], X) :- longest(T, X),!.


humanities(X):- X=[a,b,c].

/*
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- http_handler(root(hello_ahmad), say_hi, []).	

server(Port) :-						
        http_server(http_dispatch, [port(Port)]).

say_hi(_Request) :-
    reply_html_page(
       [title('Howdy')],
       [
        h1('A Simple Web Page'),  % arity 1
        p(class=bodytext, 'With some text'),  % arity 2
        p([class=bodytext, style='font-size: 120%'], ['Bigger text', b('some bold')])
        ]).
*/


:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

:- http_handler(root(list_modules), list_modules, []).

server(Port) :-
	http_server(http_dispatch, [port(Port)]).

list_modules(_Request) :-
	%%findall(M, current_module(M), List),
	%%sort(List, Modules),
	reply_html_page(title('Student Tracking System'),
			[ h1('Student Tracking System'),
			  table([ \header
				| \satisfyCE('BS',['ECE 471','AFST 104','ECE 475','ECE 567','ENGL 111','ENGL 112','PHYC 161','CHBE 302','CE 455','CE 433','CE 462','CE 411','CE 463','CE 440','CE 481','ECON 106','ARAB 111','CHEM 122','EPS 101','CHEM 124L','LA 480','MGMT 306','CE 477','CE 475','CE 305','CE 350','CE 376','CE 478','MGMT 303','CE 474','MGMT 310','ECE 439','ECE 381','ECE 345','AFST 109','MATH 162'])
				])
			]).

header -->
	html(tr([th('Requirement'), th('Status'), th('seffd')])).

modules([]) -->	[].
modules([H|T]) --> module(H), modules(T).

module(Module) -->
	{ module_property(Module, file(Path)) }, !,
	html(tr([td(Module), td(Path)])).
module(Module) -->
	html(tr([td(Module), td(-)])).


say(hi) --> {X=1},html(tr([th(X), th('File')])).

satisfyCE('BS',List) -->
satisfyCourse('MATH 162',List,Newlist2),!,
satisfyCourse('CE 160L',Newlist2,Newlist3),!,
satisfyCourse('CHEM 121',Newlist3,Newlist4),!,
satisfyCourse('CHEM 123L',Newlist4,Newlist5),!,
satisfyCourse('ENGL 120',Newlist5,Newlist6),!,
satisfyCourse('MATH 163',Newlist6,Newlist7),!,
satisfyCourse('PHYC 160',Newlist7,Newlist8),!,
satisfyCourse('PHYC 167',Newlist8,Newlist9),!,
satisfyCourse('CS 151L',Newlist9,Newlist10),!,
satisfyCourse('ECE 471',Newlist9,Newlist10),!.

satisfyCourse(Course,List,Newlist) --> checkCourseDelete(Course,List,Newlist).

checkCourseDelete(Course,List,Newlist) -->  {member(Course,List)}->(html(tr([td(Course),td('is satisfied')])),{deletelist(List,Course,Newlist)});{Newlist=List},html(tr([td(Course),td('is NOT satisfied')])).

member(X,[X|R]).
member(X,[Y|R]) --> member(X,R).

del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1])--> del(X,Tail,Tail1).

see(X,Y,Z):-intersectsAtLeastZ(X,Y,1,[],Z).