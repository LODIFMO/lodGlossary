module Terms.Update exposing (..)

import Terms.Messages exposing(Msg(..))
import Terms.Models exposing(Term)

update : Msg -> List Term -> ( List Term, Cmd Msg )
update msg terms =
  case msg of
    OnFetchAll (Ok newTerms) ->
      ( newTerms, Cmd.none )

    OnFetchAll (Err error) ->
      ( terms, Cmd.none )
