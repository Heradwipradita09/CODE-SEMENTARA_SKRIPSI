*** Settings ***
Library             SeleniumLibrary
Library             Dialogs
Library             Collections
Library             DateTime


Suite Setup         Buka Aplikasi dan Login
Suite Teardown      Close Browser


*** Variables ***

${URL}                              https://app.sinariumkm.id/
${BROWSER}                          Chrome
${PHONE_NUMBER}                     6282122442631

# Media Modul Penerbitan
${PATH_FILE}                        C:/Users/HERA DWI PRADITA/Pictures/GAMBAR DIMSUM/DIMSUMMENTAI.jpg
${MEDIA_DARI_PERANGKAT}             xpath=//a[contains(text(),'Media dari perangkat')]

# Tab Navigasi Modul Penerbitan
${TAB_PENERBITAN}                   xpath=//*[@id="root"]/div[4]/a[3]/div

# Sosial Media Modul Penerbitan 
${BUTTON_PROFIL_SOSMED}             xpath=//*[@id="root"]/div[2]/div/div/div[1]/button
${PILIH_FACEBOOK}                   xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/div/div/ul/li[1]/div/div
${PILIH_INSTAGRAM}                  xpath=//*[@id="ModalAnggotaTim"]/div/div/div[2]/div/div/ul/li[2]/div/div
${TOMBOL_TUTUP_PROFIL}              xpath=//*[@id="ModalAnggotaTim"]/div/div/div[1]/a

# Status Konten Modul Penerbitan
${TOMBOL_STATUS_KONTEN}             xpath=//*[@id="root"]/div[2]/div/div/div[2]/button
${STATUS_DITERBITKAN}               xpath=//*[@id="Diterbitkan"]
${STATUS_DIJADWALKAN}               xpath=//*[@id="Dijadwalkan"]
${STATUS_GAGAL}                     xpath=//*[@id="Gagal"]
${TOMBOL_TUTUP_STATUS}              xpath=//*[@id="ModalStatusKonten"]/div/div/div[1]/a

# Tambah Konten Modul Penerbitan
${TAMBAH_KONTEN_BUTTON}             xpath=//a[@href="/publishing/add" and contains(text(),"Tambah Konten")]
${KONTEN_TEXTAREA}                  xpath=//textarea[@placeholder='Ketikan kontennya disini...']
${KONTEN_OTOMATIS}                  DIMSUM AYAM HANYA CONTOH

# Upload Media Modul Penerbitan
${TOMBOL_TAMBAH_MEDIA}              xpath=//div[contains(@class, 'col-3')]/button[contains(@class, 'btn-primary')]
${FILE_INPUT}                       xpath=//input[@type="file"]
${PATH_FILE}                        ${EXECDIR}/resources/DIMSUMMENTAI.jpg

# Test titik tiga Modul Penerbitan
${TITIK_TIGA}                       xpath=//*[@id="appCapsule"]/div[1]/div[1]/div/div[1]/ul/li/div/div[2]/button
${LIHAT_SOSMED}                     xpath=//*[@id="root"]/div[8]/div[2]/ul/li[1]/a
${HAPUS}                            xpath=//*[@id="root"]/div[8]/div[2]/ul/li[2]/a
${SILANG_MENU}                      xpath=//*[@id="root"]/div[8]/div[1]/div/div[2]/a/ion-icon//div/svg
${POPUP_TUTUP}                      xpath=//*[@id="DialogBasic"]/div/div/div[3]/div/a[1]
${POPUP_YA_HAPUS}                   xpath=//*[@id="DialogBasic"]/div/div/div[3]/div/a[2]

# Penjadwalan Konten Modul Penerbitan
${TOMBOL_ATUR_JADWAL}               xpath=//button[@data-bs-target="#ModalFormDate"]
${INPUT_JADWAL}                     xpath=//input[@placeholder='dd/MM/yyyy HH:mm']
${OK_BUTTON}                        xpath=//*[@id="ModalFormDate"]/div/div/div[1]/a/span
${TERBITKAN_BUTTON}                 xpath=//button[normalize-space(.)="Terbitkan"]
${JADWALKAN_BUTTON}                 xpath=//button[contains(., "Jadwalkan")]




*** Test Cases ***

# MODUL PENERBITAN AWAL
Buka Tab Penerbitan

   Click Element    ${TAB_PENERBITAN}
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}     timeout=10s

   # Klik tab Penerbitan untuk mengakses halaman
   Log    Membuka tab penerbitan
   Click Element    ${TAB_PENERBITAN}
   Sleep    5s

Uji Pilih Facebook Dan Instagram
   # Klik tombol "Pilih Profil Sosial Media" untuk membuka pilihan
   Log    Profil sosial media dipilih
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}    timeout=10s
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    2s

   # Pilih Instagram pakai JavaScript
   Log    Instagram dipilih
   Wait Until Element Is Visible    ${PILIH_INSTAGRAM}      timeout=10s
   Execute JavaScript    document.getElementById("radioAnggotaTim1")?.click()
   Sleep    2s

   # Buka kembali modal
   Log    Buka kembali modal
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    2s

   # Pilih Facebook pakai JavaScript
   Log    Facebook dipilih
   Wait Until Element Is Visible    ${PILIH_FACEBOOK}        timeout=10s
   Execute JavaScript    document.getElementById("radioAnggotaTim0")?.click()
   Sleep    2s
 
   # Buka kembali modal
   Log    Buka kembali modal
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    2s

   #Tutup Modal Sosial Media
   # Menutup modal sosial media
   Log    Modal sosial media ditutup
   Execute JavaScript    document.querySelector('#ModalAnggotaTim a')?.click()
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}    timeout=10s
   Sleep    5s

Uji Pilih Status Konten
   [Documentation]    Menguji pemilihan status konten di tab Penerbitan
   # Membuka dropdown status konten
   Log    Dropdown status konten dibuka
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}    timeout=10s
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s

   # Pilih "Diterbitkan"
   Log    Status "Diterbitkan" dipilih
   Wait Until Element Is Visible    ${STATUS_DITERBITKAN}    timeout=10s
   Execute JavaScript    document.getElementById("Diterbitkan")?.click()
   Sleep    1s

   # Klik dropdown 
   Log    Klik dropdown 
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s


   # Pilih "Dijadwalkan"
   Log    Status "Dijadwalkan" dipilih
   Wait Until Element Is Visible    ${STATUS_DIJADWALKAN}    timeout=10s
   Execute JavaScript    document.getElementById("Dijadwalkan")?.click()
   Sleep    1s

   # Klik dropdown 
   Log    Klik dropdown 
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s
  
   # Pilih "Gagal"
   Log    Status "Gagal" dipilih
   Wait Until Element Is Visible    ${STATUS_GAGAL}    timeout=10s
   Execute JavaScript    document.getElementById("Gagal")?.click()
   Sleep    1s

   # Klik dropdown 
   Log    Klik dropdown 
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s


   # Klik tombol silang (x)
   Log    Klik tombol silang (x)
   Wait Until Element Is Visible    ${TOMBOL_TUTUP_STATUS}    timeout=10s
   Execute JavaScript
   ...    document.evaluate('//*[@id="ModalStatusKonten"]/div/div/div[1]/a', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    5s


Uji Status Konten Tanpa Pengaturan Penjadwalan
   # Klik tombol untuk menambah konten
   Log    Menambah konten tanpa penjadwalan
   Click Element    ${TAB_PENERBITAN}
   Sleep    1s
   Click Element    ${TAMBAH_KONTEN_BUTTON} 
   Sleep    5s

   # Input konten pada textarea
   Log    Konten diinput
   Wait Until Element Is Visible    ${KONTEN_TEXTAREA}    timeout=10s
   Input Text    ${KONTEN_TEXTAREA}    ${KONTEN_OTOMATIS}

   # Upload file media
   Log    Upload Media
   Click Element    ${TOMBOL_TAMBAH_MEDIA}
   Sleep    1s
   Choose File    ${FILE_INPUT}    ${PATH_FILE}
   Log To Console    Upload file DIMSUMMENTAI.jpg done
   Sleep    5s

   # Klik tombol terbitkan
   Log    Konten diterbitkan
   Wait Until Element Is Enabled    ${TERBITKAN_BUTTON}    timeout=10s
   Click Element    ${TERBITKAN_BUTTON}
   Sleep    5s
   
   # Tunggu sampai konten berhasil diterbitkan
   Log    Tunggu sampai konten berhasil diterbitkan
   Wait Until Element Is Visible     xpath=//div[contains(text(),"Penerbitan Konten")]    timeout=25s
   Sleep     5s


Uji Status Konten Dengan Penjadwalan
   # Klik tombol untuk menambah konten dengan penjadwalan
   Log    Menambah konten dengan penjadwalan
   Click Element    ${TAMBAH_KONTEN_BUTTON} 
   Sleep    5s

   # Input konten pada textarea
   Log    Konten diinput
   Wait Until Element Is Visible    ${KONTEN_TEXTAREA}    timeout=10s
   Input Text    ${KONTEN_TEXTAREA}    ${KONTEN_OTOMATIS}

   # Upload file media
   Log    Upload Media
   Click Element    ${TOMBOL_TAMBAH_MEDIA}
   Sleep    1s
   Choose File    ${FILE_INPUT}    ${PATH_FILE}
   Log To Console    Upload file DIMSUMMENTAI.jpg done
   Sleep    5s

   # Klik ikon kalender untuk atur jadwal
   Log    Pengaturan jadwal dibuka
   Click Element    ${TOMBOL_ATUR_JADWAL}    
   Sleep    1s

   # Pilih tanggal dari kalender
   Log    Tanggal dipilih untuk penjadwalan
   Click Element    ${INPUT_JADWAL}
   Sleep    5s
   Wait Until Element Is Visible    xpath=/html/body/div[3]    timeout=10s
   ${today}=    Get Current Date    result_format=%#d
   ${tanggal_xpath}=    Set Variable    //div[contains(@class,"rs-calendar-table")]//div[normalize-space()="${today}" and not(contains(@class,"rs-calendar-cell-disabled"))]

   Wait Until Element Is Visible    xpath=${tanggal_xpath}    timeout=10s
   Click Element    xpath=${tanggal_xpath}
   Sleep    5s

   # Klik tombol OK untuk konfirmasi
   Log    Konfirmasi penjadwalan selesai
   Click Element    ${OK_BUTTON}
   Sleep    1s

   # Klik tombol jadwalkan
   Log    Konten dijadwalkan
   Click Element    ${JADWALKAN_BUTTON}
   Sleep    5s
   
   # Pastikan kembali ke halaman utama
   Log    Pastikan kembali ke halaman utama
   Wait Until Element Is Visible     xpath=//div[contains(text(),"Penerbitan Konten")]     timeout=15s
   Sleep     5s


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
