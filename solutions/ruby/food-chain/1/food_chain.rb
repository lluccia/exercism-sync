class FoodChain

  def self.song
    animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
    reactions = ["",
      "It wriggled and jiggled and tickled inside her.",
      "How absurd to swallow a bird!",
      "Imagine that, to swallow a cat!",
      "What a hog, to swallow a dog!",
      "Just opened her throat and swallowed a goat!",
      "I don't know how she swallowed a cow!",
      "She's dead, of course!"]

    song = ""

    animals.each_with_index do |animal, index|
      song += "I know an old lady who swallowed a #{animal}.\n"
      if index > 0
        song += reactions[index] + "\n"
      end

      if animal != "horse"
        if animal != "fly"
          (1..index).reverse_each do |i|
            song += "She swallowed the #{animals[i]} to catch the #{animals[i-1]}"
            if animals[i-1] == "spider"
              song += " that wriggled and jiggled and tickled inside her"
            end
            song += ".\n"
          end
        end

        song += "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
      end
    end

    song
  end

end
