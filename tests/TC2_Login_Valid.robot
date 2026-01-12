*** Settings ***
Resource    ../resources/base.robot
Resource    ../resources/UI/TC1_sign_up_page_keywords.robot
Resource    ../resources/UI/TC2_login_keywords.robot
Resource    ../variables/env_variables.robot

Suite Setup     Open Browser To Base Url
Suite Teardown  Close All Browser

*** Test Cases ***
TC2 - Login User with correct email and password
    Login User With Correct Email And Password
