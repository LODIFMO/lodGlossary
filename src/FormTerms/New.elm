module FormTerms.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import FormTerms.Messages exposing (..)
import Html.Events exposing (onClick, onInput)

view : Html Msg
view =
  div []
    [ div [ class "page-header" ]
      [ button [ class "btn btn-default"
               , onClick ShowTerms
            ]
        [ i [ class "fa fa-fw fa-chevron-left" ] []
        , text "Back"
      ]
    ]
    , div [ class "panel panel-default" ]
      [ div [ class "panel-heading" ]
        [ h3 [] [ text "Add new term" ]
        ]
      , div [ class "panel-body" ]
        [ Html.form [ class "form-horizontal padding-input" ]
          [ div [ class "form-group" ]
            [ label [ class "col-sm-2 control-label"
                    , attribute "for" "inputTitle"]
              [ text "Title" ]
            , div [ class "col-sm-10" ]
              [ input [ class "form-control"
                      , id "inputTitle"
                      , attribute "placeholder" "Title"
                      , onInput FormTitle
                      ] []
              ]
            ]
          , div [ class "form-group" ]
            [ label [ class "col-sm-2 control-label"
                    , attribute "for" "inputEngTitle" ]
              [ text "Eng title" ]
            , div [ class "col-sm-10" ]
              [ input [ class "form-control"
                      , id "inputEngTitle"
                      , attribute "placeholder" "Title in ENG"
                      , onInput FormEngTitle
                      ] []
              ]
            ]
          , div [ class "form-group" ]
            [ div [ class "col-sm-offset-2 col-sm-10" ]
              [ button [ class "btn btn-primary"
                       , type_ "button" ]
                [ i [ class "fa fa-fw fa-floppy-o" ] []
                , text "Save"
                ]
              , a [ class "btn btn-default"
                      , onClick ShowTerms
                      ]
                [ i [ class "fa fa-fw fa-ban" ] []
                , text "Cancel"
                ]
              ]
            ]
          ]
        ]
      ]
    ]