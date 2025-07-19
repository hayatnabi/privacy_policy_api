class Api::V1::PrivacyPoliciesController < ApplicationController
  def create
    app_name = params[:app_name]
    platform = params[:platform]
    permissions = params[:permissions] || []

    if app_name.blank? || platform.blank?
      return render json: { error: "app_name and platform are required" }, status: :bad_request
    end

    policy = PrivacyPolicyGenerator.generate(app_name, platform, permissions)

    render json: { app_name:, platform:, permissions:, privacy_policy: policy }
  end
end
