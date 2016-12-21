module Terms.Messages exposing (..)

import Http
import Terms.Models exposing (TermId, Term)

type Msg
  = OnFetchAll (Result Http.Error (List Term))
  | ShowTerm TermId
  | ShowTerms
  | NewTerm
  -- Form messages
  | FormTtitle String
  | FormEngTitlte String
  -- | OnSave (Result Http.Error Term)
