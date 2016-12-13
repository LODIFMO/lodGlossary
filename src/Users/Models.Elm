module Users.Models exposing (..)

type alias User =
  { email: String
  , password: String
  }

new : User
new =
  { email = ""
  , password = ""
  }
