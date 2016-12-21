module Users.Update exposing (..)

import Users.Messages exposing (Msg(..))
import Users.Models exposing (User)
import Users.Commands exposing (login)
import Debug exposing (..)

update : Msg -> User -> ( User, Cmd Msg )
update msg user =
  case msg of
    FormEmail email ->
      ( { user | email = email }, Cmd.none)
    
    FormPassword password ->
      ( { user | password = password }, Cmd.none )
    
    FormSubmit ->
      log "123"
      ( user, (login user))
    
    OnLogin (Ok loginUser) ->
      ( loginUser, Cmd.none )
    
    OnLogin (Err error) ->
      ( user, Cmd.none )
