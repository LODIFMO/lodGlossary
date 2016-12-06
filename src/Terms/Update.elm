module Terms.Update exposing (..)

import Terms.Messages exposing(Msg(..))
import Terms.Models exposing(Term)

update : Msg -> List Term -> ( List Term, Cmd Msg )
update msg terms =
  case msg of
    NoOp ->
      ( terms, Cmd.none )
