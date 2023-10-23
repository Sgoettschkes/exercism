(ns matching-brackets)

(defn valid? 
  [string]
  (loop [clean (clojure.string/replace string #"[^\[\]\{\}\(\)]" "")]
    (if (= nil (re-find #".*((\(\))|(\[\])|(\{\})).*" clean))
      (= clean "")
      (recur (clojure.string/replace clean #"(\(\))|(\[\])|(\{\})" ""))
    )
  ))
