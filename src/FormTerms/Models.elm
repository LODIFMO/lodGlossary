module FormTerms.Models exposing (..)

type alias TermForm =
  { title: String
  , en_title: String
  }

createTermForm : TermForm
createTermForm =
  { title = ""
  , en_title = ""
  }
