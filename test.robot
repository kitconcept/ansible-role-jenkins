*** Variables ***

${HOSTNAME}             127.0.0.1
${PORT}                 8080
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

Jenkins Plugins installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains  Installed
#  Page should contain  Green Balls
#  Page should contain  Robot Framework plugin
#  Page should contain  Workflow Plugin
#  Page should contain  Simple Theme Plugin

Test Jenkins URL
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.url']
  Page should contain element  xpath=//input[@name='_.url' and @value='jenkins.kitconcept.com']

Test Jenkins Admin E-mail Address
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.adminAddress']
  Page should contain element  xpath=//input[@name='_.adminAddress' and @value='info@kitconcept.com']

Test Jenkins Mail Setup
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
#  Page should contain element  xpath=//input[@name='_.smtpServer' and @value='kitconcept.com']
#  Page should contain element  xpath=//input[@name='_.defaultSuffix' and @value='@kitconcept.com']

Test Jenkins Number of executors to 1
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.numExecutors']
  Page should contain element  xpath=//input[@name='_.numExecutors' and @value='1']
