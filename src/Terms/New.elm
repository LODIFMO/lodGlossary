module Terms.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Terms.Messages exposing (..)
-- import Terms.Models exposing (..)

view : Html Msg
view =
  div [ class "panel panel-default" ]
    [ h1 [] [ text "Add new term" ]
    ]
