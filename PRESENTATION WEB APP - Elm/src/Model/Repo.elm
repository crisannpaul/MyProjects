module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De exposing (..)
import Compare exposing (Comparator)


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
    div [class "repo"] 
    [
      h3 [class "repo-name"] [text repo.name]
    , div [class "description"] [text (Maybe.withDefault "No desctiprion" repo.description)]
    , div [class "repo-url"] [a [href repo.url] [text "Link to repository"]]
    , p [class "repo-stars"] [text (String.fromInt repo.stars), text " stars"]
    ]

sortByStars : List Repo -> List Repo
sortByStars repos =
  let
    starsComparator : Comparator Repo
    starsComparator = 
      Compare.by .stars
  in
    List.reverse (List.sortWith starsComparator repos)


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
  De.map5 Repo 
    (De.field "name" De.string)
    (De.maybe (De.field "description" De.string))
    (De.field "html_url" De.string)
    (De.field "pushed_at" De.string)
    (De.field "stargazers_count" De.int)


    
    

