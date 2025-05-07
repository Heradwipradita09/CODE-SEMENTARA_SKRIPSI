*** Settings ***
Library             SeleniumLibrary
Suite Setup         Buka Aplikasi dan Login

*** Variables ***

${URL}                              https://app.sinariumkm.id/
${BROWSER}                          Chrome
${PHONE_NUMBER}                     6282122442631

# Tab Navigasi
${TAB_PENERBITAN}                   xpath=//*[@id="root"]/div[4]/a[3]/div

# Sosial Media        
${BUTTON_PROFIL_SOSMED}            xpath=//*[@id="root"]/div[2]/div/div/div[1]/button 

# Status Konten 
${TOMBOL_STATUS_KONTEN}           xpath=//*[@id="root"]/div[2]/div/div/div[2]/button

# Tambah Konten 
${TAMBAH_KONTEN_BUTTON}             xpath=//a[@href="/publishing/add" and contains(text(),"Tambah Konten")]
${TOMBOL_TAMBAH_MEDIA}          xpath=//div[contains(@class, 'col-3')]/button[contains(@class, 'btn-primary')]

# Filter Horizontal Pojok Kanan
${BTN_FILTER_HORIZONTAL}            xpath=//*[@id="root"]/div[2]/div/div/div[3]/button

*** Test Cases ***
Buka Tab Penerbitan
   Click Element    ${TAB_PENERBITAN}
   Sleep    5s

Uji button pencarian

   # Klik tombol "Pilih Profil Sosial Media"
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}    timeout=10s
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    2s
                     
   # Klik dan isi kolom pencarian anggota tim (fitur belum aktif)
   Click Element    xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/form/div/input
   Input Text    xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/form/div/input    Nama Tim
   Sleep    2s 

Tutup Modal Sosial Media
   [Documentation]    Klik tombol silang di modal sosial media dan tunggu kembali ke halaman utama tab Penerbitan

   # Klik tombol silang pakai JS
   Execute JavaScript    document.querySelector('#ModalAnggotaTim a')?.click()

   # Tunggu sampai tombol 'Pilih Status Konten' muncul sebagai tanda halaman utama tampil
   Wait Until Element Is Visible    ${TAB_PENERBITAN}   timeout=10s
   Sleep    5s


Uji klik filter horizontal
   # Klik tombol filter horizontal (fitur belum aktif)
   Click Element     ${BTN_FILTER_HORIZONTAL}   
   Sleep    2s

   # Validasi gagal karena tidak ada efek setelah diklik
   Element Should Be Visible    xpath=//div[@class='modal-filter']   # disesuaikan dengan elemen yang seharusnya muncul
   # Jika modal-filter tidak ada, test FAIL


Uji Klik Tombol Hashtag Fitur Belum Aktif
    
   # Klik tombol Tambah Konten
   Click Element    ${TAMBAH_KONTEN_BUTTON} 
   Sleep    5s
   Click Element    ${TOMBOL_TAMBAH_MEDIA}
   Sleep    1s

   # Klik tombol Hashtag di dalam pop-up "Apa yang ingin ditambahkan di konten?"
   Click Element    xpath=(//span[normalize-space()='Hashtag']/preceding-sibling::a)[1]
   Sleep    2s

   # Ekspektasi: modal hashtag muncul, tapi karena belum berfungsi -> test FAIL
   Element Should Be Visible    xpath=//div[contains(@class, 'modal-hashtag')]






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
