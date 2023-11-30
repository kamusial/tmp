*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${email}    1mail@wwp.pl
${password}    password1

*** Keywords ***



*** Test Cases ***
test
    Open Browser    https://gotujmy.pl/forum/    Chrome
    Maximize Browser Window
    sleep    3
#    Scroll Element Into View    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    Run Keyword And Ignore Error    click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
