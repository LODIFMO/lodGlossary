module Terms.List exposing (..)

import Html exposing (Html, div, text, program, table, thead, tbody, tr, td, th,
                      button, i)
import Html.Attributes exposing (..)
import Terms.Messages exposing (..)
import Terms.Models exposing (Term)

view : List Term -> Html Msg
view terms =
  div []
    [ list terms ]

list : List Term -> Html Msg
list terms =
  div [ class "row" ]
    [ table [ class "table table-hover table-striped" ]
      [ thead []
        [ tr []
          [ th [] [ text "Термин" ]
          , th [] [ text "Эталон" ]
          , th [] [ text "DBpedia" ]
          ]
        ]
      , tbody [] ( List.map termRow terms )
      ]
    ]

termRow : Term -> Html Msg
termRow term =
  tr []
    [ td [] [ text term.title ]
    , td [] [ text term.description ]
    , td [] [ text term.dbpedia_description ]
    , td []
      [ button [ class "btn btn-info btn-xs"]
        [ i [ class "fa fa-fw fa-eye" ] []
        ]
      ]
    ]
