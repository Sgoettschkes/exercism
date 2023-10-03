import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let res =
    game
    |> rule1()
    |> result.map(fn(x) { rule2(x) })
    |> result.try(fn(x) { rule3(x) })
    |> result.try(fn(x) { rule4(x) })

  case res {
    Ok(g) ->
      case g.player {
        Black -> Game(..g, player: White)
        White -> Game(..g, player: Black)
      }
    Error(err) -> Game(..game, error: err)
  }
}
