(ns bob
  (:require [clojure.string :as str])
)

(declare is-silence? is-question? is-shouting?)

(defn response-for [s]
  (cond 
    (is-silence? s) "Fine. Be that way!"
    (and (is-question? s) (is-shouting? s)) "Calm down, I know what I'm doing!"
    (is-question? s) "Sure."
    (is-shouting? s) "Whoa, chill out!"
    :else "Whatever."
  )
)

(defn- is-silence?  [s] (= "" (str/trim s)))
(defn- is-question? [s] (str/ends-with? (str/trim s) "?"))
(defn- is-shouting? [s] 
  (and 
    (= s (str/upper-case s))
    (not (= s (str/lower-case s)))
  )
)