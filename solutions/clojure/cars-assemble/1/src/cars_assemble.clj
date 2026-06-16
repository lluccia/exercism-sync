(ns cars-assemble)

(def cars-per-hour 221.0)

(defn success-rate
  "Returns the success rate given the assembly line speed"
  [speed]
  (cond 
    (= speed 0) 0.0
    (< speed 5) 1.0
    (< speed 9) 0.9
    (= speed 9) 0.8
    (= speed 10) 0.77))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* speed (success-rate speed) cars-per-hour))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
