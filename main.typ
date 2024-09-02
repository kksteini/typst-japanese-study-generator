#import "sections/vocab-section.typ" : generate_vocabulary
#import "sections/generate-drawing-exercise.typ" : generate_drawing_exercise

#let sentence = "カナダの犬の食べ物です"

#generate_vocabulary(sentence)
#pagebreak()
#generate_drawing_exercise(sentence)

