# Decode Generic

Decodes any Json onto a generic model:

```
type Json
    = JString String
    | JBool Bool
    | JInt Int
    | JFloat Float
    | JNull
    | JObj (Dict String Json)
    | JArr (List Json)
```

The usual approach in Elm is to write `Json.Decode` logic that decodes onto a specific user defined type (or type alias).
This is a stronger approach and leads to nicely typed data models and better programs, and this approach should not
generally be abandoned in favor of using this generic decoder.

There are a couple of situations where a generic decoder can be useful:

* If you wanted to validate an arbitrary json against an arbitrary json-schema - which of course has its own fixed schema, that you would decode and write a program around.

* If you wanted to write a UI to help a user understand and work with arbitrary JSON. Say to visualise it or search it.

* Programs that take JSON and try to infer its schema, or automatically map it to a data model.

* If you wanted to write a JSON diff program, that can handle any JSON inputs.
