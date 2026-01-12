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
Login User With Incorrect Email And Password
    [Documentation]    Attempts to log in with invalid credentials and verifies that
    ...                the appropriate error message is displayed.
    ...                This keyword represents the full negative login flow.
    [Arguments]    ${email}=incorrect@gmail.com    ${password}=incorrect
    Verify Home Page Is Visible
    Go To Sign Up Page
    Verify Login To Your Account Is Visible
    Enter Incorrect Credentials    ${email}    ${password}
    Verify Incorrect Credentials Error

Enter Incorrect Credentials
    [Documentation]    Enters an invalid email address and password into the login form
    ...                and submits the login request.
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL}       ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button  ${LOGIN_BUTTON}

Verify Incorrect Credentials Error
    [Documentation]    Verifies that the login error message
    ...                'Your email or password is incorrect!' is visible to the user.
    Wait Until Element Is Visible    ${INCORRECT_MSG}    10s
    Element Text Should Be           ${INCORRECT_MSG}    Your email or password is incorrect!
