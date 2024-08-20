(fn incf [value ?by]
  `(set ,value (+ ,value (or ,?by 1))))

(fn decf [value ?by]
  `(set ,value (- ,value (or ,?by 1))))

(fn with [t keys ?body]
  `(let [,keys ,t]
     (if ,?body
         ,?body
         ,keys)))

(fn with-color [clrs ...]
  `(let [[r# g# b# a#] [(love.graphics.getColor)]]
     (love.graphics.setColor ,(unpack clrs))
     (do ,(unpack [...]))
     (love.graphics.setColor r# g# b# a#)))

(fn with-font [font ...]
  `(let [Oldfont# (love.graphics.getFont)]
     (love.graphics.setNewFont ,(unpack font))
     (do ,(unpack [...]))
     (love.graphics.setFont Oldfont#)))

{: incf : decf : with : with-color : with-font}
