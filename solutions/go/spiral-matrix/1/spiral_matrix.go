package spiralmatrix

func SpiralMatrix(size int) [][]int {
    var spiral = make([][]int, size)

    for i := 0; i < size; i++ {
        spiral[i] = make([]int, size)
    }

    var startRow, startCol int = 0, 0
    var endRow, endCol int = size - 1, size - 1

    var num = 1

    for num <= size * size {

        // right
        for col := startCol; col <= endCol; col++ {
            spiral[startRow][col] = num
            num++
        }
        startRow++

        // down
        for row := startRow; row <= endRow; row++ {
            spiral[row][endCol] = num
            num++
        }
        endCol--

        // left
        for col := endCol; col >= startCol; col-- {
            spiral[endRow][col] = num
            num++
        }
        endRow--

        // up
        for row := endRow; row >= startRow; row-- {
            spiral[row][startCol] = num
            num++
        }
        startCol++
    }

    return spiral
}
