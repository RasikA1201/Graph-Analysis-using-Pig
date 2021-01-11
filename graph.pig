A = LOAD '$G' USING PigStorage(',') AS (graph_node:int, adjacent_node:int);
B = GROUP A BY graph_node;
C = FOREACH B GENERATE FLATTEN(COUNT(A.adjacent_node)) AS edge_count;
D = GROUP C BY edge_count;
E = FOREACH D GENERATE group, COUNT(C.edge_count);
STORE E INTO '$O' USING PigStorage (' ');
