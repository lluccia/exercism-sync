(ns bob)
(use 'clojure.string)

(defn is-silence?  [s] (= "" (trim s)))
(defn is-question? [s] (ends-with? (trim s) "?"))
(defn is-shouting? [s] 
  (and 
    (= s (clojure.string/upper-case s))
    (not (= s (clojure.string/lower-case s)))
  )
)

(defn response-for [s]
  (if (is-silence? s)
    "Fine. Be that way!"
    (if (and (is-question? s) (is-shouting? s))
      "Calm down, I know what I'm doing!"
      (if (is-question? s)
        "Sure."
        (if (is-shouting? s) 
          "Whoa, chill out!"
          "Whatever."
        )
      )
    )
  )
)

; 