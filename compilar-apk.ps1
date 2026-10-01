# Compila Pucela Plan y deja el APK en esta carpeta como PucelaPlan.apk
$ErrorActionPreference = "Stop"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"
$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot"
$root = $PSScriptRoot

Copy-Item "$root\data\eventos.json" "$root\app\www\eventos.json" -Force
Push-Location "$root\app"
npx cap sync android
Push-Location android
.\gradlew.bat assembleDebug --no-daemon
Pop-Location; Pop-Location
Copy-Item "$root\app\android\app\build\outputs\apk\debug\app-debug.apk" "$root\PucelaPlan.apk" -Force
Write-Host "APK listo: $root\PucelaPlan.apk"
