defmodule TestServer do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/simple" do
    put_resp(conn, "simple.html")
  end

  def put_resp(conn, fixture) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, Fixtures.html(fixture))
  end
end
