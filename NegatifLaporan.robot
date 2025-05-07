*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Suite Setup         Buka Aplikasi dan Login

*** Variables ***
${URL}               https://app.sinariumkm.id/  
${BROWSER}           Chrome                   
${PHONE_NUMBER}      6282122442631
${OTP}

# Tab Navigasi 
${TAB_NAVIGASI_LAPORAN}             xpath=//*[@id="root"]/div[4]/a[5]/div

# Sosial Media 
${BUTTON_PROFIL_SOSMED}            xpath=//*[@id="root"]/div[2]/div/div/div[1]/button

# Filter Horizontal Pojok Kanan
${BTN_FILTER_HORIZONTAL}            xpath=//*[@id="root"]/div[2]/div/div/div[3]/button

*** Test Cases ***

Buka Tab Laporan

   Click Element    ${TAB_NAVIGASI_LAPORAN} 
   Sleep    5s

# Uji button pencarian

#    # Klik tombol "Pilih Profil Sosial Media"
#    Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}    timeout=10s
#    Click Element    ${BUTTON_PROFIL_SOSMED}
#    Sleep    2s
                     
#     # Klik dan isi kolom pencarian anggota tim (fitur belum aktif)
#     Click Element    xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/form/div/input
#     Input Text    xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/form/div/input    Nama Tim
#     Sleep    2s 


Uji klik filter horizontal
    # Klik tombol filter horizontal (fitur belum aktif)
    Click Element     ${BTN_FILTER_HORIZONTAL}   
    Sleep    2s

    # Validasi gagal karena tidak ada efek setelah diklik
    Element Should Be Visible    xpath=//div[@class='modal-filter']   # disesuaikan dengan elemen yang seharusnya muncul
    # Jika modal-filter tidak ada, test FAIL






*** Keywords ***
Buka Aplikasi dan Login
   Open Browser    ${URL}    ${BROWSER}
   Maximize Browser Window
   Wait Until Element Is Visible    xpath=//input[@placeholder='628xxx']    timeout=30s
   Input Text    xpath=//input[@placeholder='628xxx']    ${PHONE_NUMBER}
   Click Button    xpath=//button[text()='Log in SINARI']
   Wait Until Element Is Visible
   ...    xpath=//*[@id="appCapsule"]/div/div[2]/form/ul/li/div/div/div/div[1]
   ...    timeout=30s
   Sleep    15s
   Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
   Sleep    5s
