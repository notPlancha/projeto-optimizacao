#let theFont = "EB Garamond" 
#let normal = 13pt
#let headingFont = "Open Sans"
#let headingSize = 17pt
#let headingWeight = 500

//EB Garamond HAS SMALL CAPS BUT TYPST IS A BITCH
#let sc(doc) = {
  set text(
    font: "linux libertine"
  )
  smallcaps(doc)
}


#let default(doc) = [
  #set text(
    font: theFont,
    size: normal,
    lang: "pt"
  )
  #set page(
    numbering: "1",
    margin: (x: 2.5cm, y:2cm),
  )
  #set par(
    justify: true,
    first-line-indent: 1cm,

  )
  #show heading: it => [//I don't understand the syntax but that's ok
    #set text(
      font: headingFont, 
      size: headingSize,
      weight: headingWeight
    )
    #block(it.body)
  ]
  //still don't understand this syntax

  #set math.equation(numbering: "(1)", block: true) //not working
  #doc
]

