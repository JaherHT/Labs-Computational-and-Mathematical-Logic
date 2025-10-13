edge(a, b).
edge(b, c).
edge(a, d).
edge(d, c).

path(X, Y) :- edge(X, Y).
path(X, Y) :- edge(X, Z), path(Z, Y).

path(X, Y) :- path(X, Y, []).
path(X, Y, _) :- edge(X, Y).

% With cicles

path(X, Y, Visited) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [X|Visited]).

path_list(X, Y, Visited, Path) :-
    edge(X, Y),
    reverse([Y|Visited], Path).

path_list(X, Y, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path_list(Z, Y, [Z|Visited], Path).

all_paths(Paths) :-
    findall(P, path_list(a, c, [a], P), Paths).

% Maze with rooms (r)

edge(start, r1).
edge(r1, r2).
edge(r2, r3).
edge(r3, exit).
edge(r2, r4).
edge(r4, exit).

maze_path(Path) :-
    path_list(start, exit, [start], Path).