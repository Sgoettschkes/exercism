(ns robot-name)

(def used-names (atom #{}))

(defn gen-name-str []
  (str (char (+ (rand-int 26) 65)) (char (+ (rand-int 26) 65)) (rand-int 9) (rand-int 9) (rand-int 9))
)

(defn gen-name []
  (let [name (gen-name-str)]
    (if (@used-names name) 
        (recur)
        (do
          (swap! used-names conj name)
          name))))

(defrecord Robot [name])

(defn robot []
  (->Robot (atom (gen-name))))

(defn robot-name [r]
  @(:name r))

(defn reset-name [r]
  (reset! (:name r) (gen-name)))
