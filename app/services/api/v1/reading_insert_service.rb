# frozen_string_literal: true

module Api
  module V1
    class ReadingInsertService
      def initialize(params)
        @data = params[:reading][:data].to_h
        @device = ::Device.find_by!(write_key: params[:write_key])
      end

      def insert
        datetime = @data[:timestamp].present? ? Time.at(@data[:timestamp]) : Time.now
        ::Reading.create(device: @device, datetime: datetime, data: @data )
      end
    end
  end
end
