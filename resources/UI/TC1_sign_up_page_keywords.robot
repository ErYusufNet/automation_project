*** Settings ***
Documentation     UI-level keywords for Signup flow (AutomationExercise).
...               Contains page actions + validations used by higher-level auth/business keywords.
Resource          ../../variables/locators.robot
Resource          ../../variables/env_variables.robot
Resource          ../base.robot
Library           SeleniumLibrary
Library           Collections
Library           ../../libs/email_generator.py


*** Keywords ***
Go To Sign Up Page
    [Documentation]    Navigates to Signup/Login page from navbar.
    Click Element    ${LOGIN}
Verify New User Sign Up Visible
    Element Should Be Visible   ${VERIFY_NEWUSERSIGNUP_MSG}
    Element Should Contain    ${VERIFY_NEWUSERSIGNUP_MSG}    New User Signup!

Generate Signup Email
    [Documentation]    Generates a unique email address for signup and stores it as ${GENERATED_EMAIL}.
    ${email}=    Generate Unique Email
    Set Test Variable    ${GENERATED_EMAIL}    ${email}
    RETURN    ${email}

Fill Signup Account Section
    [Documentation]    Fills the initial signup form (name/email) and Account Information section.
    ...                Expects signup page to be open.
    [Arguments]    ${name}    ${password}    ${email}
    Input Text    ${SIGNUP_NAME}      ${name}
    Input Text    ${SIGNUP_EMAIL}     ${email}
    Click Button  ${SIGNUP_BUTTON}

    # Account Information section (after opening)
    Select Radio Button    title    Mr
    Input Text    ${SIGNUP_PASSWORD}    ${password}
    Select From List By Index    ${DAY}      2
    Select From List By Label    ${MONTH}    January
    Select From List By Label    ${YEAR}     1996
    Select Checkbox    ${CHECKBOX1}
    Select Checkbox    ${CHECKBOX2}

Create Address Data
    [Documentation]    Creates a dictionary object for address data to be used in address form.
    [Arguments]    ${first_name}    ${last_name}    ${company}    ${address1}    ${address2}
    ...            ${country}    ${state}    ${city}    ${zipcode}    ${phone}
    &{address}=    Create Dictionary
    ...    first=${first_name}
    ...    last=${last_name}
    ...    company=${company}
    ...    address1=${address1}
    ...    address2=${address2}
    ...    country=${country}
    ...    state=${state}
    ...    city=${city}
    ...    zipcode=${zipcode}
    ...    phone=${phone}
    RETURN    &{address}

Fill Signup Address Section
    [Documentation]    Fills Address Information section using given address dictionary.
    [Arguments]    &{address}
    Input Text    ${FIRST_NAME_LCT}    ${address.first}
    Input Text    ${LAST_NAME_LCT}     ${address.last}
    Input Text    ${COMPANY_LCT}       ${address.company}
    Input Text    ${ADRESS1_LCT}       ${address.address1}
    Input Text    ${ADRESS2_LCT}       ${address.address2}
    Select From List By Label    ${COUNTRY}    ${address.country}
    Input Text    ${STATE_LCT}         ${address.state}
    Input Text    ${CITY_LCT}          ${address.city}
    Input Text    ${ZIPCODE_LCT}       ${address.zipcode}
    Input Text    ${PHONE_LCT}         ${address.phone}

Submit Create Account
    [Documentation]    Submits account creation request.
    Click Button    ${CREATE_ACCOUNT}

Click Continue
    [Documentation]    Clicks Continue button after account creation/deletion pages.
    Click Element    ${CONTINUE_LCT}

Verify Account Created
    [Documentation]    Verifies that ACCOUNT CREATED! message is visible.
    Wait Until Element Is Visible    ${ACCOUNT_CREATED_MSG}    15s
    Element Should Contain           ${ACCOUNT_CREATED_MSG}    ACCOUNT CREATED!

Verify Logged In As User
    [Documentation]    Verifies that user is logged in ("Logged in as ...") is visible.
    Wait Until Element Is Visible    ${LOGGED_IN_AS}    10s
    Element Should Contain           ${LOGGED_IN_AS}    Logged in as

Delete Account
    [Documentation]    Deletes currently logged in account and verifies deletion message.
    Click Element    ${DELETE_LCT}
    Wait Until Element Is Visible    ${ACCOUNT_DELETED}    15s
    Element Should Contain           ${ACCOUNT_DELETED}    ACCOUNT DELETED!
    Click Element    ${CONTINUE_LCT}

Register New User
    [Documentation]    End-to-end UI registration flow: open signup, generate unique email,
    ...                fill account + address sections, create account, verify, continue, verify logged in.
    [Arguments]    ${user_name}    ${user_password}    &{address}
    Go To Sign Up Page
    ${email}=    Generate Signup Email
    Fill Signup Account Section    ${user_name}    ${user_password}    ${email}
    Fill Signup Address Section    &{address}
    Submit Create Account
    Verify Account Created
    Click Continue
    Verify Logged In As User
