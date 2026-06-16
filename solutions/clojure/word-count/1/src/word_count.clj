(ns word-count)

(defn word-count
  "Counts how many times each word occurs in the given string."
  [s]
  (let [words (re-seq #"\w+'\w+|\w+" (clojure.string/lower-case s))]
    (reduce (fn [acc word]
              (update acc word (fnil inc 0)))
            {}
            words)
  )
)
