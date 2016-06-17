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

  class GetTransitTimeInformation < Transport
    def mandatory_params
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
