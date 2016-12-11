module Main exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Terms.Edit
import Terms.List
import Terms.Model exposing (TermId)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model =
  div []
    [ page model ]

page : Model -> Html Msg
page model =
  case model.route of
    TermsRoute ->
      Html.map TermsMsg (Terms.List.view model.terms)
    
    TermRoute id ->
      termEditPage model id

    NotFoundRoute ->
      notFoundView

termEditPage : Model -> TermId -> Html Msg
termEditPage model termId =
  let
    maybeTerm =
      model.terms
        |> List.filter (\term -> term.id == termId)
        |> List.head
  in
    case maybeTerm of
      Just term ->
        Html.map TermsMsg (Terms.Edit.view term)
      
      Nothing ->
        notFoundView

notFoundView : Html Msg
notFoundView =
  div []
    [ text "Not found" ]
