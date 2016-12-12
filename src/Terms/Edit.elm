module Terms.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Terms.Messages exposing (..)
import Terms.Models exposing (..)

view : Term -> Html Msg
view model =
  div []
    [ form model
    ]

form : Term -> Html Msg
form model =
  div [ class "panel panel-default" ]
    [ div [ class "panel-heading" ]
      [ h3 [] [ text model.title ]
      ]
    , div [ class "panel-body" ]
      [ div [ class "panel panel-success" ]
        [ div [ class "panel-heading" ] [ text "Эталон" ]
        , div [ class "panel-body" ]
          [ div [ attribute "style" "text-align: justify" ]
              [ text model.description ]
          ]
        ]
      , div [ class "panel panel-danger" ]
        [ div [ class "panel-heading" ] [ text "Выборка DBpedia" ]
        , div [ class "panel-body" ]
          [ div [ attribute "style" "text-align: justify" ]
              [ text model.dbpedia_description ]
          ]
        ]
      ]
    ]
