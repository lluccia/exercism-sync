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

  def hasMine(r : Int32, c : Int32)
    if r < 0 || r >= @rows || c < 0 || c >= @cols
      return false
    end
    return cell(r, c) == '*'
  end

  
  def mineCount(r : Int32, c : Int32)
    if hasMine(r, c)
      return '*'
    end

    count = 0
    (r-1..r+1).each do |row|
      (c-1..c+1).each do |col|
        if !(row == r && col == c) && hasMine(row, col)
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
    
    aBoard = Array(String).new
    (0...@rows).each do |row|
      aRow = ""
      (0...@cols).each do |col|
        aRow = aRow + "#{mineCount(row, col)}"
      end
      aBoard.push(aRow)
    end

    return aBoard
  end

end
