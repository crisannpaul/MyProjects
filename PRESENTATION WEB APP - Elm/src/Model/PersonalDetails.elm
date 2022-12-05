module Model.PersonalDetails exposing (..)

import Html exposing (..)
import List
import Html.Attributes exposing (class, classList, id)
--import Main exposing (..)
import Html.Attributes exposing (href)
import Model.Date exposing (..)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [] 
    [ h1 [id "name"] [text details.name]
    , em [id "intro"] [text "About me: ", text details.intro]
    , h3 [] [text "Contacts: "]
    , toHtmlList details.contacts
    , h3 [] [text "Socials: "]
    , toHtmlRefList details.socials
    ]


toHtmlList : List DetailWithName -> Html msg
toHtmlList details = 
  let
    toSimpleLi : DetailWithName -> Html msg
    toSimpleLi d = 
      li [class "contact-detail"] [text d.name, text ": ", text d.detail]
  in
    ul [] (List.map toSimpleLi details)


toHtmlRefList : List DetailWithName -> Html msg
toHtmlRefList details = 
  let
    toRefLi : DetailWithName -> Html msg
    toRefLi d =
      li [class "social-link"] [a [href d.detail] [text d.name]]
  in
     ul [] (List.map toRefLi details)








