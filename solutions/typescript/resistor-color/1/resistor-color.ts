export const colorCode = (color:string) => {

  for (let index = 0; index < COLORS.length; index++)
    if (COLORS[index] == color)
      return index;

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
