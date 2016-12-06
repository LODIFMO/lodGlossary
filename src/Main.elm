module Main exposing (..)

import Html exposing (Html, div, text, program, h1, p, br, span)
import Html.Attributes exposing (..)

-- MODEL

type alias Model =
  String

init : ( Model, Cmd Msg )
init =
  ( "Hello", Cmd.none )

-- MESSAGES

type Msg
  = NoOp

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "row" ]
    [ div [ class "starter-template" ]
      [ h1 [] [ text model ]
      , p [ class "lead" ]
        [ span [] [ text "Use this document as a way to quickly start any new project." ]
        , br [] []
        , span [] [ text "All you get is this text and a mostly barebones HTML document." ]
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
