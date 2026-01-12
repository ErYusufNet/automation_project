*** Settings ***
*** Settings ***
Documentation     TC4 - Logout positive test suite.
...               Verifies that a logged-in user can log out and is redirected back to login page.
Resource          ../resources/base.robot
Resource          ../resources/UI/TC4_sign_out_keywords.robot
Resource          ../variables/env_variables.robot

Suite Setup       Open Browser To Base Url
Suite Teardown    Close All Browsers


*** Test Cases ***
TC4 - Logout User
    [Documentation]    Logs in with valid user, logs out, verifies redirect to login page and not logged in anymore.
    [Tags]    logout    positive    regression    ui
    Logout the user
