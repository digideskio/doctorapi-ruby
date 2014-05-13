require "doctorapi_wrapper/version"
require "doctorapi_wrapper/data"
require "doctorapi_wrapper/collection_methods"
require "doctorapi_wrapper/http_client"

module DoctorapiWrapper
  class Client
    include HttpClient
    include CollectionMethods

    def patient_issues
      data = get request(url: "patient/issues")
      collection(data, Data)
    end

    def patient_answers(body)
      data = post request(url: "patient/answers", body: body)

      Data.new(data)
    end
  end
end
