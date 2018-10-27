class StatesController < ApplicationController
  def index
    @states = State.all
    if params["state"]
      @state = State.find(params['state']['fips'].to_i)
      redirect_to state_path(@state)
    end
  end

  def show
    @state = State.find(params[:id].to_i)
  end
end
