
:- [database].
exec :- indunce([e],P), 
    open('output.txt',write,Out),
    write(P),
    close(Out).   
