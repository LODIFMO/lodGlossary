module Models exposing (..)

import Terms.Models exposing(Term)
import Routing

type alias Model =
  { terms : List Term
  , route : Routing.Route
  }

initialModel : Routing.Route -> Model
initialModel  route =
  { terms = []
  , route = route
  }
