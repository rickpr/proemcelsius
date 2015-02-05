:- ['prolog/PredicatesLibrary'].
:- ['prolog/Rules'].

% Civil Engineering
ce(Degree,MyList) :-  
  ['prolog/CE_DegreeProgram'],
  satisfyCE(Degree,MyList).

% Chemical Engineering
che(Degree,MyList) :-
  ['prolog/CHE_DegreeProgram'],
  satisfyCHE(Degree,MyList).

% Construction Engineering
cone(Degree,MyList) :-
  ['prolog/CONE_DegreeProgram'],
  satisfyCONE(Degree,MyList).

% Construction Management
conm(Degree,MyList) :-
  ['prolog/CONM_DegreeProgram'],
  satisfyCONM(Degree,MyList).

% Computer Engineering
cpe(Degree,MyList) :-
  ['prolog/CPE_DegreeProgram'],
  satisfyCPE(Degree,MyList).

% Computer Science
cs(Degree,MyList) :-
  ['prolog/CS_DegreeProgram'],
  satisfyCS(Degree,MyList).

% Electrical Engineering
ee(Degree,MyList) :-
  ['prolog/EE_DegreeProgram'],
  satisfyEE(Degree,MyList).

% Mechanical Engineering
me(Degree,MyList) :-
  ['prolog/ME_DegreeProgram'],
  satisfyME(Degree,MyList).

% Nuclear Engineering
ne(Degree,MyList) :-
  ['prolog/NE_DegreeProgram'],
  satisfyNE(Degree,MyList).


