class Bob

  def self.hey(remark)
    if isSilence?(remark)
      "Fine. Be that way!"
    elsif isForcefullyQuestion?(remark)
      "Calm down, I know what I'm doing!"
    elsif isYelling?(remark)
      "Whoa, chill out!"
    elsif isQuestion?(remark)
      "Sure."
    else
      "Whatever."
    end 
  end

  private_class_method def self.isSilence?(remark)
    remark.strip == ""
  end

  private_class_method def self.isYelling?(remark)
    remark.match?(/[a-zA-Z]/) and remark == remark.upcase
  end

  private_class_method def self.isQuestion?(remark)
    remark.strip.end_with?("?")
  end

  private_class_method def self.isForcefullyQuestion?(remark)
    isQuestion?(remark) and isYelling?(remark)
  end
end

