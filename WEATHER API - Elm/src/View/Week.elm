module View.Week exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (..)
import Util.Time exposing (Date, formatDate)
import View.Day exposing (DailyData, view)

type alias WeeklyData =
    { dailyData : List DailyData
    }


{-| Generates Html based on `WeeklyData`

Some relevant functions:

  - `Util.Time.formatDate`

-}


view : WeeklyData -> Html msg
view weeklyData =
    let 
        dailyDataHtml = List.map View.Day.view weeklyData.dailyData
    in
        div [class "week"] 
        [
            h2 [] (dailyDataHtml)
        ]
       

