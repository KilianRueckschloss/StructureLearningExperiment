%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% generate_directed_acyclic_graph.pl %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

size(S) :- cmd_args(L), L = [Input], atom_number(Input,S).

patient(X) :- X is 1.
patient(Y) :- patient(X), Y is X+1, size(S), UpperBound is S+1, X<UpperBound.
 
0.5 :: treatment(X) :- patient(X).
0.5 :: recovery(X) :- patient(X).
0.4 :: recovery(X) :- patient(X), treatment(X).

neg(recovery(X)) :- patient(X), \+recovery(X).
neg(treatment(X)) :- patient(X), \+treatment(X).

query(treatment(X)).
query(recovery(X)).
query(patient(X)).
query(neg(X)).
