module Terms.Update exposing (..)

import Terms.Messages exposing(Msg(..))
import Terms.Models exposing(Term)
import Navigation

update : Msg -> List Term -> ( List Term, Cmd Msg )
update msg terms =
  case msg of
    OnFetchAll (Ok newTerms) ->
      ( newTerms, Cmd.none )

    OnFetchAll (Err error) ->
      ( terms, Cmd.none )
    
    ShowTerm id ->
      ( terms, Navigation.newUrl ("#terms/" ++ id) )
    
    ShowTerms ->
      ( terms, Navigation.newUrl "#terms" )
    
    NewTerm ->
      ( terms, Navigation.newUrl "#new" )
