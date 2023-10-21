(ns difference-of-squares)

(defn sum-of-squares
  [num]
  (int (reduce (fn [cur i] (+ cur (Math/pow i 2))) 0 (range 1 (+ num 1))))
)

(defn square-of-sum
  [num]
  (int (Math/pow (reduce + 0 (range 1 (+ num 1))) 2))
)

(defn difference [num]
  (- (difference-of-squares/square-of-sum num) (difference-of-squares/sum-of-squares num))
)
