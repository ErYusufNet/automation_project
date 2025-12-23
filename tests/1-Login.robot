*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/UI/login_page_keywords.robot
Resource    ../resources/base.robot

Suite Setup     Open Browser To Base Url
Suite Teardown  Close All Browser




*** Test Cases ***
Login
    Go To Login Page