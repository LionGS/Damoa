class HistoryController < ApplicationController
  def index
    @historys = History.where(user_id: current_user).order(created_at: :desc).page params[:page]
  end
end
