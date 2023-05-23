defmodule AnimalSocialWeb.PageController do
  use AnimalSocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
