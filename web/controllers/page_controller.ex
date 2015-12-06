defmodule R2d2Ui.PageController do
  use R2d2Ui.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
