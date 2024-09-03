#import "sections/vocab-section.typ" : generate_vocabulary
#import "sections/generate-drawing-exercise.typ" : generate_drawing_exercise
#import "sections/generate-rtk-overview.typ" : generate_rtk_overview

#let sentence = "渋谷までの道を知っていますか？"
#generate_vocabulary(sentence)
#generate_rtk_overview(sentence)
#pagebreak()
#generate_drawing_exercise(sentence)
