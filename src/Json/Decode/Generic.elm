module Json.Decode.Generic exposing (Json(..), json)

{-| Decodes JSON into a data model that is generic enough to describe any JSON.


# For working with any JSON.

@docs Json, json

-}

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)


{-| A data structure describing the contents of any JSON.
-}
type Json
    = JString String
    | JBool Bool
    | JInt Int
    | JFloat Float
    | JNull
    | JObj (Dict String Json)
    | JArr (List Json)


string : Decoder Json
string =
    Decode.map JString Decode.string


bool : Decoder Json
bool =
    Decode.map JBool Decode.bool


int : Decoder Json
int =
    Decode.map JInt Decode.int


float : Decoder Json
float =
    Decode.map JFloat Decode.float


null : Decoder Json
null =
    Decode.null JNull


array : Decoder Json
array =
    Decode.list json
        |> Decode.map JArr


dict : Decoder Json
dict =
    Decode.dict json
        |> Decode.map JObj


{-| A JSON decoder that works with any JSON, decoding into the generic data model.
-}
json : Decoder Json
json =
    Decode.oneOf
        [ bool
        , int
        , float
        , null
        , string
        , Decode.lazy (\_ -> array)
        , Decode.lazy (\_ -> dict)
        ]
