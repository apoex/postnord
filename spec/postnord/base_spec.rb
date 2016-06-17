require 'spec_helper'

RSpec.describe Postnord::Base do
  describe '.mandatory_params' do
    it 'raises not implemented error' do
      expect {
        described_class.send(:mandatory_params)
      }.to raise_error(NotImplementedError, 'mandatory_params')
    end
  end

  describe '.endpoint' do
    it 'raises not implemented error' do
      expect {
        described_class.send(:endpoint)
      }.to raise_error(NotImplementedError, 'endpoint')
    end
  end

  describe '.validate_params' do
    before do
      expect(described_class).to receive(:mandatory_params).and_return(['param1', 'param2'])
    end

    context 'with missing param' do
      it 'raises missing mandatory parameters error' do
        expect {
          described_class.send(:validate_params, { param1: 'test' })
        }.to raise_error(Postnord::Base::MissingMandatoryParameters, /param2/)
      end
    end

    context 'without missing param' do
      it 'does not raise any error' do
        expect {
          described_class.send(:validate_params, { param1: 'test', param2: 'test' })
        }.not_to raise_error(Postnord::Base::MissingMandatoryParameters)
      end
    end
  end
end
