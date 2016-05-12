module Postnord

  # Classes

  class BusinessLocation
    def self.service
      'businesslocation'
    end

    def self.endpoint
      "servicepoint/#{action}"
    end
  end

  class FindNearestByCoordinates
    def mandatory_params
      [
        'countryCode',
        'northing',
        'easting',
      ]
    end
  end

  class FindByPostalCode
    def mandatory_params
      [
        'countryCode',
        'postalCode',
      ]
    end
  end

  class FindNearestByAddress
    def mandatory_params
      [
        'countryCode',
      ]
    end
  end

  class GetServicePointInformation
    def mandatory_params
      []
    end
  end
end
