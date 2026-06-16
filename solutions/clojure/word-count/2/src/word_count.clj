(ns word-count)

(defn word-count
  "Counts how many times each word occurs in the given string."
  [s]
  (frequencies (re-seq #"\w+(?:'\w+)*" (clojure.string/lower-case s)))
)
