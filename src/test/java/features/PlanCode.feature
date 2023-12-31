Feature: plan code testing

  Scenario: Validate /api/plans/get-all-plan-code
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/token"
    Given request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + response.token
    When method get
    Then status 200
    And print response
    And assert response [0].planExpired == false

