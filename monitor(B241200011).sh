#!/bin/bash

# --- 1. VERİLERİ TOPLA ---
TARIH=$(date "+%d %B %Y %H:%M:%S")
CPU_YUKU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM_KULLANILAN=$(free -m | grep Mem | awk '{print $3}')
RAM_TOPLAM=$(free -m | grep Mem | awk '{print $2}')
DISK_DOLULUK=$(df -h / | awk 'NR==2 {print $5}')
DISK_TOPLAM=$(df -h / | awk 'NR==2 {print $2}')
KULLANICI_SAYISI=$(who | wc -l)

# --- 2. MODERN HTML RAPORU OLUŞTUR ---
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="30">
    <title>Sistem Durum Paneli</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            color: #333;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
        }
        h1 {
            color: #4a4a4a;
            margin-bottom: 30px;
            font-size: 24px;
            border-bottom: 2px solid #eee;
            padding-bottom: 15px;
        }
        .metric {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
            transition: background 0.3s;
        }
        .metric:last-child {
            border-bottom: none;
        }
        .metric:hover {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .label {
            font-weight: 600;
            color: #666;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .value {
            font-weight: bold;
            color: #764ba2;
        }
        .footer {
            margin-top: 25px;
            font-size: 12px;
            color: #888;
        }
        .icon { font-size: 1.2em; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Sunucu Kontrol Paneli</h1>
        
        <div class="metric">
            <span class="label"><span class="icon">📅</span> Tarih</span>
            <span class="value">$TARIH</span>
        </div>

        <div class="metric">
            <span class="label"><span class="icon">🧠</span> CPU Yükü</span>
            <span class="value">%$CPU_YUKU</span>
        </div>

        <div class="metric">
            <span class="label"><span class="icon">💾</span> RAM</span>
            <span class="value">$RAM_KULLANILAN MB / $RAM_TOPLAM MB</span>
        </div>

        <div class="metric">
            <span class="label"><span class="icon">💿</span> Disk</span>
            <span class="value">$DISK_DOLULUK (Top: $DISK_TOPLAM)</span>
        </div>

        <div class="metric">
            <span class="label"><span class="icon">👤</span> Aktif Kullanıcı</span>
            <span class="value">$KULLANICI_SAYISI Kişi</span>
        </div>

        <div class="footer">
            Otomatik olarak güncellenmektedir.<br>
            Son Güncelleme: $TARIH
        </div>
    </div>
</body>
</html>
EOF
