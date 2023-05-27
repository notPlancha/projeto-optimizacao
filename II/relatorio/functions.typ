#let to = box(width: 8pt, baseline: 10%)[..]
#let alfa = symbol("α")//doesn't work dk why
#let sc(doc) = {
  set text(
    font: "linux libertine"
  )
  smallcaps[doc]
}


// alrogithm (N4tus from the discord, adapted) {
// TODO rewrite
//  #let algorithm(name, param, content) = {
//      enum(numbering: "1:", strong[function ] + sc[#name] + $lr(( param ))$, ..ident(content, 1em))
//    }
//
//
//  #let var(name) = for n in name [#n]
//  #let ident(lines, level) = {
//    for l in lines {
//      if (l.len() == 1 and type(l.at(0)) != "array") {
//        (h(level) + l.at(0),)
//      } else if (l.len() == 2 and type(l.at(0)) != "array") {
//        (h(level) + l.at(0), ..ident(l.at(1), level + 1em))
//      } else {
//        ident(l, level + 1em)
//      }
//    }
//  }
//  #let stmt(statement) = {
//    (statement,)
//  }
//  #let fn(name, param, content) = {
//    enum(numbering: "1:", strong[function ] + smallcaps[#name] + $lr(( param ))$, ..ident//(content, 1em))
//  }
//  #let assign(name, content) = {
//    ($#name arrow.l$ + " " + content,)
//  }
//  #let loop(loop_type, condition, content) = {
//    (strong(loop_type) + " " + condition + " " + strong("do"), content)
//  }
//  #let cond(cond_type, condition, content) = {
//    (strong(cond_type) + " " + condition + " " + strong("then"), content)
//  }
//
//  #let anglelr(content) = {
//    $lr(angle.l #content angle.r)$
//  }
// }