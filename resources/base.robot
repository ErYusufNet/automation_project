*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/env_variables.robot


*** Keywords ***
Open Browser To Base Url
    Open Browser    ${BASE_URL}      ${BROWSER}
    Maximize Browser Window

Close All Browser
    Close All Browsers




