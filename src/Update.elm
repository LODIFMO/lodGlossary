module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Terms.Update
import Users.Update
import Routing exposing (parseLocation)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    TermsMsg subMsg ->
      let
        ( updateTerms, cmd ) =
          Terms.Update.update subMsg model.terms
      in
        ( { model | terms = updateTerms }, Cmd.map TermsMsg cmd )
    
    UsersMsg subMsg ->
      let
        ( updateUser, cmd ) =
          Users.Update.update subMsg model.user

      in
        ( { model | user = updateUser }, Cmd.map UsersMsg cmd )
    
    OnLocationChange location ->
      let
        newRoute = 
          parseLocation location
      in
        ( { model | route = newRoute }, Cmd.none )
