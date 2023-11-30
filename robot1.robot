*** Settings ***
Library    SeleniumLibrary
Resource    resources.robot
Test Setup    Open Wikipedia
Test Teardown      Close Browser


*** Variables ***
${user}    RobotTests
${correct password}    RobotFramework
${wrong password}    12345
${message}    Incorrect username or password entered. Please try again.
${screenshot_path}  C:/Users/vdi-student/Desktop
*** Keywords ***


*** Test Cases ***
Successful login
    Log in Wikipedia    ${user}    ${correct password}
    Page Should Not Contain Element    css:.mw-message-box-error
    Wait Until Element Is Visible    name:search    5
    Search Wiki     Poland


Nonsuccessful login
    [Documentation]    Comment
    Log in Wikipedia    ${user}    ${wrong password}
    wait Until Element Is Visible    css:.mw-message-box-error    60
    Capture Page Screenshot    ${screenshot_path}/screen{index}.png
    ${my_error_message}    get text    css:.mw-message-box-error
    log to console    ${my_error_message}
    should be equal    ${message}   ${my_error_message}
