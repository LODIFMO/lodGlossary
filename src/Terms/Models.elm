module Terms.Models exposing (..)

type alias TermId =
  String

type alias Term =
  { id: TermId
  , title: String
  , en_title: String
  , description: String
  , dbpedia_description: String
  , dbpedia_uri: String
  }

type alias TermForm =
  { title: String
  , en_title: String
  }

createTermForm : TermForm
createTermForm =
  { title = ""
  , en_title = ""
  }

new : Term
new =
  { id = "0"
  , title = ""
  , en_title = ""
  , description = ""
  , dbpedia_description = ""
  , dbpedia_uri = ""
  }
