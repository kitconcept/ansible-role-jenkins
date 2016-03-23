*** Variables ***

${HOSTNAME}             127.0.0.1
${PORT}                 8080
${SERVER}               http://${HOSTNAME}:${PORT}
${BROWSER}              firefox
${FF_PROFILE_DIR}       ${CURDIR}/etc/ff_profile_dir


*** Settings ***

Documentation   Ansible Role Jenkins Plone
Library         Selenium2Library  timeout=10  implicit_wait=0
Library         DebugLibrary
Suite Setup     Open Browser  ${SERVER}  ${BROWSER}
Suite Teardown  Close Browser


*** Keywords ***


*** Test Cases ***

Test Jenkins Is Up and Running
  Go To  ${SERVER}
  Wait until page contains  Jenkins
  Page Should Contain  Jenkins

Test Jenkins Home Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.url']
  Page should contain  /var/lib/jenkins

Test Jenkins Plugins are installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  # Page should contain  Green Balls
  # Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Green+Balls']
  Page should contain  Xvfb plugin
  Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Xvfb+Plugin']
#  Page should contain  Robot Framework plugin
#  Page should contain  Workflow Plugin
#  Page should contain  Simple Theme Plugin

Test Jenkins URL Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.url']
  Textfield value should be  xpath=//input[@name='_.url']  jenkins.kitconcept.com

Test Jenkins Admin E-mail Address Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.adminAddress']
  Textfield value should be  xpath=//input[@name='_.adminAddress']  info@kitconcept.com

Test Jenkins Mail SMTP Server Settings
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpServer']  smtp.kitconcept.com

Test Jenkins Mail Default Suffix Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.defaultSuffix']  @kitconcept.com

Test Jenkins SMTP Auth Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Checkbox Should Be Selected  xpath=//input[@name='useSMTPAuth']

Test Jenkins SMTP Auth Username Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpAuthUserName']  stollenwerk@kitconcept.com

Test Jenkins SMTP Port Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpPort']  555

Test Jenkins SMTP Reply-To Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.replyToAddress']  no-reply@kitconcept.com

Test Jenkins SMTP SSL Enabled Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Checkbox Should Be Selected  xpath=//input[@name='_.useSsl']

Test Jenkins Number of executors to 1
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.numExecutors']
  Page should contain element  xpath=//input[@name='_.numExecutors' and @value='1']
