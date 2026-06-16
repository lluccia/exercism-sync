let anagrams = (target, candidates) => {
  let lowerTarget = Js.String.toLowerCase(target);
  let sortedTarget =
     lowerTarget
     |> Js.String.split("")
     |> Js.Array.sortInPlace
     |> Js.Array.joinWith("");

  List.filter(
    (candidate) => {
      let lowerCandidate = Js.String.toLowerCase(candidate);
      let sortedCandidate =
        lowerCandidate
        |> Js.String.split("")
        |> Js.Array.sortInPlace
        |> Js.Array.joinWith("");
      
      lowerCandidate != lowerTarget && sortedCandidate == sortedTarget;
    },
    candidates
  );
};
