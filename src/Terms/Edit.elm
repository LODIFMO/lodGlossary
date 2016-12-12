module Terms.Edit exposing (..)

import Html exposing (..)
-- import Html.Attributes exposing (..)
import Terms.Messages exposing (..)
import Terms.Models exposing (..)

view : Term -> Html Msg
view model =
  div []
    [ form model
    ]

form : Term -> Html Msg
form model =
  div []
    [ h1 [] [ text "QWE" ] ]
