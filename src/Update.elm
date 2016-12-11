module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Terms.Update
import Routing exposing (parseLocation)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    TermsMsg subMsg ->
      let
        ( updateTerms, cmd ) =
          Terms.Update.update subMsg model.terms
      in
        ( { model | terms =updateTerms }, Cmd.map TermsMsg cmd )
    
    OnLocationChange location ->
      let
        newRoute = 
          parseLocation location
      in
        ( { model | route = newRoute }, Cmd.none )
