module Main exposing (..)

import Html exposing (Html, div, text, program, table, thead, tbody, tr, td, th, button)
import Html.Attributes exposing (..)

-- MODEL

type alias Model =
  { id: String
  , title: String
  , description: String
  , dbpedia_description: String
  }

default_init : Model
default_init =
  { id = ""
  , title = ""
  , description = ""
  , dbpedia_description = ""
  }

init : ( Model, Cmd Msg )
init =
  ( default_init, Cmd.none )

-- MESSAGES

type Msg
  = NoOp

-- VIEW

view : Model -> Html Msg
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

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- MAIN

main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
