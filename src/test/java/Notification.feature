Feature: Notification API test

  Background:
    * url 'https://test.basqar.techno.study'
    * header Content-Type = 'application/json'

  Scenario: Create , edit and delete a Notification

  #    get the Auth
    Given path '/auth/login'
    And request { "username" : "daulet2030@gmail.com", "password" : "TechnoStudy123@" }
    When method post
    Then status 200
    * def accessToken = response.access_token
    * def tokenType = response.token_type
    Then print 'access Token----->', accessToken
    Then print 'token Type----->', tokenType

  #create a notification
    Given path '/school-service/api/notifications'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "name" : "MySchool", "type" :"STUDENT_PAYMENT_TIME", "description" : "elementary", "schoolId" : "5c5aa8551ad17423a4f6ef1d"  }
    When method POST
    Then status 201
    And match response contains {id: '#notnull'}
    * def myId = response.id
    Then print 'id---->', myId

  #create a notification negative
    Given path '/school-service/api/notifications'
    And header Authorization = tokenType + ' ' + accessToken
    And request { "name" : "MySchool", "type" :"STUDENT_PAYMENT_TIME", "description" : "elementary", "schoolId" : "5c5aa8551ad17423a4f6ef1d"  }
    When method POST
    Then status 400

#  #edit a notification
#    Given path '/school-service/api/notifications'
#    And header Authorization = tokenType + ' ' + accessToken
#    And request { "id" : "{{myId}}", "name" : "YourSchool", "type" :"STUDENT_PAYMENT_TIME", "description" : "elementary", "schoolId" : "5c5aa8551ad17423a4f6ef1d" }
#    When method PUT
#    Then status 200

  #delete a notification
    Given path 'school-service/api/notifications/', myId
    When method delete
    Then status 200

    #delete a notification negative
    Given path 'school-service/api/notifications/', myId
    When method delete
    Then status 404