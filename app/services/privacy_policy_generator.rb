class PrivacyPolicyGenerator
  def self.generate(app_name, platform, permissions, compliance = [])
    base = <<~POLICY
      Privacy Policy for #{app_name}

      This privacy policy explains how #{app_name} ("we", "our", or "us") collects, uses, and protects your information when you use our #{platform} application.

      ## Information We Collect
      We may access:
      #{permissions.map { |perm| "- #{perm.capitalize}" }.join("\n")}

      ## How We Use Your Information
      Your data is used to operate and improve the app. We do not sell or share your data without consent.

      ## Data Security
      We use standard security practices to protect your data.

      ## Changes to This Policy
      This policy may be updated and changes will be reflected here.

      ## Contact
      Reach out via the app for any privacy concerns.

      Last updated: #{Date.today}
      
    POLICY

    additions = []
    if compliance.include?("GDPR")
      additions << <<~GDPR
        ## GDPR Compliance

        We process personal data in accordance with the General Data Protection Regulation (EU GDPR). Users can request data access, correction, or deletion at any time.
      GDPR
    end

    if compliance.include?("CCPA")
      additions << <<~CCPA
        ## CCPA Compliance

        California users have the right to know, delete, or opt-out of the sale of personal information under the California Consumer Privacy Act (CCPA).
      CCPA
    end

    base + additions.join("\n")
  end

end
