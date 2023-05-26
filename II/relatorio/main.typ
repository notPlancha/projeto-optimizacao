#import "proprieties.typ": *
#import "functions.typ": to

#include "cover.typ"
#pagebreak()
#show: default

= a)
Uma solução $S$ diz-se admissível se satisfaz todas as condições do problema. Para este problema, uma solução admissível é uma solução que admite cada cientista $C_i$ um projeto $P_j$, cada projeto tem apenas um cientista, e todos os projetos têm um cientista, $i, j in {1 to 10}$. Ou seja,

$ forall S in U: S in A arrow.l.double S = {C_1 arrow.r.bar P_a, C_2 arrow.r.bar P_b, dots, C_10 arrow.r.bar P_j} $

, sendo $A$ o conjunto de soluções admissíveis, $U$ o conjunto de soluções, e $C_alpha arrow.r.bar P_beta$ o associamento do projeto $alpha$ ao cientista $beta$; $a to j,alpha,beta in {1 to 10} and a eq.not b eq.not ... eq.not j$ , $A subset U$.

Como há apenas 10 cientistas e apenas 10 projetos, todos os cientistas vão ter projetos e todos os projetos vão ter cientistas.

= b)

Uma possível heurística construtiva seria admitir como lider do projeto $P_i$ o cientista $C_i$ para todos os projetos, $i in {1 to 10}$. Ou seja,

$ S = {C_1 arrow.r.bar P_1, C_2 arrow.r.bar P_2, dots, C_10 arrow.r.bar P_10} $

Esta heurística, embora simples e produtora de uma solução admissível, não é interessante para *Lusa_med*, sendo que é equivalente a uma heuristica que escolhe os lídderes de forma aleatória (sem reposição). Desta forma, uma heurística construtiva alternativa seria alocar para o cientista $C_i$ o projeto $P_j$ que tenha a melhor aptidão, entre as ainda não alocadas, $j in {1 to 10}$. Ou seja, sendo $a(C_i, P_j)$ a aptidão do cientista $C_i$, e $bold(P)$ os projetos para o projeto $P_j$,: 

$ 
  S &= {\
    &C_1 arrow.r.bar P_("argmax"{a(C_i, P): P in bold(P)}),\
    &C_2 arrow.r.bar P_("argmax"{a(C_2, P): P in bold(P) \\ {P arrow.l.bar C_1} }),\
    &C_3 arrow.r.bar P_("argmax"{a(C_3, P): P in bold(P) \\ {P arrow.l.bar C_1, P arrow.l.bar C_2} }),\
    &dots,\
    &C_10 arrow.r.bar P_("argmax"{a(C_10, P): P in bold(P) \\ {P arrow.l.bar C_1, P arrow.l.bar C_2, dots, P arrow.l.bar C_9} })\
  }
$