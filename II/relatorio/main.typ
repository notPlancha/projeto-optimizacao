#import "proprieties.typ": *
#import "functions.typ": *

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

Esta heurística, embora simples e produtora de uma solução admissível, não é interessante para *Lusa_med*, sendo que é equivalente a uma heurística que escolhe os lídderes de forma aleatória (sem reposição). Desta forma, uma heurística construtiva alternativa seria alocar para o cientista $C_i$ o projeto $P_j$ que tenha a melhor aptidão, entre as ainda não alocadas, $j in {1 to 10}$. Ou seja, sendo $a(C_i, P_j)$ a aptidão do cientista $C_i$, e $bold(P)$ os projetos para o projeto $P_j$,: 

$ 
  S &= {\
    &C_1 arrow.r.bar P_("argmax"{a(C_i, P): P in bold(P)}),\
    &C_2 arrow.r.bar P_("argmax"{a(C_2, P): P in bold(P) \\ {P arrow.l.bar C_1} }),\
    &C_3 arrow.r.bar P_("argmax"{a(C_3, P): P in bold(P) \\ {P arrow.l.bar C_1, P arrow.l.bar C_2} }),\
    &dots,\
    &C_10 arrow.r.bar P_("argmax"{a(C_10, P): P in bold(P) \\ {P arrow.l.bar C_1, P arrow.l.bar C_2, dots, P arrow.l.bar C_9} })\
  }
$

= c)
Para construir a solução, o @alg1 pode ser usado.
#figure([#block(fill: luma(235), above: 10pt, below: 0pt, inset: 8pt,breakable: false)[
  #let ind(num) = {h(3pt + (num - 1)*8pt)}
  #set align(left)
  #set par(leading: 4pt, first-line-indent: 0pt, justify: false)
  #set text(hyphenate: false, )
  Recebe: Ciencistas $bold(C)$, Projetos $bold(P)$, função aptidão $a(C, P)$\
  Devolve: Solução $S$

    1: #ind(1) *para todos* $C_i$ em $bold(C)$ *fazer:*\
    2: #ind(2) $j arrow.l$ `argmax`{$a(C_i, P): P in bold(P)$}\
    3: #ind(2) adicionar ($C_i arrow.r.bar P_j$) a $S$\
    4: #ind(2) remover $P_j$ de $bold(P)$\
  ]],
  caption: [Heurística construtiva], kind: "alg", supplement: [Algorítmo]
)<alg1>

A solução resultante do algorítmo neste problema é a seguinte:
//typst & not alternates between left and right, sso 2 && will make them align left
$
  &S_0 &&= {\ 
   & &&C_1 arrow.r.bar P_9,\
   & &&C_2 arrow.r.bar P_5,\
   & &&C_3 arrow.r.bar P_2,\
   & &&C_4 arrow.r.bar P_8,\
   & &&C_5 arrow.r.bar P_1,\
   & &&C_6 arrow.r.bar P_3,\
   & &&C_7 arrow.r.bar P_7,\
   & &&C_8 arrow.r.bar P_10,\
   & &&C_9 arrow.r.bar P_6,\
   & &&C_10 arrow.r.bar P_4\
  &}
$
, para uma aptidão total de $832$. 

= d)

Uma estrutura de vizinhança para este problema pode ser definida como a troca de projetos entre dois cientistas, para todos os cientistas. Ou seja,
$ 
  V(S) = &lr({S' in A:&&
  S' = (S \\ {C_alpha arrow.r.bar P_i, C_beta arrow.r.bar P_j}) union {C_alpha arrow.r.bar P_j, C_beta arrow.r.bar P_i} \
  &&& and {C_alpha arrow.r.bar P_i, C_beta arrow.r.bar P_j} subset S\
  &})
$

Isto pode ser implementado com o @alg2.

#figure([#block(fill: luma(235), above: 10pt, below: 0pt, inset: 8pt,breakable: false)[
  #let ind(num) = {h(3pt + (num - 1)*8pt)}
  #set align(left)
  #set par(leading: 4pt, first-line-indent: 0pt, justify: false)
  #set text(hyphenate: false, )
  Recebe: Solução $S$\
  Devolve: Vizinhança da solução $bold(V)$

    1: #ind(1) *para todos* $C_alpha arrow.r.bar P_i$ em $S$ *fazer:*\
    2: #ind(2) *para todos* $C_beta arrow.r.bar P_j$ em $lr((S \\ C_alpha arrow.r.bar P_i))$ *fazer:*\
    3: #ind(3) $S' arrow.l$ S\
    4: #ind(3) tirar $C_alpha arrow.r.bar P_i$ e  $C_beta arrow.r.bar P_j$ de $S'$\
    5: #ind(3) adicionar $C_alpha arrow.r.bar P_j$ e $C_beta arrow.r.bar P_i$ a $S'$\
    6: #ind(3) adicionar $S'$ a $bold(V)$\
  ]],
  caption: [Estrutura de vizinhança], kind: "alg", supplement: [Algorítmo]
)<alg2>

= e)

Uma solução vizinha pode ser a aolução que troca os projetos de $C_1 arrows.lr C_2$, sendo essa:

$
  &S_1 &&= {\ 
   & &&C_1 arrow.r.bar P_5,\
   & &&C_2 arrow.r.bar P_9,\
   & &&C_3 arrow.r.bar P_2,\
   & &&C_4 arrow.r.bar P_8,\
   & &&C_5 arrow.r.bar P_1,\
   & &&C_6 arrow.r.bar P_3,\
   & &&C_7 arrow.r.bar P_7,\
   & &&C_8 arrow.r.bar P_10,\
   & &&C_9 arrow.r.bar P_6,\
   & &&C_10 arrow.r.bar P_4\
  &}
$
, para uma aptidão total de $804$.

= f)
//#label("f")

A lista tabu é uma lista de movimentos que o algoritmo tabu tem que evitar em cada iteração, de forma a o algoritmo não ficar preso num máximo local não global.Esta lista começa vazia no início do algoritmo, aumentando o seu tamanho a cada iteração, até um máximo $t$, a adimensão da lista tabu, ou tempo de permanência ($t in NN_0$), definido _à priori_ (como parâmetro do algorítmo). A cada iteração, o algoritmo adiciona na lista tabu uma representação do movimento da solução anterior para o vizinho efetuado, e retira o movimento mais velho se esceder $t$.

Desta forma, o algorítmo será forçado a explorar vizinhos potencialmente piores, em vês de vizinhos previamente visitados, de forma a sair do máximo local e explorar outro máximo. 

Uma outra forma de interpretar o parâmetro é ele como _tempo de permanência_, ou seja, $t$ representa o número de iterações que o movimento fica restrito de ser válido. Este conceito é equivalente ao conceito anterior, sendo que uma dimensão $t$ significa que o movimento $M_i$ irá saír da lista $i + t$ iterações do movimento, sendo que este será o mais velho.

Um $t$ demasiado alto pode fazer com que o algoritmo não visite soluções que poderiam ser melhores (nos mesmos vizinhos mas por caminhos alternativos), e um demasiado baixo pode fazer que o algoritmo não saia do máximo local. Devido a esse facto, se o algoritmo não conseguir chegar ao mínimo de aptidão desejado, serão tentados tempos diferentes. Para a primeira tentativa, $t = 4$.

= g)

À lista tabu vai ser adicionado uma representação da diferença entre a solução anterior e o vizinho escolhido, independentemente do valor de aptidão da solução anterior. Aqui, vai ser escolhido representar a diferença com a troca do projeto que os cientistas fizeram, independentemente do projeto que trocaram. Ou seja, se o vizinho de f) fosse $S_1$ do algorítmo tabu, sendo $i$ a iteração do algorítmo,
$
forall t > 0: T_1 = mat(C_1 arrows.lr C_2)^T\
$

Neste caso, a lista tabu é uma matriz de dimensão $t times 1$, sendo que cada movimento tem apenas 1 troca de projetos.

= h)

Os movimentos Tabu são as tais representação da diferença entre a solução anterior e o vizinho escolhido, aqui representado como $C_i arrows.lr C_j$. Ou seja, na escolhida do vizinho durante o algorítmo tabu, um movimento não é válido se o vizinho tiver os projetos de $C_i$ e $C_j$ trocados. Por exemplo, se a lista tabu for a apresentada em g), e a solução for a apresentada em e), o movimento criado pelo vizinho $S_0$ e movimentos equivalentes (qualquer movimento $C_1 arrows.lr C_2$), seria um movimento inválido, independente dos projetos trocados, mesmo se esses tivessem uma aptidão maior, e o algorítmo teria que escolher outro vizinho na iteração em causa.

= i)

O algorítmo tabu com os critérios de paragem específicados é implementado com o @alg3, $m = 850, M = 100, t = 4$.

#figure([#block(fill: luma(235), above: 10pt, below: 0pt, inset: 8pt,breakable: false)[
  #let ind(num) = {h(5pt + (num - 1)*8pt)}
  #set align(left)
  #set par(leading: 4pt, first-line-indent: 0pt, justify: false, hanging-indent: 0pt,)
  #set text(hyphenate: false)
  Recebe: \
   #ind(2) Solução inicial $S_0$, \
   #ind(2) Mínimo de aptidão $m$, \
   #ind(2) Máximo de iterações $M$, \
   #ind(2) Tempo de permanência $t$, \
   #ind(2) Estrutura de vizinhança $V(S)$\
   #ind(2) Definição de movimentos $Delta(S_a, S_b)$\
   #ind(2) Função de aptidão $a(S)$\
  Devolve: Melhor solução encontrada $S_O$\
          1: #ind(1) $T arrow.l$ uma matriz $t times 1$\
          2: #ind(1) $h = 0$\
          2: #ind(1) *para* i *de* 1 a $M$ *fazer*\
          3:  #ind(2) $V_i arrow.l$ $V(S_i)$\
          4:  #ind(2) Remover de $V_i$ todos $S$ onde $Delta(S, S_i)$ é uma das linhas de $T$\ //$exists j in {1 to t}: Delta(S, S_i) in {T_(k,1) : k in {1 to t}}$\
          5:  #ind(2) $S_i arrow.l$ o $S$ de $V_i$ com maior aptidão\
          6:  #ind(2) *se* $a(S_i) > a(S_O)$ *então*\
          7:  #ind(3) $S_O arrow.l S_i$\
          8:  #ind(3) *se* $a(S_O) > m$ *então* acabar algorítmo\
          9:  #ind(2) $h arrow.l h + 1$\
#h(-6pt) 10: #ind(2) $T_(h,1) arrow.l Delta(S_i, S_(i-1))$ \
#h(-6pt) 11: #ind(2) *se* $h > t$ *então* $h arrow.l 0$\

  ]],
  caption: [Algorítmo Tabu], kind: "alg", supplement: [Algorítmo]
)<alg3>

Cada iteração do algorítmo pode ser dividido em cinco partes: 

- A construção da vizinhança [3]
- Escolha do melhor vizinho que não esteja na lista tabu [4,5]
- Critério de Aspiração [6,7]
- Critério de paragem [2,8]
- Atualização da lista tabu [9 - 11]

Ao implementar o algorítmo para o nosso $S_0$, o algorítmo revelou a seguinte solução:

$
  &S_O &&= {\ 
   & &&C_1 arrow.r.bar P_9\
   & &&C_2 arrow.r.bar P_5\
   & &&C_3 arrow.r.bar  P_2\
   & &&C_4 arrow.r.bar  P_8\
   & &&C_5 arrow.r.bar  P_1\
   & &&C_6 arrow.r.bar  P_10\
   & &&C_7 arrow.r.bar  P_7\
   & &&C_8 arrow.r.bar  P_3\
   & &&C_9 arrow.r.bar  P_6\
   & &&C_10 arrow.r.bar P_4\
  &}
$
, com uma aptidão de 865, encontrada na primeira iteração ($S_O = S_1$). 

Para efeitos elustrativos, foi feito o mesmo algorítmo, mas com $m = 1001$, uma aptidão impossível de chegar, para deixar o algoritmo correr durante as 100 iterações. O algorítmo encontrou a seguinte solução:
$
  &S_O &&= {\ 
    & &&C_1 arrow.r.bar P_9\
    & &&C_2 arrow.r.bar P_2\
    & &&C_3 arrow.r.bar  P_6\
    & &&C_4 arrow.r.bar  P_8\
    & &&C_5 arrow.r.bar  P_7\
    & &&C_6 arrow.r.bar  P_4\
    & &&C_7 arrow.r.bar  P_10\
    & &&C_8 arrow.r.bar  P_3\
    & &&C_9 arrow.r.bar  P_1\
    & &&C_10 arrow.r.bar P_5\
$
, com uma aptidão de 902.

O gráfico da @fig1 mostra a evolução da aptidão ao longo das iterações.

#figure(image("grafico1.svg", width: 90%), caption: [Evolução da aptidão, $t = 4$], supplement: [Figura]) <fig1>

Como se pode obervar, o algorítmo parece ficar num ciclo de vizinhos na iteração 22, o que significa que o algoritmo não está a explorar outras soluções que podem ser melhores, devido ao facto da lista tabu ser demasiado pequena.

O gráfico da @fig2 mostra o mesmo algoritmo, mas com $t = 5$.

#figure(image("grafico1.svg", width: 90%), caption: [Evolução da aptidão, $t = 5$], supplement: [Figura]) <fig2>

Perante este resultado, o algorítmo parece procurar mais soluções, sem ficar preso num ciclo de vizinhos, embora este se comece a formar no ponto 25 para 80. No entanto, uma aptidão de 902 é completamente apropriada, e baseado nestas duas execuções, como o problema não é muito complexo, será razoável dizer qualquer solução que tenha uma aptidão de 904 é uma solução ótima.