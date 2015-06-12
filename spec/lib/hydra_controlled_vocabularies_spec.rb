require 'rails_helper'

RSpec.describe HydraControlledVocabularies do
  subject { described_class }
  describe "#config" do
    it "should be able to set a marmotta connection" do
      subject.config do |c|
        c.marmotta_connection = "Yo"
      end
      expect(subject.marmotta_connection).to eq "Yo"
    end
  end
end
