Feature: Get Account feature
  Scenario: Validate /api/accounts/get-account
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/token"
    Given request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/accounts/get-account"
    Given param primaryPersonId = 200
    * def validToken = "Bearer " + response. token
    Given header Authorization = validToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == 200


