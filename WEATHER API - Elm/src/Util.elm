module Util exposing (groupBy, maximumBy, maybeToList, minimumBy, zipFilter)

import List exposing (..)

{-| Module containing utility functions
-}


{- Description for minimumBy

    minimumBy .x [ { x = 1, y = 2 } ] --> Just {x = 1, y = 2}

    minimumBy .x [] --> Nothing

    minimumBy (modBy 10) [ 16, 23, 14, 5 ] --> Just 23
-}
minimumBy : (a -> comparable) -> List a -> Maybe a
minimumBy factor list =
  list 
    |> List.sortBy factor
    |> List.head
    


{-| Description for maximumBy

    maximumBy .x [ { x = 1, y = 2 } ] --> Just {x = 1, y = 2}

    maximumBy .x [] --> Nothing

    maximumBy (modBy 10) [ 16, 23, 14, 5 ] --> Just 16

-}
maximumBy : (a -> comparable) -> List a -> Maybe a
maximumBy factor list =
  let 
    lastElem : List a -> Maybe a
    lastElem lst =
      case lst of
        [] ->
            Nothing
        [last] ->
            Just last

        head :: rest ->
            lastElem rest
  in
    list 
    |> List.sortBy factor
    |> lastElem


{-| Group a list

    groupBy .x [ { x = 1 } ] --> [(1, [{x = 1}])]

    groupBy (modBy 10) [ 11, 12, 21, 22 ] --> [(1, [11, 21]), (2, [12, 22])]

    groupBy identity [] --> []

-}

groupBy : (a -> b) -> List a -> List(b, List a)
groupBy fnc list = 
    let 
        gatherWith : (a -> a -> Bool) -> List a -> List ( a, List a )
        gatherWith testFn lst =
            let
                helper : List a -> List ( a, List a ) -> List ( a, List a )
                helper scattered gathered =
                    case scattered of
                        [] ->
                           List.reverse gathered
       
                        toGather :: population ->
                            let
                                ( gathering, remaining ) =
                                   List.partition (testFn toGather) population
                            in
                                helper remaining (( toGather, gathering ) :: gathered)
            in
                helper lst []

        gatherEqualsBy : (a -> b) -> List a -> List ( a, List a )
        gatherEqualsBy extract lst =
           gatherWith (\a b -> extract a == extract b) lst

    in
        List.map(\(a,b) -> ((fnc a), a :: b)) (gatherEqualsBy fnc list)


{-| Transforms a Maybe into a List with one element for Just, and an empty list for Nothing

    maybeToList (Just 1) --> [1]

    maybeToList Nothing --> []

-}
maybeToList : Maybe a -> List a
maybeToList elem =
    case elem of 
      Just a -> [a]
      Nothing -> []
    

{-| Filters a list based on a list of bools

    zipFilter [ True, True ] [ 1, 2 ] --> [1, 2]

    zipFilter [ False, False ] [ 1, 2 ] --> []

    zipFilter [ True, False, True, False ] [ 1, 2, 3, 4 ] --> [1, 3]

-}
zipFilter : List Bool -> List a -> List a
zipFilter listBool list =
  let 
    listZip = List.map2 Tuple.pair listBool list 
  in
    listZip
      |> List.filter (\x -> Tuple.first x == True)
      |> List.map Tuple.second
