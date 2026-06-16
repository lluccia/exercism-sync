(ns raindrops)

(defn divisible? [num divisor]
  (= 0 (mod num divisor)))

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [sounds (apply str
                 (cond-> []
                   (divisible? num 3) (conj "Pling")
                   (divisible? num 5) (conj "Plang")
                   (divisible? num 7) (conj "Plong")
                  )
                )
        ]

    (if (empty? sounds)
      (str num)
      sounds)
  )
)
