module Api
  module V1
    class PingController < ActionController::Base
      def index
        render json: {"data": "pong"}, status: 200
      end
    end
  end
end
