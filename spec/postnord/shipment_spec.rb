require 'spec_helper'

RSpec.describe Postnord::Shipment do
  describe '.service' do
    it 'uses correct service' do
      expect(described_class.service).to eq 'shipment'
    end
  end
end

RSpec.describe Postnord::FindByIdentifier do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'trackandtrace/findByIdentifier'
    end
  end
end

RSpec.describe Postnord::FindByNotificationCode do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'trackandtrace/findByNotificationCode'
    end
  end
end

RSpec.describe Postnord::FindByReference do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'trackandtrace/findByReference'
    end
  end
end
