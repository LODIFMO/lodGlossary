module Messages exposing (..)

import Navigation exposing (Location)
import Terms.Messages
import Users.Messages

type Msg
  = TermsMsg Terms.Messages.Msg
  | OnLocationChange Location
  | UsersMsg Users.Messages.Msg
