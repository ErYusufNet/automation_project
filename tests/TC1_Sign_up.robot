*** Settings ***
Documentation     TC1 - Signup / Register flow tests.
...               Validates that a new user can register successfully with unique email.
Resource          ../resources/base.robot
Resource          ../resources/UI/TC1_sign_up_page_keywords.robot
Resource          ../variables/env_variables.robot

Suite Setup       Open Browser To Base Url
Suite Teardown    Close All Browsers


*** Test Cases ***
Register User
    [Documentation]    Registers a new user with generated unique email and verifies account created + logged in.
    [Tags]    smoke    signup    ui    regression
    &{address}=    Create Address Data
    ...    ${NAME}    ${LASTNAME}    ${COMPANY}    ${ADRESS}    ${ADRESS2}
    ...    Canada    ${STATE}    ${CITY}    ${ZIPCODE}    ${PHONE}
    Register New User    ${USER_NAME}    ${USER_PASSWORD}    &{address}
