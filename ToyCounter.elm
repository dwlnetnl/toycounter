module ToyCounter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Int Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }


init : Int
init =
    0


type Msg
    = Increment
    | Decrement
    | Reset


counterAttrs : Int -> List (Attribute msg)
counterAttrs model =
    if model < 0 then
        [ style [ ( "color", "red" ) ] ]
    else
        []


view : Int -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , span (counterAttrs model) [ text (toString model) ]
        , button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            incr model

        Decrement ->
            decr model

        Reset ->
            init


add : number -> number -> number
add a b =
    a + b


incr : number -> number
incr a =
    add 1 a


decr : number -> number
decr a =
    add -1 a
