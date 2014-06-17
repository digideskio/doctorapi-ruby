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
      collection(data["issues"], Data)
    end

    def patient_answers(body)
      data = post request(endpoint: "patient/answers", body: body)

      Data.new(data)
    end

    def doctors
      data = get request(endpoint: "doctors")
      collection(data["doctors"], Data)
    end

    def create_patient_api_token(body)
      data = post request(endpoint: "patient/api_tokens", body: body)

      Data.new(data)
    end

    def create_patient_account(body)
      data = post request(endpoint: "patient/account", body: body)

      Data.new(data)
    end

    def create_doctor(body)
      data = post request(endpoint: "account", body: body)

      Data.new(data)
    end

    def create_doctor_api_token(body)
      data = post request(endpoint: "api_tokens", body: body)

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

    def create_other_issue(body)
      data = post request(endpoint: "patient/other_issues", body: body)

      Data.new(data)
    end

    def create_case(body)
      data = post request(endpoint: "cases", body: body)

      Data.new(data)
    end

    def assign_doctor(body)
      data = post request(endpoint: "doctor_assignments", body: body)

      Data.new(data)
    end

    def create_question(body)
      raise ArgumentError unless body[:issue_id]

      endpoint  = "issues/#{body[:issue_id]}/questions"
      data      = post request(endpoint: endpoint, body: body)

      Data.new(data)
    end

    def create_diagnosis(body)
      raise ArgumentError unless body[:issue_id]

      endpoint  = "issues/#{body[:issue_id]}/diagnoses"
      data      = post request(endpoint: endpoint, body: body)

      Data.new(data)
    end

    def create_refusal(body)
      raise ArgumentError unless body[:issue_id]

      endpoint  = "issues/#{body[:issue_id]}/refusals"
      data      = post request(endpoint: endpoint, body: body)

      Data.new(data)
    end

    def create_patient_answer(body)
      post request endpoint: "patient/answers", body: body
    end

    def create_fake_issues
      post request endpoint: "fake_issues"
    end
  end
end
