*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Search Wiki
    [Arguments]    ${text}
    input text    name:search   ${text}
    press keys    name:search      ENTER

Log in Wikipedia
    [Arguments]    ${login}    ${password}
    click element    id:pt-login-2
    Wait Until Element Is Visible     id:wpName1    5
    input text     id:wpName1    ${login}
    input text    id:wpPassword1    ${password}
    select checkbox    wpRemember
    click button     id:wpLoginAttempt

Open Wikipedia
    open browser    https://en.wikipedia.org