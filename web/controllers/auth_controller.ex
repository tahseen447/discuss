defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth


  def callback(conn, params) do
    IO.inspect(conn.assigns)
    IO.inspect(params)
  end
end
