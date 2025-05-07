*** Settings ***
Library         SeleniumLibrary
Suite Setup     Buka Aplikasi dan Login


*** Variables ***
${URL}                  https://app.sinariumkm.id/
${BROWSER}              Chrome
${PHONE_NUMBER}         6282122442631
${OTP}                  ${EMPTY}

# Data negatif untuk field kampanye
${JUDUL_KAMPANYE}       3421!@!#$%
${INISIATOR}            @#$%1234
${ORGANISASI}           @#$%1234
${DESKRIPSI}            HANYA CONTOH
${CATATAN_INTERNAL}     ${EMPTY}
${LINK}                 linkkontennya

# Elemen kampanye
${INPUT_PENCARIAN}      xpath=//*[@placeholder="Pencarian..."]
${LABEL_TIM}            xpath=//label[contains(., "Pencinta Dimsum")]
${BTN_SELANJUTNYA}      xpath=//button[contains(., "Selanjutnya")]


*** Test Cases ***
Buat dan Posting Kampanye
    # Buka menu Kampanye Aktif
    Click Element    xpath=//*[@id="root"]/div[2]/ul/li[1]/a

    # Klik tombol "Tambah Kampanye"
    Click Button    xpath=//*[@id="aktif"]/div[2]/div[2]/button

    # Isi field form kampanye dengan data tidak valid
    Wait Until Element Is Visible    xpath=//*[@id="judul"]    timeout=60s
    Input Text    xpath=//*[@id="judul"]    ${JUDUL_KAMPANYE}
    Input Text    xpath=//*[@id="inisiator"]    ${INISIATOR}
    Input Text    xpath=//input[@id='organisasi']    ${ORGANISASI}
    Input Text    xpath=//textarea[@name='deskripsi']    ${DESKRIPSI}
    Input Text    xpath=//*[@id="catatan_internal"]    ${CATATAN_INTERNAL}

    # Klik tombol Selanjutnya untuk menuju halaman konten kampanye
    Wait Until Element Is Visible    ${BTN_SELANJUTNYA}    timeout=60s
    Click Button    ${BTN_SELANJUTNYA}

    # Isi konten kampanye dengan jenis konten link
    Wait Until Element Is Visible    xpath=//*[@id="jenis_konten"]    timeout=60s
    Select From List By Value    xpath=//*[@id="jenis_konten"]    link
    Input Text    xpath=//*[@id="konten_link"]    ${LINK}
    Input Text    xpath=//*[@id="copywriting-1"]    Link kampanye dimsum lezat, klik sekarang!

    # Klik tombol Selanjutnya untuk lanjut ke pemilihan tim
    Click Button    ${BTN_SELANJUTNYA}

Pilih Tim Kampanye
    # Tunggu hingga input pencarian tim bisa digunakan
    Wait Until Element Is Enabled    ${INPUT_PENCARIAN}    timeout=20s

    # Ketik nama tim kampanye
    Input Text    ${INPUT_PENCARIAN}    Pencinta Dimsum

    # Tunggu label dari nama tim muncul
    Wait Until Page Contains Element    ${LABEL_TIM}    timeout=15s
    Sleep    1s

    # Gunakan JavaScript untuk scroll dan klik label tim
    Execute JavaScript
    ...    var el = [...document.querySelectorAll('label')].find(e => e.textContent.includes('Pencinta Dimsum'));
    ...    if(el){ el.scrollIntoView(); el.click(); }

    # Mengecek apakah checkbox sudah dicentang
    ${is_checked}=    Execute JavaScript    return document.getElementById("group0")?.checked
    Log    Checkbox Pencinta Dimsum checked: ${is_checked}

    # Klik tombol Selanjutnya
    Click Button    ${BTN_SELANJUTNYA}

    # Klik tombol Mulai Kampanye
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Mulai Kampanye")]    timeout=60s
    Wait Until Element Is Enabled    xpath=//button[contains(text(), "Mulai Kampanye")]    timeout=60s
    Click Button    xpath=//button[contains(text(), "Mulai Kampanye")]

    # Verifikasi kampanye berhasil dibuat dengan mencocokkan judul
    Wait Until Element Contains    xpath=//*[@id="aktif"]    ${JUDUL_KAMPANYE}    timeout=30s
    Sleep    2s


*** Keywords ***
Buka Aplikasi dan Login
    # Membuka aplikasi di browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Isi nomor telepon dan klik login
    Wait Until Element Is Visible    xpath=//input[@placeholder='628xxx']    timeout=30s
    Input Text    xpath=//input[@placeholder='628xxx']    ${PHONE_NUMBER}
    Click Button    xpath=//button[text()='Log in SINARI']

    # Tunggu sampai form OTP muncul
    Wait Until Element Is Visible
    ...    xpath=//*[@id="appCapsule"]/div/div[2]/form/ul/li/div/div/div/div[1]
    ...    timeout=30s

    # Tunggu input OTP manual
    Sleep    15s

    # Klik tombol login setelah OTP diisi
    Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
    Sleep    5s
