module Terms.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Terms.Models exposing (TermId, Term)
import Terms.Messages exposing (..)

fetchAll : Cmd Msg
fetchAll =
  Http.get fetchAllUrl collectionDecoder
    |> Http.send OnFetchAll

fetchAllUrl : String
fetchAllUrl =
  "http://0.0.0.0:9000/terms.json"

createUrl : String
createUrl =
  "http://0.0.0.0:9000/terms.json"

updateUrl : TermId -> String
updateUrl termId =
  "http://0.0.0.0:9000/terms/" ++ termId ++ ".json"

createRequest : Term -> Http.Request Term
createRequest term =
  Http.request
  { body = memberEncoded term |> Http.jsonBody
  , expect = Http.expectJson memberDecoder
  , headers = []
  , method = "POST"
  , timeout = Nothing
  , url = createUrl
  , withCredentials = False
  }

memberEncoded : Term -> Encode.Value
memberEncoded term =
  let
    list =
      [ ( "title", Encode.string term.title )
      , ( "en_title", Encode.string term.en_title )
      ]
  
  in
    list
      |> Encode.object

collectionDecoder : Decode.Decoder (List Term)
collectionDecoder =
  Decode.list memberDecoder

memberDecoder : Decode.Decoder Term
memberDecoder =
  Decode.map4 Term
    (field "id" Decode.string)
    (field "title" Decode.string)
    (field "description" Decode.string)
    (field "dbpedia_description" Decode.string)
