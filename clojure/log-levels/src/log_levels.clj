(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (clojure.string/trim (clojure.string/replace s #"^\[\w+\]\: (.*)$" "$1"))
  )

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (clojure.string/trim (clojure.string/lower-case (clojure.string/replace s #"^\[(\w+)\]\:.*$" "$1")))
  )

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (clojure.string/join [(log-levels/message s) " (" (log-levels/log-level s) ")"])
  )
