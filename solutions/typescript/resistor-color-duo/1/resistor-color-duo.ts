export class ResistorColor {
  private colors: string[]

  constructor(colors: string[]) {
    if (colors.length<2)
      throw new Error("At least two colors need to be present");
      
    this.colors = colors
  }
  value = (): number =>
    Number(
      colorCode(this.colors[0]).toString().concat(
      colorCode(this.colors[1]).toString())
  );
}

export const colorCode = (color:string) => {
  for (let index = 0; index < COLORS.length; index++)
    if (COLORS[index] == color)
      return index;

  return -1
}

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
]