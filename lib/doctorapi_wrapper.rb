require "doctorapi_wrapper/version"
require "doctorapi_wrapper/data"
require "doctorapi_wrapper/collection_methods"
require "doctorapi_wrapper/http_client"

module DoctorapiWrapper
  class Client
    include HttpClient
    include CollectionMethods

    def patient_issues
      data = get request(endpoint: "patient/issues")
      collection(data, Data)
    end

    def patient_answers(body)
      data = post request(endpoint: "patient/answers", body: body)

      Data.new(data)
    end

    def doctors
      data = get request(endpoint: "doctors")
      collection(data, Data)
    end

    def create_patient_api_token(body)
      data = post request(endpoint: "patient/api_tokens", body: body)

      Data.new(data)
    end

    def create_patient_account(body)
      data = post request(endpoint: "patient/account", body: body)

      Data.new(data)
    end

    def create_mole_issue(body)
      data = post request(endpoint: "patient/mole_issues", body: body)

      Data.new(data)
    end

    def create_rash_issue(body)
      data = post request(endpoint: "patient/rash_issues", body: body)

      Data.new(data)
    end
  end
end
