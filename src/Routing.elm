module Routing exposing (..)

import Navigation exposing (Location)
import Terms.Models exposing (TermId)
import UrlParser exposing (..)

type Route
  = TermsRoute
  | TermRoute TermId
  | NewTermRoute
  | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ map TermsRoute top
    , map TermRoute (s "terms" </> string)
    , map NewTermRoute (s "new" )
    , map TermsRoute (s "terms")
    ]

parseLocation : Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route ->
      route
    
    Nothing ->
      NotFoundRoute
