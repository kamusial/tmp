*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${email}    1mail@wwp.pl
${password}    password1

*** Keywords ***
Open My Browser
    Open Browser    https://gotujmy.pl/forum/    Chrome
    Maximize Browser Window
    sleep    3
#    Scroll Element Into View    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    click button   //*[@id="qc-cmp2-ui"]/div[2]/div/button[2]

    sleep    3
*** Test Cases ***
test
    Open My Browser
    Click Element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    sleep    1
