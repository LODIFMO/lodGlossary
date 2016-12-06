module Models exposing (..)

import Terms.Models exposing(Term)

type alias Model =
  { terms : List Term
  }

initialModel : Model
initialModel =
  { terms = [ Term "1" "1" "1" "1" ]
  }
