*** Variables ***

${HOSTNAME}             127.0.0.1
${PORT}                 80
${SERVER}               http://${HOSTNAME}:${PORT}
${BROWSER}              firefox


*** Settings ***

Documentation   Ansible Role Jenkins Plone Tests
Library         Selenium2Library  timeout=10  implicit_wait=0
Library         DebugLibrary
Suite Setup     Open Browser  ${SERVER}  ${BROWSER}
Suite Teardown  Close Browser


*** Keywords ***


*** Test Cases ***

Jenkins Setup
  Go To  ${SERVER}
  Wait until page contains  Jenkins
  Page Should Contain  Jenkins

Jenkins Mail Settings
  Go To  ${SERVER}/configure
  Debug
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Page should contain element  xpath=//input[@name='_.smtpServer' and @value='kitconcept.com']
  Page should contain element  xpath=//input[@name='_.defaultSuffix' and @value='@kitconcept.com']

