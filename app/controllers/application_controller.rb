class ApplicationController < ActionController::Base
  layout 'application'

  include ::UserAuthenticable
end
