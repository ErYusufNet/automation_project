*** Settings ***
Resource    ../../variables/locators.robot
Resource    ../base.robot
Library     SeleniumLibrary
Suite Setup     Open Browser To Base Url
Suite Teardown  Close All Browser




*** Keywords ***
Go To Login Page
    Click Element    ${LOGIN}

