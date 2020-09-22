Feature: Country API test

  Background:
    * url 'https://test.basqar.techno.study'
    * header Content-Type = 'application/json'

  Scenario: Create , edit and delete a Country

        #get the Auth
    Given path '/auth/login'
    And request { "username" : "daulet2030@gmail.com", "password" : "TechnoStudy123@" }
    When method post
    Then status 200
    * def accessToken = response.access_token
    * def tokenType = response.token_type
    Then print 'access Token----->', accessToken
    Then print 'token Type----->', tokenType

        #create a Country with a random name
    Given path '/school-service/api/countries'
    And header Authorization = tokenType + ' ' + accessToken
    * def javaMethod = Java.type('RandomGenerator')
    * def countryName = javaMethod.randomName(8)
    * def countryCode = javaMethod.randomNumber(4)
    And request { "name" : '#(countryName)', "code":'#(countryCode)' }
    When method POST
    Then status 201
    And match response contains {id: '#notnull'}
    * def myId = response.id
    Then print 'id---->', myId
    Then print 'countryName---->', countryName
    Then print 'countryCode---->', countryCode

        #search Api test
    Given path '/school-service/api/countries/search'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "name" : '#(countryName)' }
    When method POST
    Then status 200

        #edit the country
    Given path '/school-service/api/countries'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "id" : '#(myId)', "name" : '#(javaMethod.randomName(5))', "code":'#(countryCode)' }
    When method PUT
    Then status 200

        #delete the Country
  Given path '/school-service/api/countries/', myId
    And header Authorization = tokenType + ' ' + accessToken
    When method Delete
    Then status 200

            #delete the Country negative
  Given path '/school-service/api/countries/', myId
    And header Authorization = tokenType + ' ' + accessToken
    When method Delete
    Then status 404
