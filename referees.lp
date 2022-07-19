
%provisionally assign each referee to each case with choice rulee
%assign each case only once per stable model
{assign(C,R):referee(R,_,_,_,_)}=1:-case(C,_,_,_,_,_).

%hard: referees can only work minutes up to their max wordload
workload(R,S):-S=#sum{E:case(C,_,E,_,_,_),assign(C,R)},referee(R,_,_,_,_).
:-referee(R,_,M,_,_), workload(R,S),S>M.

%hard: referees cannot be assigned if they have region preference 0
:-assign(C,R),case(C,_,_,_,L,_),prefRegion(R,L,0).

%hard: referee cannot be assigned if they have type preference 0
:-assign(C,R),case(C,T,_,_,_,_),prefType(R,T,0).

%hard: damage amount over threshold must go to internal referees
:-assign(C,R),referee(R,e,_,_,_),case(C,_,_,D,_,_),externalMaxDamage(M),D>M.

%weak: minimize payments to external referees
externalcount(N):-N=#count{R:assign(C,R),referee(R,e,_,_,_)}.
:~externalcount(N). [16*N @ 0]

%weak: balance payments to external referees
externalpay(R,P):-P=#sum{D:case(C,_,_,_,_,D),assign(C,R)},referee(R,e,_,_,_).
totalexternalpay(R,Z):-Z=P+Y, externalpay(R,P),referee(R,e,_,_,Y).
averageexternalpay(F):-F=Q/V,Q=#sum{Z:totalexternalpay(R,Z)},V=#count{R:totalexternalpay(R,Z)}.
:~totalexternalpay(R,Z),averageexternalpay(F). [7*|F-Z| @ 0]

%weak: balance total historical minutes worked between all referees
totalworkload(R,T):-T=S+W,workload(R,S),referee(R,_,_,W,_).
averageworkload(A):-A=B/C,B=#sum{T:totalworkload(R,T)},C=#count{R:totalworkload(R,T)}.
:~totalworkload(R,T),averageworkload(A). [9*|A-T| @ 0]

%weak: assign in line with region preference
:~assign(C,R),case(C,_,_,_,P,_),prefRegion(R,P,L). [34*(3-L) @ 0]

%weak: assign in line with type preference
:~assign(C,R),case(C,Y,_,_,_,_),prefType(R,Y,K). [34*(3-K) @ 0]

%show referee case assignments
#show assign/2.



