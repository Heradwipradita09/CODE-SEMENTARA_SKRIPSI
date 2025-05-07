*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Suite Setup         Buka Aplikasi dan Login

*** Variables ***
${URL}               https://app.sinariumkm.id/  
${BROWSER}           Chrome                   
${PHONE_NUMBER}      6282122442631
${OTP}     

# Tab Navigasi Modul Laporan
${TAB_NAVIGASI_LAPORAN}             xpath=//*[@id="root"]/div[4]/a[5]/div

# Sosial Media Modul Laporan
${BUTTON_PROFIL_SOSMED}            xpath=//*[@id="root"]/div[2]/div/div/div[1]/button
${PILIH_FACEBOOK}                  xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/div/div/ul/li[1]/div/div
${PILIH_INSTAGRAM}                 xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/div/div/ul/li[2]/div/div

# Status Konten Modul Laporan
${TOMBOL_STATUS_KONTEN}           xpath=//*[@id="root"]/div[2]/div/div/div[2]/button

#Jenis Laporan Modul Laporan
${XPATH_DROPDOWN_JENIS_LAPORAN}    xpath=//*[@id="root"]/div[2]/div/div/div[2]/button
${XPATH_OPTION_PEMIRSA}            xpath=//*[@id="Pemirsa"]
${XPATH_OPTION_KONTEN}             xpath=//*[@id="Konten"]
${XPATH_BUTTON_SILANG}             xpath=//*[@id="modalJenisLaporan"]/div/div/div[1]/a

# Komponen Modul Kampanye
${KOMPONEN_DATA_INSTAGRAM}    xpath=//div[contains(., 'Data Instagram')]
${KOMPONEN_DATA_FACEBOOK}     xpath=//div[contains(., 'Data Facebook')]
${KOMPONEN_LAPORAN_PEMIRSA}   xpath=//h2[contains(., 'Laporan Pemirsa')]
${KOMPONEN_LAPORAN_KONTEN}    xpath=//h2[contains(., 'Laporan Konten')]



*** Test Cases ***
Buka Tab Laporan
   Click Element    ${TAB_NAVIGASI_LAPORAN} 
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}     timeout=35s

   # Klik tab laporan untuk membuka halaman laporan
   Log    Membuka tab laporan
   Click Element    ${TAB_NAVIGASI_LAPORAN}    
   Sleep    5s

Uji Pilih Facebook Dan Instagram
   # Klik tombol "Pilih Profil Sosial Media" untuk memilih sosial media
   Log    Klik tombol "Pilih Profil Sosial Media"
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Wait Until Page Contains Element    ${PILIH_INSTAGRAM}    timeout=15s
   Sleep    1s



   # Pilih Instagram menggunakan JavaScript
   Log    Pilih Instagram menggunakan JavaScript
   Execute JavaScript    document.getElementById("radioAnggotaTim1")?.click()
   Wait Until Page Contains   ${KOMPONEN_DATA_INSTAGRAM}    timeout=15s
   Sleep    2s


   # Buka kembali modal pilih sosial media
   Log    Buka kembali modal pilih sosial media
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    1s

   # Pilih Facebook menggunakan JavaScript
   Log    Pilih Facebook menggunakan JavaScript
   Execute JavaScript    document.getElementById("radioAnggotaTim0")?.click()
   Wait Until Page Contains    ${KOMPONEN_DATA_FACEBOOK}    timeout=15s
   Sleep    2s
   
   # Buka kembali modal pilih sosial media setelah pilih Facebook
   Log    Buka kembali modal pilih sosial media setelah pilih Facebook
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    2s

   # Klik tombol silang di modal sosial media untuk kembali ke halaman utama tab laporan
   Log    Klik tombol silang di modal sosial media untuk kembali ke halaman utama tab laporan
   Execute JavaScript    document.querySelector('#ModalAnggotaTim a')?.click()
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}    timeout=15s
   Sleep    2s

   # Tunggu hingga tombol 'Pilih Status Konten' muncul
   Log    Tunggu hingga tombol 'Pilih Status Konten' muncul
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}    timeout=10s
   Sleep    5s

Uji Pemilihan Jenis Laporan
   [Documentation]    Menguji pemilihan jenis laporan dari dropdown, memilih opsi, dan menutup modal
   # Pastikan tombol dropdown Jenis Laporan muncul
   Log    Pastikan tombol dropdown Jenis Laporan muncul
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}   timeout=20s

   # Klik dropdown Jenis Laporan menggunakan JavaScript
   Log    Klik dropdown Jenis Laporan menggunakan JavaScript
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Wait Until Page Contains Element    ${XPATH_OPTION_PEMIRSA}    timeout=10s
   Sleep    1s

   # Pilih jenis laporan "Pemirsa"
   Log    Pilih jenis laporan "Pemirsa"
   Execute JavaScript    document.getElementById("Pemirsa")?.click()
   Wait Until Page Contains   ${KOMPONEN_LAPORAN_PEMIRSA}    timeout=10s   
   Sleep    5s

   # Klik dropdown lagi untuk memilih jenis laporan berikutnya
   Log    Klik dropdown lagi untuk memilih jenis laporan berikutnya
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Wait Until Element Is Visible    ${KOMPONEN_LAPORAN_KONTEN}    timeout=10s
   Sleep    1s

   # Pilih jenis laporan "Konten"
   Log    Pilih jenis laporan "Konten"
   Execute JavaScript    document.getElementById("Konten")?.click() 
   Wait Until Page Contains   ${KOMPONEN_LAPORAN_KONTEN}    timeout=10s    
   Sleep    5s

   # Klik dropdown lagi untuk menutup pilihan
   Log    Klik dropdown lagi untuk menutup pilihan
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s

   # Klik tombol silang (x) untuk menutup modal jenis laporan
   Log    Klik tombol silang (x) untuk menutup modal jenis laporan
   Wait Until Element Is Visible    ${XPATH_BUTTON_SILANG}    timeout=10s
   Execute JavaScript
   ...    document.evaluate('//*[@id="modalJenisLaporan"]/div/div/div[1]/a', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    5s



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
