module Users.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Users.Models exposing (User)
import Users.Messages exposing (..)
import Debug exposing (..)

signinUrl : String
signinUrl =
  "http://0.0.0.0:9000/api/sign_in"

memberEncoded : User -> Encode.Value
memberEncoded user =
  let
    list =
      [ ( "email", Encode.string user.email )
      , ( "password", Encode.string user.password )
      ]

  in
    list
      |> Encode.object

signInRequest : User -> Http.Request User
signInRequest user =
  Http.request
    { body = memberEncoded user |> Http.jsonBody
    , expect = Http.expectJson memberDecoder
    , headers = []
    , method = "POST"
    , timeout = Nothing
    , url = signinUrl
    , withCredentials = False
    }

login : User -> Cmd Msg
login user =
  log "123"
  signInRequest user
    |> Http.send OnLogin

memberDecoder : Decode.Decoder User
memberDecoder =
  Decode.map2 User
    (field "email" Decode.string)
    (field "password" Decode.string)
