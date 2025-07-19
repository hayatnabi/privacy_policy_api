require 'prawn'

class PrivacyPolicyExporter
  def self.to_pdf(text)
    filename = "privacy_policy_#{SecureRandom.hex(4)}.pdf"
    path = Rails.root.join("tmp", filename)
    Prawn::Document.generate(path) do |pdf|
      pdf.text text
    end
    path.to_s
  end

  def self.to_txt(text)
    filename = "privacy_policy_#{SecureRandom.hex(4)}.txt"
    path = Rails.root.join("tmp", filename)
    File.write(path, text)
    path.to_s
  end
end
