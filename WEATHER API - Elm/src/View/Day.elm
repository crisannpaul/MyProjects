module View.Day exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (..)
import Util.Time exposing (..)


{-| Don't modify
-}
type alias DailyData =
    { date : Date
    , highTemp : Maybe Float
    , lowTemp : Maybe Float
    , totalPrecipitaion : Float
    }


{-| Generates Html based on `DailyData`

Some relevant functions:

  - `Util.Time.formatDate`

-}
view : DailyData -> Html msg
view day =
  let 
    highTemp temp = 
      case temp of
        Just t -> "High temperature: " ++ (String.fromFloat t)
        Nothing -> "unavailable"
    
    lowTemp temp = 
      case temp of
        Just t -> "Low temperature: " ++ (String.fromFloat t)
        Nothing -> "unavailable"  
  in
    div [class "day"] 
    [ h3 [class "day-date"] [text (Util.Time.formatDate day.date)]
    , p [class "day-hightemp"] [text (highTemp day.highTemp)]
    , p [class "day-lowtemp"] [text (lowTemp day.lowTemp)]
    , p [class "day-precipitation"] [text ("Precipitation: " ++ String.fromFloat day.totalPrecipitaion)]
    ]
