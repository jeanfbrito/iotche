# frozen_string_literal: true

module Api
  module V1
    class ReadingsController < BaseController
      skip_before_action :verify_authenticity_token, :only => [:insert]

      def insert
        return if device.blank?
        Api::V1::ReadingInsertService.new(params.permit!).insert
        render json: {}, status: :ok
      end

      private

      def device
        @device ||= ::Device.find_by!(write_key: params[:write_key])
      end
    end
  end
end
