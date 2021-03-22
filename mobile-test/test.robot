*** Settings ***
Library    AppiumLibrary
Resource	objectmaps.robot

*** Variables ***
${APPIUM_SERVER}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android Emulator
${APP}    ${CURDIR}\\Sample Android App Login Test_v4.0_apkpure.com.apk
${APP_PACKAGE}    com.loginmodule.learning
${APP_ACTIVITY}    com.loginmodule.learning.activities.LoginActivity

*** Test cases ***
Mobile Test
    Launch Mobile Application
    Register User
    Go Back
    Login User
    Verify Account Information
    Close Application

*** Keywords ***
Launch Mobile Application
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}

Register User
    Click Element    ${Form.Login.CreateOne.Link}
    Sleep    2s
    Wait Until Element Is Visible    ${Form.Register.Name.Txt}    
    Input Text    ${Form.Register.Name.Txt}    Cloud Strife
    Input Text    ${Form.Register.EmailAddress.Txt}    cloud@gmail.com
    Input Text    ${Form.Register.Password.Txt}    password@1234XX
    Input Text    ${Form.Register.PasswordConfirmation.Txt}    password@1234XX
    Click Element    ${Form.Register.Register.Btn}    
        
Login User
    Input Text    ${Form.Login.EmailAddress.Txt}    cloud@gmail.com   
    Input Text    ${Form.Login.Password.Txt}    password@1234XX
    Click Element    ${Form.Login.Login.Btn}
    
Verify Account Information
	Element Should Contain Text    ${Form.Account.Name.Txt}    Cloud Strife
	Element Should Contain Text    ${Form.Account.EmailAddress.Txt}    cloud@gmail.com
	Element Should Contain Text    ${Form.Account.Password.Txt}    password@1234XX            
