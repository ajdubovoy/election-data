class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_action :authenticate_everything, :if => lambda { !%w{ development test production loadtest }.include?(Rails.env) }

  def authenticate_everything
    authenticate_or_request_with_http_basic("TrustTheVote") do |user, password|
      username == 'trustthevote' && password == 'mid18term'
    end
  end
end
