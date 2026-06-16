(ns robot-simulator)

(defn- turn [direction instruction]
  (let [transitions {:north {"R" :east,  "L" :west}
                     :south {"R" :west,  "L" :east}
                     :east  {"R" :south, "L" :north}
                     :west  {"R" :north, "L" :south}}]
    (get-in transitions [direction instruction])))

(defn- process-instruction [instruction robot-state]
  (let [bearing (if (or (= instruction "R") (= instruction "L"))
                    (turn (:bearing robot-state) instruction)
                    (:bearing robot-state)
                  )
        coordinates (:coordinates robot-state)
        updated-coordinates (if (= instruction "A")
                              (case bearing
                                  :north (update coordinates :y inc)
                                  :south (update coordinates :y dec)
                                  :east (update coordinates :x inc)
                                  :west (update coordinates :x dec)
                                )
                              coordinates)]
      {:bearing bearing :coordinates updated-coordinates}
    )
  )

(defn robot
  "Creates a robot at the given coordinates, facing the given direction."
  [coordinates direction]
    {:bearing direction :coordinates coordinates}
  )

(defn simulate
  "Simulates the robot's movements based on the given instructions
  and updates its state."
  [instructions robot-state]
    (reduce (fn [state instruction]
              (process-instruction (str instruction) state))
            robot-state
            instructions)
  )

