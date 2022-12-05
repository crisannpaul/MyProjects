module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Model.Event.Category exposing (EventCategory(..), eventCategoryToString)
import Model.Interval as Interval exposing (Interval, compare, view)
import Compare exposing (Comparator)
import Model.Interval

type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
  let
    eventComparator : Comparator Event
    eventComparator = 
      Compare.compose .interval Interval.compare |> Compare.reverse
  in
    List.sortWith eventComparator events

{-
eventComparator : Comparator Event
eventComparator = 
  Compare.compose .interval Interval.compare |> Compare.reverse
-}



view : Event -> Html Never
view event =
  let
    eventClass : Event -> String
    eventClass ev = 
      if ev.important then "event event-important"
      else "event"
  in
    div [class (eventClass event)] 
    [
      h3 [class "event-title"] [text event.title]
    , div [class "event-interval"] [(Model.Interval.view event.interval)]
    , ul [] 
      [
        li [class "event-description"] [event.description]
      , li [class "event-category"] [text (Model.Event.Category.eventCategoryToString event.category)]
      , li [class "event-url"] [text (Maybe.withDefault "No event url" event.url)]
      ]
    ]
