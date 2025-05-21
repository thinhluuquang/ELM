*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem

*** Variables ***
${USERNAME_INPUT}    //*[@name='username']
${PASSWORD_INPUT}    //*[@name='password']
${LOGIN_BUTTON}    //span[contains(text(),'Đăng nhập')]
${ERROR_MESSAGE}    //*[contains(text(),'Tài khoản không tồn tại')]

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Element    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
