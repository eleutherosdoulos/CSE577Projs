#const d=120.

%shift(day,start,stop,type,training,expertise)
{shift(1..d,7,19,er,md,trauma)}.
{shift(1..d,7,19,er,np,trauma)}.
{shift(1..d,22,10,er,md,trauma)}.
{shift(1..d,15,3,er,md,trauma)}.
{shift(1..d,19,7,er,md,trauma)}.


%provider(id,training,expertise,swingpreferences) what else?
provider(1,md,trauma,0).

%schedule(providerid,day,shiftstart)is it important to diff between the two 7 starts?
{schedule(P,D,S):provider(P,_,_,_)}=1:-shift(D,S,_,_,_,_).

%CONSTRAINTS ON SCHEDULING

%no one can work two shifts in the same day
:-schedule(P,D,_),schedule(P1,D1,_),P = P1,D = D1.

%no one can work the day after a shift starts if it goes past midnight
:-schedule(P,D,S),S > 12, schedule(P,D + 1, S).

%certain shifts need mds

%work hours should average to 40 per week over the span (math on this)(640 over span)

%providers work hours should be relatively equal over the time period run

%some docs will not work the 22 starting swing shift

%find a way to encapsulate time, day, other preferences
