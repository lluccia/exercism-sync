class Minesweeper
  @rows : Int32
  @cols : Int32

  def initialize(board : Array(String))
    @board = board
    @rows = board.size
    if @rows > 0
      @cols = board[0].size
    else
      @cols = 0
    end
  end

  def cell(r : Int32, c : Int32)
    return @board[r].chars[c]
  end

  def has_mine(r : Int32, c : Int32)
    if r < 0 || r >= @rows || c < 0 || c >= @cols
      return false
    end
    return cell(r, c) == '*'
  end


  def mine_count(r : Int32, c : Int32)
    if has_mine(r, c)
      return '*'
    end

    count = 0
    (r-1..r+1).each do |row|
      (c-1..c+1).each do |col|
        if !(row == r && col == c) && has_mine(row, col)
          count = count + 1
        end
      end
    end

    if count == 0
      return ' '
    else
      return count
    end

  end

  def annotate
    if @rows == 0
      return @board
    end

    a_board = Array(String).new
    (0...@rows).each do |row|
      a_row = ""
      (0...@cols).each do |col|
        a_row = a_row + "#{mine_count(row, col)}"
      end
      a_board.push(a_row)
    end

    return a_board
  end

end
