defmodule R2d2Ui.MotorChannel do
  require Logger 
  use Phoenix.Channel
  alias MotorHat.DcMotor
  alias MotorHat.Board

  def join("motors:drive", _message, socket) do
    {:ok, socket}
  end

  # motors are physically turned around, so backwards is forward and so on
  def handle_in("drive_forward", _body, socket) do
    Logger.debug fn -> "drive_forward" end
    {:ok, ml} = Board.get_dc_motor :mhat, :m2
    DcMotor.run ml, :backward
    DcMotor.set_speed ml, 255

    {:ok, mr} = Board.get_dc_motor :mhat, :m3
    DcMotor.run mr, :backward
    DcMotor.set_speed mr, 255

    {:noreply, socket}
  end

  def handle_in("drive_backward", _body, socket) do
    Logger.debug fn -> "drive_backward" end
    {:ok, ml} = Board.get_dc_motor :mhat, :m2
    DcMotor.run ml, :forward
    DcMotor.set_speed ml, 255

    {:ok, mr} = Board.get_dc_motor :mhat, :m3
    DcMotor.run mr, :forward
    DcMotor.set_speed mr, 255

    {:noreply, socket}
  end
  
  def handle_in("stop_forward", _body, socket) do
    Board.release_all_motors :mhat
    {:noreply, socket}
  end

  def handle_in("stop_backward", _body, socket) do
    Board.release_all_motors :mhat
    {:noreply, socket}
  end

  def handle_in("drive_left", _body, socket) do
    Logger.debug fn -> "drive_left" end
    {:ok, m} = Board.get_dc_motor :mhat, :m2
    DcMotor.run m, :backward
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
    DcMotor.run m, :backward
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
