module Terms.Description exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Terms.Messages exposing (..)
import Terms.Models exposing (..)


view : Term -> Html Msg
view term =
  div [ class "page-header" ]
    [ h1 [] [ text term.title ]
    , button [ onClick ShowTerms ] [ text "Click me!" ]
    ]
