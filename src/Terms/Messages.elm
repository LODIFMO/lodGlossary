module Terms.Messages exposing (..)

import Http
import Terms.Models exposing (TermId, Term)

type Msg
  = OnFetchAll (Result Http.Error (List Term))
  | ShowTerm TermId
  | ShowTerms
  | NewTerm
  | OnSave (Result Http.Error Term)
