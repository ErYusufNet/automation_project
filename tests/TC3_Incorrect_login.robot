*** Settings ***
Documentation     TC3 - Login negative test suite.
...               Validates that login fails with invalid credentials and shows the correct error message.
Resource          ../resources/base.robot
Resource          ../resources/UI/TC1_sign_up_page_keywords.robot
Resource          ../resources/UI/TC2_login_keywords.robot
Resource          ../resources/UI/TC3_login_incorrect.robot
Resource          ../variables/env_variables.robot

Suite Setup       Open Browser To Base Url
Suite Teardown    Close All Browsers


*** Test Cases ***
TC3 - Login User With Incorrect Email And Password
    [Documentation]    Attempts login with invalid email/password and verifies the error message is displayed.
    [Tags]    negative    login    regression    ui
    Login User With Incorrect Email And Password
