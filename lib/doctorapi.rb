require "doctorapi/version"
require "doctorapi/data"
require "doctorapi/collection_methods"
require "doctorapi/http_client"

module Doctorapi
  class Client
    include HttpClient
    include CollectionMethods

    def patient_issues
      data = get request("patient/issues")
      collection(data, Data)
    end
  end
end
