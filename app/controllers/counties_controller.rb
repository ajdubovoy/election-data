class CountiesController < ApplicationController
  def index
    if params['county']
      @state = State.find(params['state_id'].to_i)
      redirect_to state_path(@state) if params['county']['fips'].empty?
      @county = County.find(params['county']['fips'].to_i) unless params['county']['fips'].empty?
      redirect_to state_county_path(@county, state_id: @state.fips) unless params['county']['fips'].empty?

    end
  end

  def show
    @county = County.find(params['id'].to_i)
    @state = State.find(params['state_id'].to_i)
    @machines = @county.machines
  end
end
