*** Settings ***
Documentation     UI-level keywords for negative Login scenarios.
...               Contains reusable keywords to validate error handling when invalid
...               credentials are used during login.
Resource          ../../variables/locators.robot
Resource          ../../variables/env_variables.robot
Resource          ../base.robot
Library           SeleniumLibrary
Library           Collections
Resource          TC1_sign_up_page_keywords.robot
Resource          TC2_login_keywords.robot



*** Keywords ***

Logout the user
    Verify Home Page Is Visible
    Go To Sign Up Page
    Verify Login To Your Account Is Visible
    Enter credidentals
    Verify Logged In As User
    Logout User
    Verify Login To Your Account Is Visible
    Page Should Not Contain    ${LOGGED_IN_AS}



Enter credidentals
    Input Text    ${LOGIN_EMAIL}    ${USER_EMAIL}
    Input Text    ${LOGIN_PASSWORD}    ${USER_PASSWORD}
    Click Button    ${LOGIN_BUTTON}


