import Html exposing (Html, Attribute, div, input, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String,
    content2 : String
  }

model : Model
model =
  { content = "",
    content2 = ""}


-- UPDATE

type Msg
  = Change String | Incremental 

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent}
    Incremental ->
      { model | content2 = model.content}
      

      

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Texto", onInput Change] []
    , button  [onClick Incremental] [ text "mostrar" ] 
    , div [] [ viewMessage (model.content2) ]
    ]
    
viewMessage : String -> Html msg
viewMessage msg =
  div [] [ text msg ]