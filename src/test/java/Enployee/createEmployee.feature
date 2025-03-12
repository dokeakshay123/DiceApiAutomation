Feature: Create New Employee

  Background:

    * def URL = baseURL
    * def headers = headers
    * configure headers = headers

    * def req =

    """
    {
    "data": {
        "email": "testUser123@gamil.com",
        "mobile": "1231231230",
        "code": "000069",
        "name": {
            "fullName": "test User 123",
            "firstName": "test",
            "lastName": "user 123"
        },
        "department": "Basic",
        "office": "Delhi",
        "dob": 0,
        "grade": "",
        "gender": "",
        "manager": "",
        "alternate": "",
        "hrHead": "",
        "additionalFirst": "",
        "additionalSecond": "",
        "active": true
    }
}

    """

    Scenario: Verify Create employee API working as expected
      Given url URL
      And path "/apis/external/employee/create"
      And request req
      And print req
      When method POST
      Then status 409
