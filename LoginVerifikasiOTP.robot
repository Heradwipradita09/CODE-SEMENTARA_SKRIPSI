# *** Settings ***
# Library    SeleniumLibrary
# Library    Dialogs

# *** Variables ***
# ${URL}               https://app.sinariumkm.id/  
# ${BROWSER}           Chrome                   
# ${PHONE_NUMBER}      6282122442631
# ${OTP}               

# *** Test Cases ***
# Login dan Verifikasi OTP
#     Open Browser    ${URL}    ${BROWSER}
#     Wait Until Element Is Visible    xpath=//input[@placeholder='628xxx']    timeout=30s
#     Input Text    xpath=//input[@placeholder='628xxx']    ${PHONE_NUMBER}
#     Click Button    xpath=//button[text()='Log in SINARI']
    
#     Wait Until Element Is Visible    xpath=//*[@id="appCapsule"]/div/div[2]/form/ul/li/div/div/div/div[1]    timeout=30s
#     Sleep    25s  
#     Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
#     Sleep    5s   



*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${URL}               https://app.sinariumkm.id/  
${BROWSER}           Chrome                   
${PHONE_NUMBER}      628999506210
${OTP}               

*** Test Cases ***
Login dan Verifikasi OTP
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    xpath=//input[@placeholder='628xxx']    timeout=120s
    Input Text    xpath=//input[@placeholder='628xxx']    ${PHONE_NUMBER}
    Click Button    xpath=//button[text()='Log in SINARI']
    
    Wait Until Element Is Visible    xpath=//*[@id="appCapsule"]/div/div[2]/form/ul/li/div/div/div/div[1]    timeout=120s
    Sleep    120s  
    Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
    Sleep    5s   

    