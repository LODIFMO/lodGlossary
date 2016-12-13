module Users.Update exposing (..)

import Users.Messages exposing (Msg(..))
import Users.Models exposing (User)

update : Msg -> User -> ( User, Cmd Msg )
update msg user =
  case msg of
    NoOp ->
      ( user, Cmd.none )
