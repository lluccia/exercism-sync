module TwoBucket
  enum Bucket
    One
    Two
  end

  struct Result
    property moves, other_bucket, goal_bucket

    def initialize(@moves : UInt32, @other_bucket : UInt32, @goal_bucket : Bucket)
    end
  end

  def self.measure(bucket_one : UInt32, bucket_two : UInt32, goal : UInt32, start_bucket : Bucket) : Result
    initial_state = start_bucket == Bucket::One ? {bucket_one, 0_u32} : {0_u32, bucket_two}
    
    moves = 1_u32
    queue = [{initial_state, moves}]
    visited = Set.new([initial_state])

    while queue.size > 0
      current_state, moves = queue.shift
      bucket1, bucket2 = current_state

      if bucket1 == goal
        return Result.new(moves, bucket2, Bucket::One)
      elsif bucket2 == goal
        return Result.new(moves, bucket1, Bucket::Two)
      end

      next_states = [
        {bucket_one, bucket2},  # Fill bucket1
        {bucket1, bucket_two},  # Fill bucket2
        {0_u32, bucket2},       # Empty bucket1
        {bucket1, 0_u32},       # Empty bucket2
        {bucket1 - [bucket1, bucket_two - bucket2].min, bucket2 + [bucket1, bucket_two - bucket2].min},  # Pour bucket1 -> bucket2
        {bucket1 + [bucket2, bucket_one - bucket1].min, bucket2 - [bucket2, bucket_one - bucket1].min}   # Pour bucket2 -> bucket1
      ]

      next_states.each do |state|
        # Ensure we do not arrive at a state where the initial starting bucket is empty and the other bucket is full
        if !(start_bucket == Bucket::One && state == {0_u32, bucket_two}) &&
           !(start_bucket == Bucket::Two && state == {bucket_one, 0_u32}) &&
           !visited.includes?(state)
          visited.add(state)
          queue.push({state, moves + 1})
        end
      end
    end

    raise ArgumentError.new("No solution found")
  end
end
