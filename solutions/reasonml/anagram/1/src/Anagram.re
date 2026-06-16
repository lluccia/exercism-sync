let anagrams = (target, candidates) => {
  let lowerTarget = Js.String.toLowerCase(target);
  let sortedTarget =
     lowerTarget
     |> Js.String.split("")
     |> (chars => {Array.sort(String.compare, chars); chars;})
     |> Js.Array.joinWith("");

  List.filter(
    (candidate) => {
      let lowerCandidate = Js.String.toLowerCase(candidate);
      let sortedCandidate =
        lowerCandidate
        |> Js.String.split("")
        |> (chars => {Array.sort(String.compare, chars); chars;})
        |> Js.Array.joinWith("");
      
      lowerCandidate != lowerTarget && sortedCandidate == sortedTarget;
    },
    candidates
  );
};
