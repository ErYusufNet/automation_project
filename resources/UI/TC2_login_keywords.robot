*** Settings ***
Documentation     UI-level keywords for Login flow.
...               Creates a temporary user (unique email), logs out, logs in with same creds_toggle.
Resource          ../../variables/locators.robot
Resource          ../../variables/env_variables.robot
Resource          ../base.robot
Library           SeleniumLibrary
Library           Collections
Resource          TC1_sign_up_page_keywords.robot

*** Keywords ***
Verify Home Page Is Visible
    [Documentation]    Verifies Home page is visible.
    Wait Until Element Is Visible    ${HOME}
    Element Should Contain           ${HOME}    Home

Verify Login To Your Account Is Visible
    [Documentation]    Verifies 'Login to your account' section is visible.
    Wait Until Element Is Visible    ${LOGIN_TO_YOUR_ACCOUNT_MSG}    10s
    Element Should Contain           ${LOGIN_TO_YOUR_ACCOUNT_MSG}    Login to your account

Fill Email And Password
    [Documentation]    Fills login email/password and clicks Login.
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL}       ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button  ${LOGIN_BUTTON}

Create Temp User And Save Credentials
    [Documentation]    Creates a new user with unique email and stores credentials for this test run.
    ...                Uses signup keywords (TC1). Leaves the user logged in.
    [Arguments]    ${user_name}    ${user_password}    &{address}
    # TC1 already generates unique email internally and stores ${GENERATED_EMAIL}
    Register New User    ${user_name}    ${user_password}    &{address}
    # Save to test variables so we can reuse in login step
    Set Test Variable    ${TEMP_EMAIL}       ${GENERATED_EMAIL}
    Set Test Variable    ${TEMP_PASSWORD}    ${user_password}

Logout User
    [Documentation]    Logs out current user.
    Click Element    ${LOGOUT_LCT}

Login User With Correct Email And Password
    [Documentation]    Full TC2 flow:
    ...                1) Create temp user (unique email) 2) Logout 3) Login with same user 4) Delete account.
    [Arguments]    ${user_name}    ${user_password}    &{address}
    Verify Home Page Is Visible

    # 1) Create a temporary user (so we never touch your manual account)
    Create Temp User And Save Credentials    ${user_name}    ${user_password}    &{address}

    # 2) Logout (so we can test the login screen properly)
    Logout User

    # 3) Go to Login page and login with the generated credentials
    Go To Sign Up Page
    Verify Login To Your Account Is Visible
    Fill Email And Password    ${TEMP_EMAIL}    ${TEMP_PASSWORD}

    # 4) Verify + cleanup
    Verify Logged In As User
    Delete Account
