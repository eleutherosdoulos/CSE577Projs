%%%%%%%%%%%%%%%%%%%% File: blocks-scenario.lp%%%%%%%%%%%%%%%%%%%

block(a).
block(b).
block(c).
block(d).
block(e).
block(f).
block(g).
block(h).
block(i).
block(j).
block(k).
block(l).
block(m).
block(n).
block(o).

% initial state
:- not on(m, table, 0; l, m, 0; a, l, 0; b, a, 0; c, b, 0; o, table, 0; n, o, 0; d, n, 0; e, d, 0; j, e, 0; k, j, 0; f, table, 0; g, f, 0; h, g, 0; i, h, 0).

% goal
:- not on(e, j, t; a, e, t; n, a, t; i, d, t; h, i, t; m, h, t; o, m, t; k, g, t; c, k, t; b, c, t; l, b, t).
