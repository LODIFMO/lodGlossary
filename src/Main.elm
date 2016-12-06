module Main exposing (..)

import Html exposing (Html, div, text, program, table, thead, tbody, tr, td, th, button)
import Html.Attributes exposing (..)

-- MODEL

type alias Term =
  { id: String
  , title: String
  , description: String
  , dbpedia_description: String
  }

type alias Terms =
  List Term

default_init : Term
default_init =
  { id = ""
  , title = ""
  , description = ""
  , dbpedia_description = ""
  }

init : ( Term, Cmd Msg )
init =
  ( default_init, Cmd.none )

-- MESSAGES

type Msg
  = NoOp

-- VIEW

view : Term -> Html Msg
view model =
  div [ class "row" ]
    [ table [ class "table table-hover" ]
      [ thead []
        [ tr []
          [ th [] [ text "Термин" ]
          , th [] [ text "Эталон" ]
          , th [] [ text "DBpedia" ]
          , th [] []
          ]
        ]
      ]
    ]

-- UPDATE

update : Msg -> Term -> ( Term, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

-- SUBSCRIPTIONS

subscriptions : Term -> Sub Msg
subscriptions model =
  Sub.none

-- MAIN

main : Program Never Term Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
