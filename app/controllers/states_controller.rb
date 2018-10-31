class StatesController < ApplicationController
  def index
    @states = State.all.sort
    if params["state"].present? && params["state"]["fips"].present?
      @state = State.find(params['state']['fips'].to_i)
      redirect_to state_path(@state)
    end
  end

  def show
    @state = State.find(params[:id].to_i)
    @counties = @state.counties.sort
  end
end
