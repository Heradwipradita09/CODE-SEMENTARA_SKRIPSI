*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Suite Setup     Buka Aplikasi dan Login

*** Variables ***
${URL}                  https://app.sinariumkm.id/
${BROWSER}              Chrome
${PHONE_NUMBER}         6282122442631
${OTP}                  ${EMPTY}

# Variabel Modul Lampanye
${JUDUL_KAMPANYE}       GEN ZUM DIMSUM
${INISIATOR}            HANYA CONTOH
${ORGANISASI}           HANYA CONTOH
${DESKRIPSI}            HANYA CONTOH
${CATATAN_INTERNAL}     HANYA CONTOH
${LINK}                 https://link.konten.nya

# XPath elemen Modul Lampanye
${DETAIL_PERFORMA}      xpath=//*[@id="actionSheetShare"]/div[2]/ul/li[1]/a
${TAB_RINGKASAN}        xpath=//*[@id="root"]/div[2]/ul/li[1]/a
${TAB_PERFORMA}         xpath=//*[@id="root"]/div[2]/ul/li[2]/a
${TAB_KEAGENAN}         xpath=//*[@id="root"]/div[2]/ul/li[3]/a
${ICON_SILANG}          xpath=//*[@id="root"]/div[1]/div[3]/a/ion-icon
${STOP_ARSIPKAN}        xpath=//*[@id="actionSheetShare"]/div[2]/ul/li[2]/button
${POPUP_TUTUP}          xpath=//*[@id="appCapsule"]/div[4]/div/div/div[3]/div/button[1]
${POPUP_YA}             xpath=//*[@id="appCapsule"]/div[4]/div/div/div[3]/div/button[2]

# Elemen Modul Lampanye
${INPUT_PENCARIAN}      xpath=//*[@placeholder="Pencarian..."]
${LABEL_TIM}            xpath=//label[contains(., "Pencinta Dimsum")]
${BTN_SELANJUTNYA}      xpath=//button[contains(., "Selanjutnya")]
${CURRENT TIME}=        Get Time    result_format=%Y%m%d%H%M%S
${JUDUL_KAMPANYE}=        Set Variable    Arsipkan Kampanye ${CURRENT TIME}

*** Test Cases ***
Buat dan Posting Kampanye
    # Buka tab Kampanye Aktif
    Log    Klik tab Kampanye Aktif
    Click Element    xpath=//*[@id="root"]/div[2]/ul/li[1]/a

    # Klik tombol Tambah Kampanye
    Log    Klik tombol Tambah Kampanye
    Click Button    xpath=//*[@id="aktif"]/div[2]/div[2]/button

    # Isi form kampanye
    Log    Isi form kampanye
    Wait Until Element Is Visible    xpath=//*[@id="judul"]    timeout=60s
    Input Text    xpath=//*[@id="judul"]    ${JUDUL_KAMPANYE}
    Input Text    xpath=//*[@id="inisiator"]    ${INISIATOR}
    Input Text    xpath=//input[@id='organisasi']    ${ORGANISASI}
    Input Text    xpath=//textarea[@name='deskripsi']    ${DESKRIPSI}
    Input Text    xpath=//*[@id="catatan_internal"]    ${CATATAN_INTERNAL}

    # Klik tombol Selanjutnya
    Log    Klik tombol Selanjutnya untuk melanjutkan
    Wait Until Element Is Visible    ${BTN_SELANJUTNYA}    timeout=60s
    Click Button    ${BTN_SELANJUTNYA}

    # Isi bagian konten kampanye
    Log    Isi bagian konten kampanye
    Wait Until Element Is Visible    xpath=//*[@id="jenis_konten"]    timeout=60s
    Select From List By Value    xpath=//*[@id="jenis_konten"]    link
    Input Text    xpath=//*[@id="konten_link"]    ${LINK}
    Input Text    xpath=//*[@id="copywriting-1"]    Link kampanye dimsum lezat, klik sekarang!

    # Klik tombol Selanjutnya
    Log    Klik tombol Selanjutnya
    Click Button    ${BTN_SELANJUTNYA}

    # Memilih Tim Kampanye
    Log    Menunggu input pencarian tim
    Wait Until Element Is Enabled    ${INPUT_PENCARIAN}    timeout=20s

    # Input nama tim
    Log    Input nama tim Pencinta Dimsum
    Input Text    ${INPUT_PENCARIAN}    Pencinta Dimsum

    # Tunggu label muncul
    Log    Menunggu label tim muncul
    Wait Until Page Contains Element    ${LABEL_TIM}    timeout=15s
    Sleep    1s

    # Scroll dan klik label tim pakai JavaScript
    Log    Scroll dan klik label tim Pencinta Dimsum
    Execute JavaScript
    ...    var el = [...document.querySelectorAll('label')].find(e => e.textContent.includes('Pencinta Dimsum'));
    ...    if(el){ el.scrollIntoView(); el.click(); }

    # Verifikasi checkbox aktif
    ${is_checked}=    Execute JavaScript    return document.getElementById("group0")?.checked
    Log    Checkbox Pencinta Dimsum checked: ${is_checked}

    # Klik tombol Selanjutnya
    Log    Klik tombol Selanjutnya
    Click Button    ${BTN_SELANJUTNYA}

    # Tunggu dan klik tombol Mulai Kampanye
    Log    Tunggu dan klik tombol Mulai Kampanye
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Mulai Kampanye")]    timeout=60s
    Wait Until Element Is Enabled    xpath=//button[contains(text(), "Mulai Kampanye")]    timeout=60s
    Click Button    xpath=//button[contains(text(), "Mulai Kampanye")]

    # Validasi akhir bahwa kampanye berhasil dibuat
    Log    Validasi kampanye berhasil dibuat
    Wait Until Element Contains    xpath=//*[@id="aktif"]    ${JUDUL_KAMPANYE}    timeout=30s
    Sleep    2s

    # Tunggu halaman refresh
    Wait Until Page Contains Element    xpath=//a[@href="#draf"]    timeout=30s
    Sleep    2s

Pindah ke tab Draf
    Log    Pindah ke tab Draf
    Click Element    xpath=//a[@href="#draf"]
    Sleep    2s

Pindah ke tab Arsip
    Log    Pindah ke tab Arsip
    Click Element    xpath=//a[@href="#arsip"]
    Sleep    2s

*** Keywords ***
Buka Aplikasi dan Login
    Log    Membuka aplikasi dan login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@placeholder='628xxx']    timeout=30s
    Input Text    xpath=//input[@placeholder='628xxx']    ${PHONE_NUMBER}
    Click Button    xpath=//button[text()='Log in SINARI']
    Wait Until Element Is Visible
    ...    xpath=//*[@id="appCapsule"]/div/div[2]/form/ul/li/div/div/div/div[1]
    ...    timeout=30s
    Sleep    15s    # Menunggu OTP manual
    Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
    Sleep    5s
