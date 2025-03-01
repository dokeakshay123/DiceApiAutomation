Feature: Get Invoices

  Background:

    * def URL = baseURL
    * def headers = headers
    * configure headers = headers

  # -------------- Positive Test case ---------------------
  Scenario: Verify get Invoices API return All invoices
    Given url URL
    And path '/apis/external/invoice/getInvoices'
    And param start_date = '01-01-2025'
    And param end_date = '21-01-2025'
    And param offset = 0
    And param pageSize = '1000'
    When method get
    Then status 200
    And print response
    And print responseTime
    And match $.invoices[0].invoiceId == "VI-dnvtest-000000079"
    And match $.invoices[0].billNo == "Test12345"
    And match $.invoices[0].billTo.name == "Denave"
    And match $.invoices[0].billTo.gstin == "09AABCD0052F1Z6"
    And match $.invoices[0].billTo.registeredName == "Denave India Private Limited"
    # matches for vendor details
    And match $.invoices[0].vendor.id == 577345
    And match $.invoices[0].vendor.title == "Inventicon Business Intelligence Pvt. Ltd."
    And match $.invoices[0].vendor.tradeName == "Inventicon Business Intelligence Pvt. Ltd."
    And match $.invoices[0].vendor.currency == "INR"
    And match $.invoices[0].vendor.email == "dnvndtest@yopmail.com"
    And match $.invoices[0].vendor.mobile == "7208849985"

    # --------------Negative Test case ------------------------------
  Scenario Outline: Verify if user passing wrong date range then API return invoices
    Given url URL
    And path '/apis/external/invoice/getInvoices'
    And param start_date = '<startDate>'
    And param end_date = '<EndDate>'
    And param offset = 0
    And param pageSize = '1000'
    When method get
    Then status 409
    And print response
    And print responseTime
    And match $.message == "Unable to fetch invoices. Selected date range should be within 30 days."
    And match $.error ==  "Unable to fetch invoices. Selected date range should be within 30 days."
    Examples:
      | startDate  | EndDate    |
      | 01-01-2025 | 21-05-2025 |
      | 01-01-2025 | 21-03-2025 |












