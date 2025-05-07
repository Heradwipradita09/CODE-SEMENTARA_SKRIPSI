*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Library    DateTime
Suite Setup     Buka Aplikasi dan Login


*** Variables ***
# URL & Browser
${URL}                      https://app.sinariumkm.id/
${BROWSER}                  Chrome
${PHONE_NUMBER}             6282122442631
${OTP}                      ${EMPTY}


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
${CURRENT_TIME}=                    Get Time    result_format=%Y%m%d%H%M%S
${JUDUL_KONTEN}                     DIMSUM UDANG MENTAI



# Upload Media Modul Penerbitan
${TOMBOL_TAMBAH_MEDIA}              xpath=//div[contains(@class, 'col-3')]/button[contains(@class, 'btn-primary')]
${FILE_INPUT}                       xpath=//input[@type="file"]


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




# Tab Navigasi Modul Kampanye
${TAB_Kampanye}             xpath=//*[@id="root"]/div[4]/a[1]/div      
${BUTTON_Aktif}             xpath=//*[@id="root"]/div[2]/ul/li[1]/a 

# Variabel Modul Kampanye
${JUDUL_KAMPANYE}=      ${JUDUL_KONTEN} 
${INISIATOR}            HANYA CONTOH
${ORGANISASI}           HANYA CONTOH
${DESKRIPSI}            HANYA CONTOH
${CATATAN_INTERNAL}     HANYA CONTOH
${LINK}                 https://link.konten.nya

# XPath elemen Modul Kampanye
${DETAIL_PERFORMA}            xpath=//*[@id="actionSheetShare"]/div[2]/ul/li[1]/a
${TAB_RINGKASAN}              xpath=//*[@id="root"]/div[2]/ul/li[1]/a
${TAB_PERFORMA}               xpath=//*[@id="root"]/div[2]/ul/li[2]/a
${TAB_KEAGENAN}               xpath=//*[@id="root"]/div[2]/ul/li[3]/a
${ICON_SILANG}                xpath=//*[@id="root"]/div[1]/div[3]/a/ion-icon
${STOP_ARSIPKAN}              xpath=//*[@id="actionSheetShare"]/div[2]/ul/li[2]/button
${POPUP_TUTUP_ARSIP}          xpath=//*[@id="appCapsule"]/div[4]/div/div/div[3]/div/button[1]
${POPUP_YA}                   xpath=//*[@id="appCapsule"]/div[4]/div/div/div[3]/div/button[2]

# Elemen Modul Kampanye
${INPUT_PENCARIAN}      xpath=//*[@placeholder="Pencarian..."]
${LABEL_TIM}            xpath=//label[contains(., "Pencinta Dimsum")]
${BTN_SELANJUTNYA}      xpath=//button[contains(., "Selanjutnya")]





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

# Modul Penerbitan
Buka Tab Penerbitan
    
   # Klik tab Penerbitan untuk mengakses halaman
   Log    Membuka tab penerbitan
   Click Element    ${TAB_PENERBITAN}
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}     timeout=10s
   Sleep    5s

Uji Pilih Facebook Dan Instagram Modul Penerbitan
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
   Wait Until Element Is Visible    ${STATUS_DITERBITKAN}    timeout=15s
   Execute JavaScript    document.getElementById("Diterbitkan")?.click()
   Sleep    1s

   # Klik dropdown 
   Log    Klik dropdown 
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Sleep    1s


   # Pilih "Dijadwalkan"
   Log    Status "Dijadwalkan" dipilih
   Wait Until Element Is Visible    ${STATUS_DIJADWALKAN}    timeout=15s
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
   Input Text    ${KONTEN_TEXTAREA}    ${JUDUL_KONTEN}


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
   Input Text    ${KONTEN_TEXTAREA}    ${JUDUL_KONTEN}

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
# Modul Penerbitan



# MODUL KAMPANYE
Buat dan Posting Kampanye

   Click Element    ${TAB_Kampanye}  
   Wait Until Element Is Visible    ${BUTTON_Aktif}     timeout=10s

   # Buka tab Kampanye Aktif
   Log    Klik tab Kampanye Aktif
   Click Element    ${BUTTON_Aktif} 

   # Klik tombol Tambah Kampanye
   Log    Klik tombol Tambah Kampanye
   Click Button    xpath=//*[@id="aktif"]/div[2]/div[2]/button

   # Isi form kampanye
   Log    Isi form kampanye
   Wait Until Element Is Visible    xpath=//*[@id="judul"]    timeout=60s
   Input Text    xpath=//*[@id="judul"]     ${JUDUL_KONTEN}
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
   Wait Until Page Contains Element    xpath=//a[@href="#draf"]    timeout=40s
   Sleep    2s

Pindah ke tab Draf
   Log    Pindah ke tab Draf
   Click Element    xpath=//a[@href="#draf"]
   Sleep    2s

Pindah ke tab Arsip
   Log    Pindah ke tab Arsip
   Click Element    xpath=//a[@href="#arsip"]
   Sleep    2s
# Modul Kampanye




# MODUL LAPORAN

Buka Tab Laporan
   Click Element    ${TAB_NAVIGASI_LAPORAN} 
   Wait Until Element Is Visible    ${BUTTON_PROFIL_SOSMED}     timeout=60s

   # Klik tab laporan untuk membuka halaman laporan
   Log    Membuka tab laporan
   Click Element    ${TAB_NAVIGASI_LAPORAN}    
   Sleep    5s

Uji Pilih Facebook Dan Instagram Modul Laporan
   # Klik tombol "Pilih Profil Sosial Media" untuk memilih sosial media
   Log    Klik tombol "Pilih Profil Sosial Media"
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Wait Until Page Contains Element    ${PILIH_INSTAGRAM}    timeout=60s
   Sleep    1s



   # Pilih Instagram menggunakan JavaScript
   Log    Pilih Instagram menggunakan JavaScript
   Execute JavaScript    document.getElementById("radioAnggotaTim1")?.click()
   Wait Until Page Contains   ${KOMPONEN_DATA_INSTAGRAM}    timeout=60s
   Sleep    2s


   # Buka kembali modal pilih sosial media
   Log    Buka kembali modal pilih sosial media
   Click Element    ${BUTTON_PROFIL_SOSMED}
   Sleep    1s

   # Pilih Facebook menggunakan JavaScript
   Log    Pilih Facebook menggunakan JavaScript
   Execute JavaScript    document.getElementById("radioAnggotaTim0")?.click()
   Wait Until Page Contains    ${KOMPONEN_DATA_FACEBOOK}    timeout=60s
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
   Wait Until Element Is Visible    ${TOMBOL_STATUS_KONTEN}   timeout=60s

   # Klik dropdown Jenis Laporan menggunakan JavaScript
   Log    Klik dropdown Jenis Laporan menggunakan JavaScript
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Wait Until Page Contains Element    ${XPATH_OPTION_PEMIRSA}    timeout=60s
   Sleep    1s

   # Pilih jenis laporan "Pemirsa"
   Log    Pilih jenis laporan "Pemirsa"
   Execute JavaScript    document.getElementById("Pemirsa")?.click()
   Wait Until Page Contains   ${KOMPONEN_LAPORAN_PEMIRSA}    timeout=60s   
   Sleep    5s

   # Klik dropdown lagi untuk memilih jenis laporan berikutnya
   Log    Klik dropdown lagi untuk memilih jenis laporan berikutnya
   Execute JavaScript
   ...    document.evaluate('//*[@id="root"]/div[2]/div/div/div[2]/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
   Wait Until Element Is Visible    ${KOMPONEN_LAPORAN_KONTEN}    timeout=60s
   Sleep    1s

   # Pilih jenis laporan "Konten"
   Log    Pilih jenis laporan "Konten"
   Execute JavaScript    document.getElementById("Konten")?.click() 
   Wait Until Page Contains   ${KOMPONEN_LAPORAN_KONTEN}    timeout=60s    
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


# MODUL LAPORAN



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
    Sleep    15s    # Menunggu OTP manual
    Click Button    xpath=//*[@id="appCapsule"]/div/div[2]/form/button
    Sleep    5s


