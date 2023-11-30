*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${email}    3mail@wwp.pl
${password}    password1
${message}    Dziękujemy za założenie nowego konta.
*** Keywords ***
Open My Browser
    Open Browser    https://gotujmy.pl/forum/    Chrome
    Maximize Browser Window
    sleep    1
#    Scroll Element Into View    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    click button   //*[@id="qc-cmp2-ui"]/div[2]/div/button[2]

    sleep    1
*** Test Cases ***
test
    Open My Browser
    Click Element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    sleep    1
    input text    //*[@id="f_cmu_email"]    ${email}
    input text    //*[@id="f_cmu_email2"]    ${email}
    input text    //*[@id="f_cmu_password"]     ${password}
    input text    //*[@id="f_cmu_password2"]    ${password}
    sleep    1
    Checkbox Should Not Be Selected  //*[@id="newsletter_agree"]
    select checkbox  //*[@id="newsletter_agree"]
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[2]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[2]/input
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[3]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[3]/input
    sleep    1
    Click Button    //*[@id="user_register_form"]/fieldset/footer/button
    sleep    3
    ${my_message}  Get Text  //*[@id="main_content"]/div/div/h1
    Should Be Equal As Strings  ${my_message}  ${message}
    capture page screenshot