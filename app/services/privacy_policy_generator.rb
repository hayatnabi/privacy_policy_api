class PrivacyPolicyGenerator
  def self.generate(app_name, platform, permissions)
    <<~POLICY
      Privacy Policy for #{app_name}

      This privacy policy explains how #{app_name} ("we", "our", or "us") collects, uses, and protects your information when you use our #{platform} application.

      ## Information We Collect

      Depending on your usage, we may request access to the following:
      #{permissions.map { |perm| "- #{perm.capitalize}" }.join("\n")}

      ## How We Use Your Information

      The collected information is used solely to provide and improve the user experience of the app. We do not sell, rent, or share your personal data with third parties without your consent.

      ## Data Security

      We implement reasonable security measures to protect your data but cannot guarantee absolute security.

      ## Changes to This Policy

      This privacy policy may be updated from time to time. We will notify you of any changes within the app.

      ## Contact Us

      If you have any questions or concerns about this privacy policy, please contact us through the app.

      Last updated: #{Date.today}
    POLICY
  end
end
