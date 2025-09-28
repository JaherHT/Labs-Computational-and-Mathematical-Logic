% Family Tree Knowledge base

parent(alicia, jaher).
parent(alicia, stuart).
parent(juan, jaher).
parent(juan, stuart).
parent(ezequiel, alicia).
parent(marta, alicia).
parent(oscar, juan).
parent(matilde, juan).
parent(charles, ezequiel).
parent(verona, ezequiel).
parent(david, marta).
parent(ana, marta).

grandparent(X,Z) :- parent(X, Y), parent(Y, Z).

sibling(X,Y) :- parent(Z, X), parent(Z, Y), X\=Y.

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

% Food preferences

likes(alicia, pizza).
likes(juan,pizza).
likes(stuart, burguer).
likes(jaher, icecream).
likes(verona, icecream).
likes(oscar, burguer).
likes(david, icecream).
likes(ana, hotdog).
likes(ezequiel, banana).

food_friend(X,Y) :- likes(X,Food), likes(Y,Food), X\=Y.

% Math utility

factorial(0,1).
factorial(N,F) :-
    N > 0,
    N1 is N-1,       
    factorial(N1,F1),
    F is N*F1.

sum_list([],0).
sum_list([H|T],Sum) :-
    sum_list(T,SubSum),
    Sum is SubSum + H.

% List processing

list_length([],0).
list_length([_|Tail],Length) :-
    list_length(Tail,TailLength),
    Length is TailLength + 1.

append_list([],List2,List2).
append_list([H|T],List2,[H|ResultTail]) :-
    append_list(T,List2,ResultTail).