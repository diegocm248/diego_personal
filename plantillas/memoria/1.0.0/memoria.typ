/* Plantilla de memorias */

/*
 ****************
 *              *
 *   Funcións   *
 *  Auxiliares  *
 *              *
 ****************
 */

// Título
#let título(
    titulo: none,
    titulo-resume: none,
    autor: none,
    data: none,
    descripcion: none,
) = {
    place(
      auto,
      scope: "parent",
      float: true,
      [
        #box(width: 100%, height: auto)[
          #set align(center + horizon)
          #text(size: 1.8em)[
              #titulo
          ]
          #parbreak()
          #text(
            size: 1.2em,
            style: "italic",
            weight: "regular",
          )[
              #autor
          ]
          #parbreak()
          #text(
            size: 0.8em,
            style: "italic",
            weight: "thin",
            fill: luma(100),
          )[
            #if data != none {
              data.display(
                "[day]/[month]/[year]"
              )
            } else []
          ]
        ]
        #v(1.2em)
        #if descripcion == none [] else [
          #set align(center)
          #line(length: 20%, stroke: black + 0.5pt)
          #text(style: "oblique", weight: "bold")[#titulo-resume]\
          #set text(size: 0.8em, style: "italic")
          #descripcion
          #line(length: 10%, stroke: black + 0.5pt)
        ]
        #v(0.6em)
      ]
    )
}

/*
 ****************
 *              *
 * Estilo xeral *
 *              *
 ****************
 */
#let estilo(
    // Opcións da páxina
    columnas: 1,
    marxes: auto,

    // Opcións do texto
    fonte: "Libertinus Serif",
    tamaño-fonte: 11pt,
    linguaxe: "es",

    // Opcións do documento
    titulo: none,
    autor: (),
    data: datetime.today(),
    descripcion: none, // O resume / abstract
    claves: (), // Palabras clave

    // Outras opcións
    titulo-resume: "Resume:",
    justificacion: true,

    documento
) = {
    set document(
      title: titulo,
      author: autor,
      date:
        if data != none {data} else {none},
      description: descripcion,
      keywords: claves,
    )
    set text(
      font: fonte,
      size: tamaño-fonte,
      lang: linguaxe,
    )
    set par(
      justify: justificacion
    )
    set page(
      paper: "a4", columns: columnas, margin: marxes,
    )

    // Título
    título(
        titulo: titulo,
        titulo-resume: titulo-resume,
        autor: autor,
        data: data,
        descripcion: descripcion,
      )

    // Resto do documento
    documento
}




/*
 **********************
 *                    *
 * Estilo de captions *
 *                    *
 **********************
 */

#let captions(
  // Xeral
  fonte: "Libertinus serif",
  // Suplemento
  sup-style: "normal", sup-weight: "regular",
  // Separador
  sep: auto, sep-style: "normal", sep-weight: "regular",
  // Corpo
  body-style: "normal", body-weight: "regular",

  arquivo
) = {
    set figure.caption(separator: sep)
    show figure.caption: it => { 
        text(font: fonte, style: sup-style, weight: sup-weight)[ #it.supplement #context it.counter.display(it.numbering)]
        text(font: fonte, style: sep-style, weight: sep-weight)[#it.separator]
        text(font: fonte, style: body-style, weight: body-weight)[#it.body]
    }
    arquivo
}
