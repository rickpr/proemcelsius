:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).

:- ['PredicatesLibrary'].
:- ['Rules'].
:- ['CE_DegreeProgram'].

server(Port) :-
	http_server(http_dispatch, [port(Port)]).

% :- http_handler('/degrees/api', plan_compare, []).
:- http_handler(/, plan_compare, []).

% say_hi(Request) :-
% 	A := satisfyCE('BS',['ECE 471','AFST 104','ECE 475']),
% 	format('Content-type: text/plain~n~n'),
% 	format(A).

plan_compare(Request) :-
	reply_html_page(
		title('PlanCompare'),
		[\compare_response(Request)]).


compare_response(Request) -->
	{
		% Parameter Error Checking
		catch(
			http_parameters(Request,
			[
				params(Params, [])
			]),
			_E,
			fail
		),
		!
	},

	html(
		[
			h1('Degree Plan Compare Page'),
			p('Here are the passed parameters'),
			p('The parameter is ~w'-Params)
		]
	).


compare_response(_Request) -->
	html(
	    [
	    h1('Oops!'),
	    p('Some parameter wasnt valid')
	    ]).
