(ns sublist)

(defn is-contained [list1 list2]
  (some #(= list1 %) (partition (count list1) 1 list2))
)

(defn classify [list1 list2]
  (cond
    (= list1 list2) :equal
    (is-contained list1 list2) :sublist
    (is-contained list2 list1) :superlist
    :else :unequal
  )
)
