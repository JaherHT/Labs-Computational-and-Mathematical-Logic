:- use_module(library(clpfd)).

sudoku(Rows) :-
    append(Rows, Vars), 
    Vars ins 1..9,
    maplist(all_different, Rows),
    transpose(Rows, Cols), 
    maplist(all_different, Cols),
    blocks(Rows),
    maplist(label, Rows).

blocks([]).
blocks([A,B,C|Rest]) :-
    blocks3(A,B,C),
    blocks(Rest).

blocks3([],[],[]).
blocks3([A1,A2,A3|R1],[B1,B2,B3|R2],[C1,C2,C3|R3]) :-
    all_different([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
    blocks3(R1, R2, R3).

print_grid([]).
print_grid([Row1,Row2,Row3|Rest]) :-
    print_row(Row1), nl,
    print_row(Row2), nl,
    print_row(Row3), nl,
    writeln('-----------+-----------+-----------'),
    print_grid(Rest).

print_row([A, B, C, D, E, F, G, H, I]) :-
    format(' ~w | ~w | ~w | ~w | ~w | ~w | ~w | ~w | ~w ', [A, B, C, D, E, F, G, H, I]).