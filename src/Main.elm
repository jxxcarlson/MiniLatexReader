module Main exposing (main)

import Browser
import Debounce exposing (Debounce)
import Html exposing (..)
import Html.Attributes as HA exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Keyed as Keyed
import Json.Encode
import MiniLatex.Differ exposing (EditRecord)
import MiniLatex.MiniLatex as MiniLatex
import Random
import Task


main : Program Flags (Model (Html Msg)) Msg
main =
    Browser.element
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        }


type alias Model a =
    { renderedText : a }


type Msg
    = NoOp


type alias Flags =
    { sourceText : String }


init : Flags -> ( Model (Html msg), Cmd Msg )
init flags =
    ( { renderedText = render flags.sourceText }, Cmd.none )


subscriptions : Model (Html msg) -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model (Html msg) -> ( Model (Html msg), Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


render : String -> Html msg
render sourceText =
    MiniLatex.render "$$ $$" sourceText


view : Model (Html Msg) -> Html Msg
view model =
    div outerStyle
        [ display model
        ]


display : Model (Html Msg) -> Html Msg
display model =
    div []
        [ renderedSource model ]


renderedSource : Model (Html msg) -> Html msg
renderedSource model =
    Html.div renderedSourceStyle
        [ model.renderedText ]



-- STYLE FUNCTIONS


outerStyle =
    [ style "margin-top" "20px"
    , style "background-color" "#e1e6e8"
    , style "padding" "20px"
    , style "width" "1430px"
    , style "height" "710px"
    ]


renderedSourceStyle =
    textStyle "400px" "450px" "#fff"


textStyle width height color =
    [ style "width" width
    , style "height" height
    , style "padding" "15px"
    , style "margin-left" "20px"
    , style "background-color" color
    , style "overflow" "scroll"
    , style "float" "left"
    ]


labelStyle =
    [ style "margin-top" "5px"
    , style "margin-bottom" "0px"
    , style "margin-left" "20px"
    , style "font-weight" "bold"
    ]



-- TEXT
