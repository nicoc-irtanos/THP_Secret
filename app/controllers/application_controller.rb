class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :danger #adding flashes besides those already included in rails
end
