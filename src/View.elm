module View exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Terms.Edit
import Terms.List
import Terms.New
import Terms.Description
import Terms.Models exposing (TermId)
import Routing exposing (Route(..))
import Debug exposing (log)

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

    NewTermRoute ->
      termNewPage

    DescriptionTermRoute id ->
      termDescriptionPage model id

    NotFoundRoute ->
      notFoundView

termNewPage : Html Msg
termNewPage =
  Html.map TermsMsg (Terms.New.view)

termDescriptionPage : Model -> TermId -> Html Msg
termDescriptionPage model termId =
  let
    maybeTerm =
      model.terms
        |> List.filter (\term -> term.id == termId)
        |> List.head
  in
    case maybeTerm of
      Just term ->
        Html.map TermsMsg (Terms.Description.view term)

      Nothing ->
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
