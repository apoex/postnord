require 'spec_helper'

RSpec.describe Postnord::Config do

  context 'without global config variables' do

    context 'api_key' do
      it { expect(described_class.api_key).to eq('') }
    end

    context 'api_version' do
      it { expect(described_class.api_version).to eq('v1') }
    end

    context 'api_endpoint' do
      it { expect(described_class.api_endpoint).to eq('https://api2.postnord.com/rest') }
    end

    context 'locale' do
      it { expect(described_class.locale).to eq('en') }
    end

    context 'return_type' do
      it { expect(described_class.return_type).to eq('json') }
    end
  end

  context 'with global config variables' do
    before :all do
      POSTNORD_API_KEY = '12345'
      POSTNORD_API_VERSION = 'v2'
      POSTNORD_API_ENDPOINT = 'http://newurl.com/'
      POSTNORD_LOCALE = 'sv'
      POSTNORD_RETURN_TYPE = 'xml'
    end

    context 'api_key' do
      it { expect(described_class.api_key).to eq(POSTNORD_API_KEY) }
    end

    context 'api_version' do
      it { expect(described_class.api_version).to eq(POSTNORD_API_VERSION) }
    end

    context 'api_endpoint' do
      it { expect(described_class.api_endpoint).to eq(POSTNORD_API_ENDPOINT) }
    end

    context 'locale' do
      it { expect(described_class.locale).to eq(POSTNORD_LOCALE) }
    end

    context 'return_type' do
      it { expect(described_class.return_type).to eq(POSTNORD_RETURN_TYPE) }
    end
  end
end
