; Инструкция https://jrsoftware.org/ishelp/index.php

; Всегда меняются
#define GameName "BioShock"                                          ; Название игры
#define GameNameDash "BioShock"                                                          ; Название игры без пробелов
#define GameNameEXE "BioShock"                                                              ; Название exe файла игры
#define GameVer "1.1"                                                                     ; Версия игры
#define GameAppIdSteam "7670"                                                             ; Ид игры в стиме
; От ситуации зависит
#define AppDescription "Русификатор текста и звука"                                     ; Описание программы
#define Typ "Russificier"                                                                    ; Тип приложения
; Практически никогда не меняется
#define AppVer "1.0"                                                                        ; Версия установщика
#define Platz "C:\Users\TeMeR\Documents\GitHub"                                                    ; Место
; Константы
#define Copyright "Folk"                                                                  ; (констант)Копирайт
#define AppPublisher "Russifiers for Humans"                                              ; (констант)Название инициативы
#define AppPublisherDash "Russifiers-for-Humans"                                              ; (констант)Название инициативы
#define PublisherURL "https://steamcommunity.com/id/TeMeR55"                              ; (констант)Ссылка на автора
#define AppURL "https://github.com/" + AppPublisherDash + "/" +GameNameDash + "-" + Typ +"/releases"        ; Ссылка на руководство
; Сложные переменные  
#define Location Platz + "\" + GameNameDash + "-" + Typ                                       ; Место нахождение соурса
#define OriginalNameSetup Typ + "-" + GameNameDash                        ; Оригинальное наименование приложения
#define AppNameAndDescript GameName + " - " + AppDescription                              ; Название программы и описание
#define ProductVerName AppNameAndDescript + " для версии " + GameVer                             ; Название программы для какой версии игры в системе

#define UnArcivProg "7zG.EXE"
#define FolderUnArcivProg "7z"
#define Arciv "data.zip.001"
[Setup]
; Номер приложения для его удаление лучше все время не забывать разный совать. Проверка уникальный для: BioShock Russificier
AppId={{6AD15469-28DD-4392-BB54-6DEEB1074CAB}
//--------------------------------------App's information and version--------------------------------------\\
; Свойства приложения
AppName={#AppNameAndDescript}                                                   
AppVersion={#AppVer}
AppVerName={#ProductVerName}
AppCopyright={#Copyright}
AppContact={#PublisherURL}
AppComments={#Typ}
AppPublisher={#AppPublisher}
AppPublisherURL={#PublisherURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AppReadmeFile={#AppURL}
VersionInfoCompany={#AppPublisher}
VersionInfoCopyright={#Copyright}
VersionInfoDescription={#AppDescription}
VersionInfoOriginalFileName={#OriginalNameSetup}  
VersionInfoProductName={#ProductVerName}
VersionInfoProductTextVersion={#AppVer}
VersionInfoVersion={#AppVer}     
//--------------------------------------Options--------------------------------------\\
; Если установлено значение «да», программа установки отобразит флажок «Не создавать папку в меню «Пуск»
AllowNoIcons=yes
; Имя папки в меню «Пуск»
DefaultGroupName={#AppPublisher}
; Путь по умолчанию
DefaultDirName={code:GetInstallationPath}
; Название установщика
OutputBaseFilename={#OriginalNameSetup}
; Если установлено значение «нет», отключает уведомление об "Существующей папке"
DirExistsWarning=no
; Если установлено значение «да», включает уведомление об "Не существующей папке"
EnableDirDoesntExistWarning=yes
;Если установлено значение «нет», включает страницу "Мастер приветствует"
DisableWelcomePage=no    
;Если установлено значение «нет», включает страницу "Спасибо за установку"
DisableFinishedPage=no
//--------------------------------------Compression--------------------------------------\\
DiskSpanning=true
; Размер в байтах твоего setup1.bin
DiskSliceSize=2100000000
; Метод сжатия
Compression=lzma2/ultra64
; Если установлено значение «да»,включает сжатие в один поток(лучше сжимает, но проблем больше) 
SolidCompression=yes
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMANumFastBytes=273
//--------------------------------------Files--------------------------------------\\
; Путь к фалу Лицензии
LicenseFile={#Location}\Licence.rtf
; Путь к фалу Описание
InfoBeforeFile={#Location}\Description.rtf                      
;InfoAfterFile=infoafter.txt
; Путь к фалу Иконка
SetupIconFile={#Location}\Icon.ico
; Путь к фалу Сетап
OutputDir={#Location}\
; Путь к фалу Картинки
WizardImageFile={#Location}\Pic.bmp
; Путь к фалу Картинки
WizardSmallImageFile={#Location}\Pic.bmp

[Components]
Name: "Rus";    Description: "Русификатор"; Types: full compact
Name: "Rus\text";    Description: "текста"; Types: full compact
Name: "Rus\sound";    Description: "звука"; Types: full

[Files]
; Ресурсы
Source: {#Location}\{#FolderUnArcivProg}\*;  DestDir: "{tmp}";      Flags: deleteafterinstall

Source: {#Location}\{#GameName}\Rus\text\*;  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Rus\text
Source: {#Location}\{#GameName}\Rus\sound\*;  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Rus\sound

Source: {#Location}\{#GameName}\Setting\*;  DestDir: "{userappdata}\{#GameName}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Rus

Source: {#Location}\{#GameName}\zip\text\*;       DestDir: "{tmp}";      Flags: deleteafterinstall;Components: Rus\text
Source: {#Location}\{#GameName}\zip\sound\*;       DestDir: "{tmp}";      Flags: deleteafterinstall;Components: Rus\sound


[Icons]
; Ярлык
Name: "{userprograms}\{#AppPublisher}\{#GameName}\{cm:ProgramOnTheWeb,{#ProductVerName}}"; Filename: "{#AppURL}"
; Ярлык
Name: "{userprograms}\{#AppPublisher}\{#GameName}\{cm:UninstallProgram,{#ProductVerName}}"; Filename: "{uninstallexe}"

[Run]
 ;На финальной страницу спрашивает о запуске финального продукта
;Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\{#Arciv} -y -o""{app}"""
Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\Content.zip -y -o""{app}\"""; Components: Rus\text
Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\Content.zip.001 -y -o""{app}\"""; Components: Rus\sound  
 
[UninstallDelete]
Type: files;          Name: "{app}\Content\BinkMovies\attractMovie.bik"; Components: Rus\sound            
Type: files;          Name: "{app}\Content\Sounds_Windows\streams_1_audio.rus_fsb"; Components: Rus            

[Code]
var
  InstallationPath: string;

function GetInstallationPath(Param: string): string;
    
begin
  { Обнаруженный путь кэшируется, так как он вызывается несколько раз }
  
  if InstallationPath = '' then
  begin
    if RegQueryStringValue(
         HKLM64, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App {#GameAppIdSteam}',
         'InstallLocation', InstallationPath) then
    begin
      Log('Detected Steam installation: ' + InstallationPath);
    end
      else
    begin
      if IsWin64 then InstallationPath := ExpandConstant('{commonpf64}')
      else InstallationPath := ExpandConstant('{commonpf32}');
      InstallationPath:=InstallationPath +'/{#GameName}';
      Log('No installation detected, using the default path: ' + InstallationPath);
    end;
  end;
  Result := InstallationPath;
end;

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl";