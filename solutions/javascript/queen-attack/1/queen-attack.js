import { write } from "fs";

const ROW_INDEX = 0;
const COLUMN_INDEX = 1;

export class QueenAttack {
  constructor({
    black: [blackRow, blackColumn] = [0, 3],
    white: [whiteRow, whiteColumn] = [7, 3],  
  } = {}) {

    this.black = [blackRow, blackColumn];
    this.white = [whiteRow, whiteColumn];

    if (this.#isOutOfBoard(this.white) || this.#isOutOfBoard(this.black))
      throw new Error('Queen must be placed on the board');
    
    if (this.#areSamePosition(this.white, this.black))
      throw new Error('Queens cannot share the same space');
  }

  toString() {
    let board = []
    for (let row = 0; row < 8; row++) {
      let boardRow = '';
      for (let column = 0; column < 8; column++) {
        if (this.#areSamePosition(this.white, [row, column]))
          boardRow += 'W ';
        else if (this.#areSamePosition(this.black, [row, column]))
          boardRow += 'B ';
        else
          boardRow += '_ ';
      }
      board.push(boardRow.trim());
    }
    return board.join('\n');
  }

  get canAttack() {
    return this.#areOnSameColumn()
        || this.#areOnSameRow()
        || this.#areOnSameDiagonal();
      
  }

  #isOutOfBoard(piece) {
    return piece[ROW_INDEX] < 0 || piece[ROW_INDEX] > 7 
        || piece[COLUMN_INDEX] < 0 || piece[COLUMN_INDEX] > 7;
  }

  #areSamePosition(piece1, piece2){
    return (piece1[ROW_INDEX] == piece2[ROW_INDEX] 
      && piece1[COLUMN_INDEX] == piece2[COLUMN_INDEX]);
  }

  #areOnSameRow() {
    return this.white[ROW_INDEX] == this.black[ROW_INDEX];
  }

  #areOnSameColumn() {
    return this.white[COLUMN_INDEX] == this.black[COLUMN_INDEX];
  }

  #areOnSameDiagonal() {
    let rowDistance = Math.abs(this.white[ROW_INDEX] - this.black[ROW_INDEX]);
    let columnDistance = Math.abs(this.white[COLUMN_INDEX] - this.black[COLUMN_INDEX]);
    return rowDistance == columnDistance;
  }
}
