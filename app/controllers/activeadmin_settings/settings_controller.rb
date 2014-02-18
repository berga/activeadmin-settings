class ActiveadminSettings::SettingsController < ApplicationController
  before_filter :authenticate_admin_user!

  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(params[:setting])
      render :text => @object.value
    else
      render :text => "error"
    end
  end

  # Define the permitted params in case the app is using Strong Parameters
  def permitted_params
    params.permit setting: [:name, :string, :file, :remove_file]
  end unless Rails::VERSION::MAJOR == 3 && !defined? StrongParameters
end