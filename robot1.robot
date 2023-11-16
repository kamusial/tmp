*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${user}    RobotTests
${correct password}    RobotFramework
${wrong password}    12345
${message}    Incorrect username or password entered. Please try again.
*** Keywords ***

*** Test Cases ***
Successful login
    open browser   https://en.wikipedia.org
    click element    id:pt-login-2
    Wait Until Element Is Visible     id:wpName1    5
    input text     id:wpName1    ${user}
    input text    id:wpPassword1    ${correct password}
    select checkbox    wpRemember
    click button     id:wpLoginAttempt
    Page Should Not Contain Element    css:.mw-message-box-error
    Wait Until Element Is Visible    name:search    5
    input text    name:search   Poland
#    sleep      1
    press keys    name:search      ENTER
#    sleep      1
    close browser

Nonsuccessful login
    open browser   https://en.wikipedia.org
    click element    id:pt-login-2
    wait Until Element Is Visible    id:wpName1    5
    input text     id:wpName1    ${user}
    input text    id:wpPassword1    ${wrong password}
    select checkbox    wpRemember
    click button     id:wpLoginAttempt
    wait Until Element Is Visible    css:.mw-message-box-error    5
    ${my_error_message}    get text    css:.mw-message-box-error
    log to console    ${my_error_message}
    should be equal    ${message}   ${my_error_message}
    close browser