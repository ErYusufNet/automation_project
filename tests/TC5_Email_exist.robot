*** Settings ***
Documentation     TC4 - Logout positive test suite.
...               Verifies that a logged-in user can log out and is redirected back to login page.
Resource          ../resources/base.robot
Resource          ../resources/UI/TC5_Existing_email_keywords.robot
Resource          ../variables/env_variables.robot

Suite Setup       Open Browser To Base Url
Suite Teardown    Close All Browsers


*** Test Cases ***
TC5 - Register User With Existing Email
    [Documentation]    Verifies that signup fails when using an already registered email.
    [Tags]    negative    signup    regression    ui
    Register User With Existing Email    Yusuf

