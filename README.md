[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/g9rN3dhc)
# Linux Sunucu Durum Paneli 

Bu proje, Linux sunucusunun anlık sağlık durumunu (CPU, RAM, Disk, Tarih) izleyen ve bunları web tabanlı bir arayüzde gösteren bir otomasyon çalışmasıdır.

## Proje İçeriği
* **monitor.sh:** Sistem verilerini çeken ve HTML formatına dönüştüren Bash scripti.
* **index.html:** Script tarafından otomatik oluşturulan sunum sayfası.
* **screenshot.png:** Çalışan sistemin ekran görüntüsü.

## Kurulum ve Gereksinimler
Bu proje için aşağıdaki paketler kullanılmıştır:
* **Web Sunucusu:** Apache2 (veya Nginx kurduysan buraya Nginx yaz)
* **İşletim Sistemi:** Ubuntu Linux

Kurulum komutu:
`sudo apt install apache2`

## Nasıl Çalışır?
`monitor.sh` dosyası; `top`, `free`, `df` ve `date` gibi Linux komutlarını kullanarak sistem verilerini çeker ve `/var/www/html/index.html` dosyasına yazar.

## Otomasyon (Cron Job) Ayarı
Scriptin her dakika otomatik çalışması için Crontab kullanılmıştır.

Kullanılan Crontab komutu:
`* * * * * /home/ubuntu/monitor.sh`

Bu ayar `crontab -e` komutu ile eklenmiştir ve scriptin her dakika başı çalışarak web sayfasını güncellemesini sağlar.
