*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Wikipedia
Test Teardown      Close Browser


*** Variables ***
${user}    RobotTests
${correct password}    RobotFramework
${wrong password}    12345
${message}    Incorrect username or password entered. Please try again.
*** Keywords ***
Log in Wikipedia
    [Arguments]    ${login}    ${password}
    click element    id:pt-login-2
    Wait Until Element Is Visible     id:wpName1    5
    input text     id:wpName1    ${login}
    input text    id:wpPassword1    ${password}
    select checkbox    wpRemember
    click button     id:wpLoginAttempt

Search Wiki
    [Arguments]    ${text}
    input text    name:search   ${text}
    press keys    name:search      ENTER

Open Wikipedia
    open browser    https://en.wikipedia.org

*** Test Cases ***
#Successful login
#    Log in Wikipedia    ${user}    ${correct password}
#    Page Should Not Contain Element    css:.mw-message-box-error
#    Wait Until Element Is Visible    name:search    5
#    Search Wiki     Poland


Nonsuccessful login
    [Documentation]    Comment
    Log in Wikipedia    ${user}    ${wrong password}
    wait Until Element Is Visible    css:.mw-message-box-error    5
    Capture Page Screenshot
    ${my_error_message}    get text    css:.mw-message-box-error
    log to console    ${my_error_message}
    should be equal    ${message}   ${my_error_message}
