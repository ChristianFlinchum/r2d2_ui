defmodule R2d2Ui.PageControllerTest do
  use R2d2Ui.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
