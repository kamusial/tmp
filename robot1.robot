*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user}    RobotTests
${correct password}    RobotFramework
${wrong password}    12345
${message}    Incorrect username or password entered. Please try again.
*** Keywords ***

*** Test Cases ***
Test1
    open browser   https://en.wikipedia.org
    click element    id:pt-login-2
    sleep    3
    input text     id:wpName1    ${user}
    input text    id:wpPassword1    ${correct password}
    sleep    3
    select checkbox    wpRemember
    click button     id:wpLoginAttempt
    sleep      3
    input text    name:search   Poland
    sleep      1
    press keys    name:search      ENTER
    sleep      3
    close browser

Test2
    open browser   https://en.wikipedia.org
    click element    id:pt-login-2
    sleep    3
    input text     id:wpName1    ${user}
    input text    id:wpPassword1    ${wrong password}
    sleep    3
    select checkbox    wpRemember
    click button     id:wpLoginAttempt
    sleep      3
    ${my_error_message}    get text    css:.mw-message-box-error
    log to console    ${my_error_message}
    should be equal    ${message}   ${my_error_message}
    close browser