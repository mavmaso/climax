defmodule Climax do
  @moduledoc """
  Documentation for `Climax`.
  """

  def get_temp(city) do
    case city |> get_url() |> Req.get() do
      {:ok, resp} -> "#{city} #{calc_final_temp(resp.body["daily"]["temperature_2m_max"])}°C"
      {:error, _reason} -> "#{city}'s data not found"
    end
  end

  defp get_url(city) do
    case city do
      "São Paulo" ->
        "https://api.open-meteo.com/v1/forecast?latitude=-23.55&longitude=-46.63&daily=temperature_2m_max&timezone=America/Sao_Paulo"

      "Belo Horizonte" ->
        "https://api.open-meteo.com/v1/forecast?latitude=-19.92&longitude=-43.94&daily=temperature_2m_max&timezone=America/Sao_Paulo"

      "Curitiba" ->
        "https://api.open-meteo.com/v1/forecast?latitude=-25.43&longitude=-49.27&daily=temperature_2m_max&timezone=America/Sao_Paulo"
    end
  end

  defp calc_final_temp(temp_list) do
    temp_list
    |> Enum.sum()
    |> then(&(&1 / length(temp_list)))
    |> Float.round(1)
  end
end
