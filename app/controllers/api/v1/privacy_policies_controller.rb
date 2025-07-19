class Api::V1::PrivacyPoliciesController < ApplicationController
  def create
    app_name = params[:app_name]
    platform = params[:platform]
    permissions = params[:permissions] || []
    format_type = params[:format] || "json" # json, pdf, txt
    compliance = params[:compliance] || []  # e.g., ["GDPR", "CCPA"]

    if app_name.blank? || platform.blank?
      return render json: { error: "app_name and platform are required" }, status: :bad_request
    end

    policy_text = PrivacyPolicyGenerator.generate(app_name, platform, permissions, compliance)

    case format_type.downcase
    when "pdf"
      filepath = PrivacyPolicyExporter.to_pdf(policy_text)
      send_file filepath, filename: File.basename(filepath), type: "application/pdf"
    when "txt"
      filepath = PrivacyPolicyExporter.to_txt(policy_text)
      send_file filepath, filename: File.basename(filepath), type: "text/plain"
    else
      render json: {
        app_name:, platform:, permissions:, compliance:,
        privacy_policy: policy_text
      }
    end
  end
end
