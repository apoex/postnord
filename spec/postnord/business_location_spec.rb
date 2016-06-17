require 'spec_helper'

RSpec.describe Postnord::BusinessLocation do
  describe '.service' do
    it 'uses correct service' do
      expect(described_class.service).to eq 'businesslocation'
    end
  end
end

RSpec.describe Postnord::FindNearestByCoordinates do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'servicepoint/findNearestByCoordinates'
    end
  end
end

RSpec.describe Postnord::FindByPostalCode do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'servicepoint/findByPostalCode'
    end
  end
end

RSpec.describe Postnord::FindNearestByAddress do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'servicepoint/findNearestByAddress'
    end
  end
end

RSpec.describe Postnord::GetServicePointInformation do
  describe '.endpoint' do
    it 'calls correct endpoint' do
      expect(described_class.endpoint).to eq 'servicepoint/getServicePointInformation'
    end
  end
end
