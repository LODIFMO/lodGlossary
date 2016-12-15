module Users.Messages exposing (..)

import Http
import Users.Models exposing (User)

type Msg
  = FormEmail String
  | FormPassword String
  | FormSubmit
  | OnLogin (Result Http.Error User)
