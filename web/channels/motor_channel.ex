defmodule R2d2Ui.MotorChannel do
  require Logger 
  use Phoenix.Channel
  alias MotorHat.DcMotor
  alias MotorHat.Board

  def join("motors:drive", _message, socket) do
    {:ok, socket}
  end

  def handle_in("drive_left", _body, socket) do
    Logger.debug fn -> "drive_left" end
    {:ok, m} = Board.get_dc_motor :mhat, :m2
    DcMotor.run m, :forward
    DcMotor.set_speed m, 255
    {:noreply, socket}
  end

  def handle_in("stop_left", _body, socket) do
    Logger.debug fn -> "stop_left" end
    {:ok, m} = Board.get_dc_motor :mhat, :m2
    DcMotor.set_speed m, 0
    {:noreply, socket}
  end 

  def handle_in("drive_right", _body, socket) do
    Logger.debug fn -> "drive_right" end
    {:ok, m} = Board.get_dc_motor :mhat, :m3
    DcMotor.run m, :forward
    DcMotor.set_speed m, 255

    {:noreply, socket}
  end

  def handle_in("stop_right", _body, socket) do
    Logger.debug fn -> "stop_right" end
    {:ok, m} = Board.get_dc_motor :mhat, :m3
    DcMotor.set_speed m, 0
    
    {:noreply, socket}
  end 
end
