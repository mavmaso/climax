defmodule ClimaxTest do
  use ExUnit.Case

  describe "get_temp/1" do
    Mimic.copy(Req)

    test "returns city's temperature when success" do
      body = %{
        "daily" => %{
          "temperature_2m_max" => [25.5, 21.7, 26.0, 27.0, 23.5, 19.5, 20.8],
          "time" => [
            "2025-04-24",
            "2025-04-25",
            "2025-04-26",
            "2025-04-27",
            "2025-04-28",
            "2025-04-29",
            "2025-04-30"
          ]
        },
        "daily_units" => %{"temperature_2m_max" => "°C", "time" => "iso8601"},
        "elevation" => 737.0,
        "generationtime_ms" => 0.03457069396972656,
        "latitude" => -23.5,
        "longitude" => -46.5,
        "timezone" => "America/Sao_Paulo",
        "timezone_abbreviation" => "GMT-3",
        "utc_offset_seconds" => -10800
      }

      Mimic.expect(Req, :get, fn _ -> {:ok, %Req.Response{body: body, status: 200}} end)

      assert Climax.get_temp("São Paulo") == "São Paulo 23.4°C"
    end

    test "returns error when api call fails" do
      Mimic.expect(Req, :get, fn _ -> {:error, :econnrefused} end)

      assert Climax.get_temp("Curitiba") == "Curitiba's data not found"
    end
  end
end
