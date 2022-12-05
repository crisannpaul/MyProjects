module Model.WeatherItems exposing (SelectedWeatherItems, WeatherItem(..), allSelected, isItemSelected, set, weatherItems)

import Html exposing (..)
import Html.Attributes as HA exposing (class, style)
import Html.Events exposing (..)
import View.WeatherChart exposing (ShownItems)


{-| Items that can be shown or hidden in the weather chart

**Don't modify**

-}
type WeatherItem
    = Temperature
    | Precipitation
    | MinMax
    | CurrentTime


weatherItems : List WeatherItem
weatherItems =
    [ Temperature
    , Precipitation
    , MinMax
    , CurrentTime
    ]


type alias SelectedWeatherItems =
    List(WeatherItem, Bool)


{-| Returns an instance of `SelectedWeatherItems` with all items selected

    isItemSelected Temperature allSelected --> True

    List.all (\i -> isItemSelected i allSelected) weatherItems --> True

-}
allSelected : SelectedWeatherItems
allSelected =
    [(Temperature, True), (Precipitation, True), (MinMax, True), (CurrentTime, True)]


{-| Given the current state and an `item` it returns whether the `item` is selected.

    isItemSelected Temperature allSelected --> True

-}
isItemSelected : WeatherItem -> SelectedWeatherItems -> Bool
isItemSelected item current =
    current
    |> List.filter (\x -> Tuple.first x == item)
    |> List.all (\x -> Tuple.second x == True)

{-| Given an `item`, a boolean `value` and the current state, it sets the given `item` in `current` to `value`.

    allSelected |> set Temperature False |> isItemSelected Temperature --> False

    allSelected |> set Precipitation False |> isItemSelected Temperature --> True

-}
set : WeatherItem -> Bool -> SelectedWeatherItems -> SelectedWeatherItems
set item value current =
    let
        setHelp : (WeatherItem, Bool) -> WeatherItem -> Bool -> (WeatherItem, Bool)
        setHelp curr itm val =
          case (Tuple.first curr, itm) of
            (Temperature, Temperature) ->
              (itm, val)
            (Precipitation, Precipitation) ->
              (itm, val)
            (MinMax, MinMax) ->
              (itm, val)
            (CurrentTime, CurrentTime) ->
              (itm, val)
            (_, _)->
              curr
  in
    current
    |> List.map (\x -> setHelp x item value)
