module Postnord

  # Classes

  class Transport < Base
    def self.service
      'transport'
    end

    def self.endpoint
      "transittime/#{action}"
    end
  end

  class AddressToAddress < Transport
    def self.mandatory_params
      [
        "startTime",
        "serviceGroup",
        "originPostCode",
        "originCountryCode",
        "destinationPostCode",
        "destinationCountryCode",
      ]
    end

    def self.action
      self.name.split('::').last.downcase
    end

    def self.options
      { return_type: nil }
    end
  end

  class GetTransitTimeInformation < Transport
    def self.mandatory_params
      [
        'serviceGroupCode',
        'fromAddressPostalCode',
        'fromAddressCountryCode',
        'toAddressPostalCode',
        'toAddressCountryCode',
      ]
    end
  end
end
