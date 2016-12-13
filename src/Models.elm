module Models exposing (..)

import Terms.Models exposing(Term)
import Users.Models exposing(User, new)
import Routing

type alias Model =
  { terms : List Term
  , user : User
  , route : Routing.Route
  }

initialModel : Routing.Route -> Model
initialModel  route =
  { terms = []
  , route = route
  , user = new
  }
