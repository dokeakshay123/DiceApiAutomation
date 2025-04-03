Feature: Payment Update.

  Background:
    * def URL = baseURL
    * def headers = headers
    * configure headers = headers


    * def req =
    """
    {
    "invoiceId": "VI-dnvtest-000000079",
    "amount": 367.0,
    "utr":"Akkitest123",
    "payment_doc":"",
    "data":{}
}
    """

    #_---------------------Positive Scenerio ----------------------

  Scenario: Successful Payment Update
    Given url URL
    And path '/apis/external/invoice/postInvoicePayment'
    And request req
    When method POST
    And configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'status'] }
    Then status 200
    And print response

    #_---------------------Negative Scenerios ----------------------
  Scenario Outline: Payment Update with Invalid Invoice ID
    Given url URL
    And path '/apis/external/invoice/postInvoicePayment'
    And request req
    And set req.invoiceId = '<invId>'
    When method POST
    Then status 409
    And configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'status'] }
    And print response
    And match $.message == "Unable to add Invoice Payment. Invoice not found"
    And match $.error == "Unable to add Invoice Payment. Invoice not found"
    Examples:
      | invId      |  |
      | Test123    |  |
      | VI-DNVTEST |  |
      |            |  |

  Scenario: Payment Update with Missing Amount
    Given url URL
    And path '/apis/external/invoice/postInvoicePayment'
    * def missingAmountReq = { invoiceId: "VI-dnvtest-000000084", utr: "Test", payment_doc:"", data:{} }
    And request missingAmountReq
    When method POST
    Then status 409
    And configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'status'] }
    And print response
    And match $.message == "Null value provided for key amount."
    And match $.error == "Null value provided for key amount."

  Scenario: Payment Update with Invalid Amount Type (String instead of number)
    Given url URL
    And path '/apis/external/invoice/postInvoicePayment'
    And request req
    And set req.amount = 'Invalid Amount'
    When method POST
    Then status 409
    And configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'status'] }
    And print response
    And match $.message == "Provided value for key amount is not a valid double"
    And match $.error == "Provided value for key amount is not a valid double"

  Scenario: Payment update with empty request body
    * def emptyReq = {}
    Given url URL
    And path '/apis/external/invoice/postInvoicePayment'
    And request emptyReq
    When method POST
    Then status 409
    And configure continueOnStepFailure = { enabled: true, continueAfter: false, keywords: ['match', 'status'] }
    And print response
    And match $.message == "Null value provided for key invoiceId."
    And match $.error == "Null value provided for key invoiceId."





