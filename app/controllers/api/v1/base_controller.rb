# frozen_string_literal: true

# rubocop:disable Rails/ApplicationController
module Api
  module V1
    class BaseController < ActionController::Base
      layout false
    end
  end
end
# rubocop:enable Rails/ApplicationController
