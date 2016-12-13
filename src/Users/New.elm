module Users.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Users.Messages exposing (..)
import Terms.Messages exposing (..)
import Html.Events exposing (onClick)

view : Html Msg
view =
  div []
    [ div [ class "page-header" ]
      [ button [ class "btn btn-default"
               , onClick ShowTerms ]
        [ i [ class "fa fa-fw fa-chevron-left" ] []
        , text "Back"
        ]
      ]
    , div [ class "panel panel-default" ]
      [ div [ class "panel-heading" ]
        [ h3 [] [ text "Sign in" ]
        ]
      , div [ class "panel-body" ]
        [ Html.form [ class "padding-input" ]
          [ div [ class "form-group" ]
            [ label [ class "control-label" ] [ text "Email" ]
            , input [ class "form-control"
                    , attribute "type" "string"
                    , placeholder "Email" ] []
            ]
          , div [ class "form-group" ]
            [ label [ class "control-label" ] [ text "Password" ]
            , input [ class "form-control"
                    , attribute "type" "password"
                    , placeholder "Password" ] []
            ]
          , div [ class "form-group" ]
            [ div [ class "col-sm-offset-2 col-sm-10" ]
              [ button [ class "btn btn-primary" ]
                [ i [ class "fa fa-fw fa-sign-in" ] []
                , text "Sing in"
                ]
              , a [ class "btn btn-default"
                  , onClick ShowTerms ]
                [ i [ class "fa fa-fw fa-ban" ] []
                , text "Cancel"
                ]
              ]
            ]
          ]
        ]
      ]
    ]
