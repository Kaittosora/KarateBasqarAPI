Feature: Discount API test

  Background:
    * url 'https://test.basqar.techno.study'
    * header Content-Type = 'application/json'

  Scenario: Create , edit and delete a Discount

  #    get the Auth
    Given path '/auth/login'
    And request { "username" : "daulet2030@gmail.com", "password" : "TechnoStudy123@" }
    When method post
    Then status 200
    * def accessToken = response.access_token
    * def tokenType = response.token_type
    Then print 'access Token----->', accessToken
    Then print 'token Type----->', tokenType

        #create a discount
    Given path '/school-service/api/discounts'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "active" : true , "code" : "Full", "description" : "MyDiscount", "priority" : "1" }
    When method POST
    Then status 201
    And match response contains {id: '#notnull'}
    * def myId = response.id
    Then print 'id---->', myId

         #create a discount negative
    Given path '/school-service/api/discounts'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "active" : true , "code" : "Full", "description" : "MyDiscount", "priority" : "1" }
    When method POST
    Then status 400

        #edit a discount
    Given path '/school-service/api/discounts'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "id" : '#(myId)', "active" : true , "code" : "Partial", "description" : "YourDiscount", "priority" : "1" }
    When method PUT
    Then status 200

        #delete a discount
    Given path '/school-service/api/discounts/', myId
    When method delete
    Then status 200

        #delete a discount negative
    Given path '/school-service/api/discounts/', myId
    When method delete
    Then status 404