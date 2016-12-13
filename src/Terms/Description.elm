module Terms.Description exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Terms.Messages exposing (..)
import Terms.Models exposing (..)


view : Term -> Html Msg
view term =
  div []
    [ div [ class "page-header" ]
      [ button [ class "btn btn-default"
               , onClick ShowTerms]
        [ i [ class "fa fa-fw fa-chevron-left" ] []
        , text "Back"
        ]
      ]
    , div [ class "panel panel-default" ]
      [ div [ class "panel-heading" ]
      [ h3 [] [ text ("Add description for '" ++ term.title ++ "'") ]
      ]
      , div [ class "panel-body" ]
        [ Html.form []
          [ div [ class "form-group" ]
            [ div [ class "well well-lg" ] [ text "Select one of next or write new" ]
            , ul []
              [ li []
                [ label []
                  [ input [ attribute "type" "radio" ] []
                  , text " dbpedia 1"
                  ]
                , div [ attribute "style" "text-align: justify;"
                      , class "well well-lg" ]
                  [ textarea [ class "form-control"
                             , disabled True
                             , rows 10 ]
                    [ text "Damn that dog toy mouse squeak roll over or where is my slave? I'm getting hungry white cat sleeps on a black shirt. I cry and cry and cry unless you pet me, and then maybe i cry just for fun. Who's the baby pelt around the house and up and down stairs chasing phantoms so swat at dog, yet fall asleep on the washing machine yet sit in window and stare ooo, a bird! yum chase the pig around the house. Meow to be let out. Meow to be let out meow all night having their mate disturbing sleeping humans hunt anything that moves attack feet, or give attitude, so fall over dead (not really but gets sypathy) kitty scratches couch bad kitty. Destroy couch as revenge my left donut is missing, as is my right yet chase mice. " ]
                  ]
                ]
              , li []
                [ label []
                  [ input [ attribute "type" "radio" ] []
                  , text " dbpedia 2"
                  ]
                , div [ attribute "style" "text-align: justify;"
                      , class "well well-lg" ]
                  [ textarea [ class "form-control"
                             , disabled True
                             , rows 10 ]
                    [ text "Lay on arms while you're using the keyboard eat prawns daintily with a claw then lick paws clean wash down prawns with a lap of carnation milk then retire to the warmest spot on the couch to claw at the fabric before taking a catnap hide head under blanket so no one can see for eat grass, throw it back up and favor packaging over toy. Lick butt stretch sleep on dog bed, force dog to sleep on floor paw at beetle and eat it before it gets away. See owner, run in terror play time, for curl into a furry donut and kitty power! lick the plastic bag lick plastic bags pee in human's bed until he cleans the litter box. Soft kitty warm kitty little ball of furr chase dog then run away sleep on keyboard scratch at the door then walk away but intently stare at the same spot toy mouse squeak roll over but rub whiskers on bare skin act innocent. Intently stare at the same spot milk the cow purr while eating with tail in the air. " ]
                  ]
                ]
              , li []
                [ label []
                  [ input [ attribute "type" "radio" ] []
                  , text " dbpedia 3"
                  ]
                , div [ attribute "style" "text-align: justify;"
                      , class "well well-lg" ]
                  [ textarea [ class "form-control"
                             , disabled True
                             , rows 10 ]
                    [ text "Make meme, make cute face cats go for world domination. Climb a tree, wait for a fireman jump to fireman then scratch his face if it smells like fish eat as much as you wish and eat from dog's food kick up litter paw at your fat belly, yet why must they do that. Need to chase tail purrr purr littel cat, little cat purr purr spread kitty litter all over house or poop on grasses attack feet. Sit on the laptop if it smells like fish eat as much as you wish run in circles, yet i am the best. Eat a plant, kill a hand rub whiskers on bare skin act innocent cats go for world domination peer out window, chatter at birds, lure them to mouth the dog smells bad yet has closed eyes but still sees you. Purr for no reason my slave human didn't give me any food so i pooped on the floor. Sun bathe eats owners hair then claws head toy mouse squeak roll over pee in the shoe. Rub whiskers on bare skin act innocent i like big cats and i can not lie stares at human while pushing stuff off a table yet plays league of legends or intrigued by the shower instantly break out into full speed gallop across the house for no reason. Lick the other cats. Hate dog." ]
                  ]
                ]
              , li []
                [ label []
                  [ input [ attribute "type" "radio" ] []
                  , text " your variant"
                  ]
                , div [ class "well well-lg" ]
                  [ textarea [ class "form-control"
                             , rows 10 ]
                    []
                  ]
                ]
              ]
            ]
          , div [ class "form-group" ]
            [ div [ class "col-sm-offset-2 col-sm-10" ]
              [ button [ class "btn btn-primary" ]
                [ i [ class "fa fa-fw fa-floppy-o" ] []
                , text "Save"
                ]
              ]
            ]
          ]
        ]
      ]
    ]
