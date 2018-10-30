class CountiesController < ApplicationController
  def index
    if params['county']
      @county = County.find(params['county']['fips'].to_i)
      @state = State.find(params['state_id'].to_i)
      redirect_to state_county_path(@county, state_id: @state.fips)
    end
  end

  def show
    @county = County.find(params['id'].to_i)
    @state = State.find(params['state_id'].to_i)
  end
end
