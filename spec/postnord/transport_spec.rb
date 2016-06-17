require 'spec_helper'

RSpec.describe Postnord::Transport do
  describe '.service' do
    it 'uses correct service' do
      expect(described_class.service).to eq 'transport'
    end
  end
end

RSpec.describe Postnord::GetTransitTimeInformation do
  describe '.endpoint' do
    it 'calls endpoint' do
      expect(described_class.endpoint).to eq 'transittime/getTransitTimeInformation'
    end
  end
end
