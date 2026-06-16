def rotate_count:
   if . < 0 then 99 else . end;

def bottle_text:
   . | rotate_count |
   if . > 1 then "\(.) bottles" 
   elif . == 1 then "1 bottle"
   else "No more bottles"
   end
;

def take_text:
    if . > 1 then "Take one down and pass it around"
    elif . == 1 then "Take it down and pass it around"
    else "Go to the store and buy some more"
    end
;

def verse(bottles):
    [
        "\(bottles | bottle_text) of beer on the wall, \(bottles | bottle_text | ascii_downcase) of beer.",
        "\(bottles | take_text), \(bottles - 1 | bottle_text | ascii_downcase) of beer on the wall."
    ]
;

def song(bottles; takeDown):
    if (takeDown > 1) then
        verse(bottles) + [""] + song(bottles - 1; takeDown - 1)
    else
        verse(bottles)
    end
;

song(.startBottles; .takeDown)

