(import-macros {: incf : with-color : with-font} :sample-macros)

(love.graphics.setNewFont :a/FairFaxHD.ttf 30)

(local card-background 
  (love.graphics.newImage :a/a.png))

(fn draw-card-canvas [atk def cost name image]
  (let [canvas (love.graphics.newCanvas 
                     (card-background:getWidth)
                     (card-background:getHeight))]
    (love.graphics.setCanvas canvas)
    (love.graphics.draw card-background)
    (with-color
        [0 0 0]
        (with-font
          [15]
          (love.graphics.printf cost 48 3 15 :center)
          (love.graphics.printf name 2 3 45 :center)
          (love.graphics.printf atk 2 74 22 :center)
          (love.graphics.printf def 41 74 22 :center)))
    (love.graphics.setCanvas)
    canvas))

(fn new-card [atk def cost name]
  {:atk atk
   :def def
   :name name
   :texture (draw-card-canvas atk def cost name)
   :draw (fn [self x y]
           (love.graphics.draw self.texture x y))})

(local player
  {:deck [(new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)
          (new-card 1 1 1 :wolf)]
   :hand []
   :draw_cards (fn [self num]
                 (var amount (or num 0))
                 (for [i 1 amount]
                   (table.insert self.hand (table.remove self.deck 1))))})

{:draw (fn draw [message])

 :update (fn update [dt set-mode])
 
 :keypressed (fn keypressed [key set-mode]
                 (love.event.quit))}

