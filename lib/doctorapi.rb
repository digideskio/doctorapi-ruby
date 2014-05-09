require "doctorapi/version"
require "doctorapi/data"
require "doctorapi/collection_methods"
require "doctorapi/http_client"

module Doctorapi
  class Client
    include HttpClient
    include CollectionMethods

    def issues
      data = get request("patient/rash_issues")
      collection(data, Data)
    end
  end
end
