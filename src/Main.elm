module Main exposing (..)

import Html exposing (Html, div, text, program, table, thead, tbody, tr, td, th,
                      button, i)
import Html.Attributes exposing (..)
import Http
import Json.Decode as Decode exposing (field)

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

default_list : Terms
default_list =
  []

init : ( Terms, Cmd Msg )
init =
  ( default_list, Cmd.none )

-- MESSAGES

type Msg
  = NoOp |
    OnFetchAll (Result Http.Error Terms)

-- VIEW

view : Terms -> Html Msg
view terms =
  div [ class "row" ]
    [ table [ class "table table-hover table-striped" ]
      [ thead []
        [ tr []
          [ th [] [ text "Термин" ]
          , th [] [ text "Эталон" ]
          , th [] [ text "DBpedia" ]
          ]
        ]
      ]
    , tbody [] ( List.map termRow terms )
    ]

termRow : Term -> Html Msg
termRow term =
  tr []
    [ td [] [ text term.id ]
    , td [] [ text term.description ]
    , td [] [ text term.dbpedia_description ]
    , td []
      [ button [ class "btn btn-info btn-xs"]
        [ i [ class "fa fa-fw fa-eye" ] []
        ]
      ]
    ]

-- UPDATE

update : Msg -> Terms -> ( Terms, Cmd Msg )
update msg terms =
  case msg of
    OnFetchAll (Ok newTerms) ->
      ( newTerms, Cmd.none )
    OnFetchAll (Err error) ->
      ( terms, Cmd.none )
    NoOp ->
      ( terms, Cmd.none )

fetchAllUrl : String
fetchAllUrl =
  "http://0.0.0.0:9000/terms.json"

fetchAll : Cmd Msg
fetchAll =
  Http.get fetchAllUrl termsDecoder
    |> Http.send OnFetchAll

termsDecoder : Decode.Decoder Terms
termsDecoder =
  Decode.list termDecoder

termDecoder : Decode.Decoder Term
termDecoder =
  Decode.map4 Term
    (field "id" Decode.string)
    (field "title" Decode.string)
    (field "description" Decode.string)
    (field "dbpedia_description" Decode.string)

-- SUBSCRIPTIONS

subscriptions : Terms -> Sub Msg
subscriptions terms =
  Sub.none

-- MAIN

main : Program Never Terms Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
