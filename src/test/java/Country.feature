Feature: Country API test

  Background:
    * url 'https://test.basqar.techno.study'
    * header Content-Type = 'application/json'

  Scenario: Create , edit and delete a Country

  #    get the Auth
    Given path '/auth/login'
    And request { "username" : "daulet2030@gmail.com", "password" : "TechnoStudy123@" }
    When method post
    Then status 200
    * def accessToken = response.access_token
    * def tokenType = response.token_type
    Then print 'access Token----->', accessToken
    Then print 'token Type----->', tokenType

        #create a Country
    Given path '/school-service/api/countries'
    And header Authorization = tokenType + ' ' + accessToken
    * def javaMethod = Java.type('RandomNameGenerator')
    * def countryName = javaMethod.randomName(8)
    And request { "name" : '#(countryName)' }
    When method POST
    Then status 201
    And match response contains {id: '#notnull'}
    * def myId = response.id
    Then print 'id---->', myId