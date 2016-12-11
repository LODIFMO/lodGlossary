module Messages exposing (..)

import Navigation exposing (Location)
import Terms.Messages

type Msg
  = TermsMsg Terms.Messages.Msg
  | OnLocationChange Location
