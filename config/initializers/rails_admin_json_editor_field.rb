# frozen_string_literal: true

class RailsAdminJsonEditorField < RailsAdmin::Config::Fields::Types::Json
  register_instance_option :css_class do
    'jsoneditor-target'
  end

  register_instance_option :formatted_value do
    value.present? ? JSON.pretty_generate(value) : nil
  end

  private

  def form_default_value
    (default_value if value.nil?)
  end
end

RailsAdmin::Config::Fields::Types::register(
  :json_editor,
  RailsAdminJsonEditorField
)
