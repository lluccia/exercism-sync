(ns sublist)

(defn is-contained [list1 list2]
  (some #(= list1 %) (partition (count list1) 1 list2))
)

(defn classify [list1 list2]
  (if (= list1 list2)
    :equal
    (if (is-contained list1 list2) 
      :sublist
      (if (is-contained list2 list1) 
        :superlist
        :unequal
      )
    )
  )
)
