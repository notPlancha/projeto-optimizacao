#import "proprieties.typ": *

#show: default

#set align(center)
#set page(
  margin: (x: 3cm, y: 2.5cm),
)
#set text(
  hyphenate: false
)
#set par(
  first-line-indent: 0pt,
  justify: false,
)
#par(leading: 0.15cm)[
  #show: sc

  #text(13pt)[ISCTE-IUL] \
  #text(12.5pt)[Licenciatura em Ciência de Dados]
]
#v(1cm)
#line(length: 100%, stroke: 0.5pt)

#v(0.4cm)
#par(leading: 0.22cm)[
  #text(32pt)[Trabalho Individual II]
  #linebreak()
  #v(0.1cm)
  #text(16pt)[Exercício realizado no âmbito da Unidade Curricular de Optimização Heurística do 2º ano da Licenciatura em Ciência de Dados]
]
#v(0.4cm)
#line(length: 100%, stroke: 1pt)

#v(0.4cm)
#par(leading: 0.3cm)[
  #text(22pt)[André Plancha, 105289]\
  #link("mailto:Andre_Plancha@iscte-iul.pt")[Andre_Plancha\@iscte-iul.pt]
]
#v(3cm)
#par(leading: 0.3cm)[
  #text(16pt)[27 maio 2023]\
  #text(16pt)[Versão 1.0.0]
]
#v(3cm)
#set align(left)
#outline(
  title: text(weight: 600)[Índice],
  fill: text(15pt, spacing: 220%)[#repeat(" . ")]
)