module Terms.List exposing (..)

import Html exposing (Html, div, text, program, table, thead, tbody, tr, td, th,
                      button, i, a)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Terms.Messages exposing (..)
import Terms.Models exposing (Term)

view : List Term -> Html Msg
view terms =
  div []
    [ list terms ]

list : List Term -> Html Msg
list terms =
  div [ class "row" ]
    [ a [ attribute "href" "/#new"
        , class "btn btn-primary" 
        ]
      [ i [ class "fa fa-fw fa-plus" ] []
      , text "Add new term"  
      ]
    , table [ class "table table-hover table-striped" ]
      [ thead []
        [ tr []
          [ th [] [ text "Термин" ]
          , th [] [ text "Эталон" ]
          , th [] [ text "DBpedia" ]
          , th [] []
          ]
        ]
      , tbody [] ( List.map termRow terms )
      ]
    ]

termRow : Term -> Html Msg
termRow term =
  tr []
    [ td [ attribute "width" "5%" ] [ text term.title ]
    , td [ attribute "width" "45%" ] [ text term.description ]
    , td [ attribute "width" "45%" ] [ text term.dbpedia_description ]
    , td [ attribute "width" "5%" ]
      [ button [ onClick ( ShowTerm term.id )
          , class "btn btn-info"
          ]
          [ i [ class "fa fa-fw fa-eye" ] []
          ]
      ]
    ]
