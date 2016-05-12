module Postnord

  # Helper methods

  def self.find_by_identifier(id)
    FindByIdentifier.call(
      id: id,
    )
  end

  def self.find_by_notification_code(phone_number, notification_code)
    FindByNotificationCode.call(
      notificationPhoneNumber: phone_number,
      notificationCode: notification_code,
    )
  end

  def self.find_by_reference(customer_number, reference_value)
    FindByReference.call(
      customerNumber: customer_number,
      referenceValue: reference_value,
    )
  end

  # Classes

  class Shipment < Base
    def self.service
      'shipment'
    end

    def self.endpoint
      "trackandtrace/#{action}"
    end
  end

  class FindByIdentifier < Shipment
    def self.mandatory_params
      ['id']
    end
  end

  class FindByNotificationCode < Shipment
    def self.mandatory_params
      [
        'notificationPhoneNumber',
        'notificationCode',
      ]
    end
  end

  class FindByReference < Shipment
    def self.mandatory_params
      [
        'customerNumber',
        'referenceValue',
      ]
    end
  end
end
