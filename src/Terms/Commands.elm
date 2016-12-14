module Terms.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
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
      , ( "id", Encode.string term.id)
      , ( "description", Encode.string term.description )
      , ( "dbpedia_description", Encode.string term.dbpedia_description )
      , ( "dbpedia_uri", Encode.string term.dbpedia_uri )
      ]
  
  in
    list
      |> Encode.object

collectionDecoder : Decode.Decoder (List Term)
collectionDecoder =
  Decode.list memberDecoder

memberDecoder : Decode.Decoder Term
memberDecoder =
  Decode.map6 Term
    (field "id" Decode.string)
    (field "title" Decode.string)
    (field "en_title" Decode.string)
    (field "description" Decode.string)
    (field "dbpedia_description" Decode.string)
    (field "dbpedia_uri" Decode.string)
