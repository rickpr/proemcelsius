del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).

%%size([],0).
%%size([H|T],N) :- size(T,N1), N is N1+1.

%% Check if an element exists in a list
member(X,[X|R]).
member(X,[Y|R]) :- member(X,R).

%% Check if there is intersection between 2 lists
intersects(X, List) :- member(X, List).
intersects([H|_],List) :- member(H,List),!.
intersects([_|T],List) :- intersects(T,List).

%% Check if there are at least N intersections between 2 lists
intersectsAtLeast(_,_,N) :- N =< 0, !.
intersectsAtLeast([H|T],L,N) :- member(H,L),!, M is N-1, intersectsAtLeast(T,L,M).
intersectsAtLeast([_|T],L,N) :- intersectsAtLeast(T,L,N).

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
matchListAll([H|T],List,N):- matchListAll(T,List,N).
 
%% Check if the elements in 'List 2'([X|R]) are all found in 'List'. Write down the elements that are not in 'List' but are in 'List 2'. 
notmember([],X).
notmember([Y|R],X):- X\=Y,notmember(R,X).

notmemberList(List,[X|R]) :- notmember(List,X), write(X),nl,M is 1,notmemberList(List,R,M).
notmemberList(List,[X|R],M) :- notmember(List,X),write(X),nl, N is M+1, notmemberList(List,R,N).
notmemberList(List,[X|R]) :- member(X,List), notmemberList(List,R,0).
notmemberList(List,[X|R],M) :- member(X,List), notmemberList(List,R,M).
notmemberList(List,[],M) :-  M =< 0.

%% select(N,X,Y): select N elements from X and save it in Y
select(0,_,[]).
select(N,[H|T],[H|U]):- M is N-1, select(M,T,U).

%%intersection(X,Y,Z): check if there is intersection between X and Y. If there is intersection, it saves them in Z. Otherwise it returns an empty list []. X and Y should be lists for this function to work correctly.

%% deletelist(X,Y,Z): delete Y elements from X. The remaining elements in X are saved in Z (i.e., Z=X-Y).
deletelist([], _, []).                  
deletelist([X|Xs], Y, Z) :- member(X, Y), deletelist(Xs, Y, Z), !.
deletelist([X|Xs], Y, [X|Zs]) :- deletelist(Xs, Y, Zs).
%%deletelist([X|Tail],X,Tail).
%%deletelist([Y|Tail],X,[Y|Tail1]):- deletelist(Tail,X,Tail1).
 
%% append(X,Y,Z): join X and Y into Z (i.e., Z=X&Y).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).
append([],X,X).

%% intersectsAtLeastZ(A,B,N,X,Z): check if there is at least N elements intersecting A & B. If true, the N elements intersecting A & B are saved in Z. Otherwise, it returns false. X is initially empty list [].
intersectsAtLeastZ(_,_,N,X,Z) :- Z=X,N =< 0, !.
intersectsAtLeastZ([H|T],L,N,X,Z) :- member(H,L),!,append([H],X,Y), M is N-1, intersectsAtLeastZ(T,L,M,Y,Z),!.
intersectsAtLeastZ([_|T],L,N,X,Z) :- intersectsAtLeastZ(T,L,N,X,Z).

%% A 'Requirement' is a set of courses( > 1 course). 
%%checkRequirement(Requirement,List,L,N,Z): check if the 'Requirement' is satisfied or NOT. It takes the list 'L' and compare it to 'List'. If at least N elements are in common between 'L' and 'List' then the rule is satisfied and N elements are saved in Z; Otherwise the rule is not satisfied and the intersection is saved Z.  
checkRequirement(Requirement,List,L,N,Z) :- 
intersectsAtLeastZ(List,L,N,[],Z),write(Requirement),write('------is satisfied------'),write(Z),nl,!;intersection(List,L,Z),write(Requirement),write('------is NOT satisfied------'),write(Z),nl.

%%checkRequirementDelete(Requirement,List,L,N,Newlist): check if the 'Requirement' is satisfied or NOT. It takes the list 'L' and compare it to 'List'. If at least N elements are in common between 'L' and 'List' then the rule is satisfied and N elements are deleted from 'List' where the rest of 'List' elements are saved in 'Newlist'; Otherwise the rule is not satisfied and the intersection(s) is deleted from 'List' wher the rest of 'List' elements are saved in 'Newlist'.  

checkRequirementDelete(Requirement,List,L,N,Newlist) :- 
intersectsAtLeastZ(List,L,N,[],Z),write(Requirement),write('------is satisfied------'),write(Z),nl,deletelist(List,Z,Newlist),!;intersection(List,L,Z),write(Requirement),write('------is NOT satisfied-----'),write(Z),nl,deletelist(List,Z,Newlist).

%%checkCourseDelete(Course,List,Newlist): check if a 'Course' is satisfied or NOT. It takes the 'Course' and compare it with 'List'. If it is a member of 'List' then the rule is satisfied and the 'Course' is deleted from 'List' where the rest of the elements of 'List' are saved in 'Newlist';Otherwise the rule is NOT satisfied.

checkCourseDelete(Course,List,Newlist) :- member(Course,List),del(Course,List,Newlist),write(Course),write('------is satisfied'),nl;Newlist=List,write(Course),write('------is NOT satisfied'),nl.










 