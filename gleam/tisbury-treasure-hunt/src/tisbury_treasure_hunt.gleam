import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location.0 == treasure_location.1 && place_location.1 == treasure_location.0
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_place_name, place_location) = place
  treasures
  |> list.filter(fn(treasure) {
    let #(_treasure_name, treasure_location) = treasure
    treasure_location.0 == place_location.1 && treasure_location.1 == place_location.0
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure, place, desired_treasure {
    #("Brass Spyglass", _found_location), #(
      "Abandoned Lighthouse",
      _place_location,
    ), _desired -> True
    #("Amethyst Octopus", _found_location), #(
      "Stormy Breakwater",
      _place_location,
    ), #("Crystal Crab", _desired_location) -> True
    #("Amethyst Octopus", _found_location), #(
      "Stormy Breakwater",
      _place_location,
    ), #("Glass Starfish", _desired_location) -> True
    #("Vintage Pirate Hat", _found_location), #(
      "Harbor Managers Office",
      _place_location,
    ), #("Model Ship in Large Bottle", _desired_location) -> True
    #("Vintage Pirate Hat", _found_location), #(
      "Harbor Managers Office",
      _place_location,
    ), #("Antique Glass Fishnet Float", _desired_location) -> True
    _else, _else, _else -> False
  }
}
