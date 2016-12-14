module Users.Messages exposing (..)

import Http
import Users.Models exposing (User)

type Msg
  = FormEmail String
  | FormPassword String
  | OnSave (Result Http.Error User)
