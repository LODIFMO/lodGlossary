module Terms.Models exposing (..)

type alias TermId =
  String

type alias Term =
  { id: TermId
  , title: String
  , description: String
  , dbpedia_description: String
  }

new : Term
new =
  { id = "0"
  , title = ""
  , description = ""
  , dbpedia_description = ""
  }
