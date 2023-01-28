module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, eventCategoryToString, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)



type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]

eventCategoryToString : EventCategory -> String
eventCategoryToString eventCategory = 
  case eventCategory of
    Academic -> "Academic"
    Work -> "Work"
    Project -> "Project"
    Award -> "Award"


{-| Type used to represent the state of the selected event categories
-}
type alias SelectedEventCategories = 
    List(EventCategory, Bool)
     

{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected =
    [(Academic, True), (Work, True), (Project, True), (Award, True)] 


{-| Returns an instance of `SelectedEventCategories` with no categories selected

-- isEventCategorySelected Academic noneSelected --> False

-}
noneSelected : SelectedEventCategories
noneSelected =
    [(Academic, False), (Work, False), (Project, False), (Award, False)]

{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    current
    |> List.filter (\x -> Tuple.first x == category)
    |> List.all (\x -> Tuple.second x == True)


{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
  let
    setHelp : (EventCategory, Bool) -> EventCategory -> Bool -> (EventCategory, Bool)
    setHelp curr cat val =
      case (Tuple.first curr, cat) of
        (Academic, Academic) ->
          (cat, val)
        (Work, Work) ->
          (cat, val)
        (Project, Project) ->
          (cat, val)
        (Award, Award) ->
          (cat, val)
        (_, _)->
          curr
  in
    current
    |> List.map (\x -> setHelp x category value)
    

checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
    div [] 
    [
      checkbox "Academic" (isEventCategorySelected Academic model) Academic
    , checkbox "Work" (isEventCategorySelected Work model) Work
    , checkbox "Project" (isEventCategorySelected Project model) Project
    , checkbox "Award" (isEventCategorySelected Award model) Award
    ]


