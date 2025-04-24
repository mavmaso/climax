# Climax
  Climax is an Elixir application designed to demonstrate how to structure Elixir code, handle concurrency and parallelism, follow software development best practices, and leverage the functional features of the language.

### Proposal Problem

  Using the public Open-Meteo API (https://open-meteo.com/), create an Elixir application that fetches the weather forecast for 3 cities, calculates the average maximum temperature for the next 6 days, and displays the result clearly.

## Setup

- Install dependencies with `mix deps.get`
- To run the application `mix start`
- Run complete tests `mix test`

## Why ?

 - Why use Mimic instead of Req's built-in mock?
Because it's simpler to set up in this case — and also because I personally prefer it. However, the best practice would be to use Req.Test.stub/2.

 - Why not use Task.async/1 with Task.await_many/1?
Because, as Valim himself mentioned in this X/tweet(https://x.com/josevalim/status/1915358407801938256), it's almost an anti-pattern. I preferred to go with something more basic from OTP.
Actually, I almost went with a GenServer per city that would update daily, but that would’ve gone way beyond the scope of the proposal.

## Made by

 - [mavmaso](https://github.com/mavmaso)

