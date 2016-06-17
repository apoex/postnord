require 'spec_helper'

describe Postnord do
  it 'has a version number' do
    expect(Postnord::VERSION).not_to be nil
  end

  describe '.find_by_identifier' do
    let(:id) { '123' }

    before do
      expect(Postnord::FindByIdentifier).to receive(:call).with({
        id: id,
      })
    end

    it 'calls FindByIdentifier with correct params' do
      described_class.find_by_identifier(id)
    end
  end

  describe '.find_by_notification_code' do
    let(:phone_number) { '0701112233' }
    let(:notification_code) { '123' }

    before do
      expect(Postnord::FindByNotificationCode).to receive(:call).with({
        notificationPhoneNumber: phone_number,
        notificationCode: notification_code,
      })
    end

    it 'calls FindByNotificationCode with correct params' do
      described_class.find_by_notification_code(phone_number, notification_code)
    end
  end

  describe '.find_by_reference' do
    let(:customer_number) { '123' }
    let(:reference_value) { '456' }

    before do
      expect(Postnord::FindByReference).to receive(:call).with({
        customerNumber: customer_number,
        referenceValue: reference_value,
      })
    end

    it 'calls FindByReference with correct params' do
      described_class.find_by_reference(customer_number, reference_value)
    end
  end
end
