#let generate_drawing_exercise(sentence) = {
  [= Writing exercies]
  for character in sentence.codepoints().dedup() {
    let blocks = (1, 2, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 0).map(item => {
      block(width: 50pt)[
        #place(
          path(
            stroke: gray,
            (0pt, 0pt), 
            (0pt , 50pt),
            (50pt, 50pt),
            (50pt, 0pt),
            (0pt, 0pt), 
            (0pt, 25pt), 
            (50pt, 25pt), 
            (50pt, 0pt), 
            (25pt, 0pt),
            (25pt, 50pt),
          )
        )
        #place(
          center,
          dy: 3pt,
          [
            #if item == 1 {
              [#text(size: 42pt, font: "KanjiStrokeOrders", character)]
            } else if item == 2 {
               [#text(size: 42pt, gray, font: "KanjiStrokeOrders", character)]

            }
          ]
        )
      ]
    })

    grid(columns: 9, rows: (50pt),
      ..blocks,
    )
  }
  pagebreak()
  [== Now try writing the sentence on your own]
  [\ \ ]
  [#text(size: 22pt, sentence)]
}