*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/LoginPage.robot
Resource          ../variables/config.robot

*** Test Cases ***
Valid Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    10
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Sleep    2s
    Page Should Not Contain    ${ERROR_MESSAGE}
    [Teardown]    Close Browser

Invalid Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login With Credentials    ${VALID_USER}    ${VALID_PASSWORD}
    Sleep    2s
    Page Should Contain Element    ${ERROR_MESSAGE}
    [Teardown]    Close Browser

Invalid Empty Username
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Username    ${EMPTY}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Sleep    1s
    Page Should Contain Element    ${ERROR_MESSAGE}
    [Teardown]    Close Browser

Invalid Empty Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Username    ${VALID_USER}
    Input Password    ${EMPTY}
    Click Login Button
    Sleep    1s
    Page Should Contain Element    ${ERROR_MESSAGE}
    [Teardown]    Close Browser

Invalid Empty Username And Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Username    ${EMPTY}
    Input Password    ${EMPTY}
    Click Login Button
    Sleep    1s
    Page Should Contain Element    ${ERROR_MESSAGE}
    [Teardown]    Close Browser

Invalid Format Email
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Username    invalidemail
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Sleep    1s
    Page Should Contain Element    ${ERROR_MESSAGE}
    [Teardown]    Close Browser
