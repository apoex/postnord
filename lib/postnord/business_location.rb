module Postnord

  # Classes

  class BusinessLocation < Base
    def self.service
      'businesslocation'
    end

    def self.endpoint
      "servicepoint/#{action}"
    end
  end

  class FindNearestByCoordinates < BusinessLocation
    def mandatory_params
      [
        'countryCode',
        'northing',
        'easting',
      ]
    end
  end

  class FindByPostalCode < BusinessLocation
    def mandatory_params
      [
        'countryCode',
        'postalCode',
      ]
    end
  end

  class FindNearestByAddress < BusinessLocation
    def mandatory_params
      [
        'countryCode',
      ]
    end
  end

  class GetServicePointInformation < BusinessLocation
    def mandatory_params
      []
    end
  end
end
