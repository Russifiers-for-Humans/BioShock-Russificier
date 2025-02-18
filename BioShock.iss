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
#define AppVer "2.0"                                                                        ; Версия установщика
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
#define Arciv "data.7z.001"
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
;DiskSpanning=true
; Размер в байтах твоего setup1.bin
;DiskSliceSize=2100000000
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

;Source: {#Location}\{#GameName}\Rus\text\*;  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Rus\text
;Source: {#Location}\{#GameName}\Rus\sound\*;  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Rus\sound

Source: {#Location}\{#GameName}\Setting\*;  DestDir: "{userappdata}\{#GameName}"; Components: Rus;        Flags: ignoreversion recursesubdirs createallsubdirs 
Source: "{tmp}\text.zip";                   DestDir: "{tmp}";                     Components: Rus\text;   Flags: external deleteafterinstall; ExternalSize: 942295393
Source: "{tmp}\sound.zip";                  DestDir: "{tmp}";                     Components: Rus\sound;  Flags: external deleteafterinstall; ExternalSize: 1429153568

;Source: {#Location}\{#GameName}\zip\text\*;       DestDir: "{tmp}";      Flags: deleteafterinstall;Components: Rus\text
;Source: {#Location}\{#GameName}\zip\sound\*;       DestDir: "{tmp}";      Flags: deleteafterinstall;Components: Rus\sound


[Icons]
; Ярлык
Name: "{userprograms}\{#AppPublisher}\{#GameName}\{cm:ProgramOnTheWeb,{#ProductVerName}}"; Filename: "{#AppURL}"
; Ярлык
Name: "{userprograms}\{#AppPublisher}\{#GameName}\{cm:UninstallProgram,{#ProductVerName}}"; Filename: "{uninstallexe}"

[Run]
 ;На финальной страницу спрашивает о запуске финального продукта
;Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\{#Arciv} -y -o""{app}"""
Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\text.zip  -y -o""{app}\""";        Components: Rus\text;  
Filename: "{tmp}\{#UnArcivProg}"; Parameters: "x {tmp}\sound.zip  -y -o""{app}\""";        Components: Rus\sound; 
 
[UninstallDelete]
Type: files; 		  Name: "{app}\Readme_rus.rtf";                                  Components: Rus\text  
Type: filesandordirs; Name: "{app}\Content";      Components: Rus          
Type: filesandordirs; Name: "{app}\Builds";      Components: Rus\text          

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

//Downloader
var
  DownloadPage: TDownloadWizardPage;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Successfully downloaded file to {tmp}: %s', [FileName]));
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), SetupMessage(msgPreparingDesc), @OnDownloadProgress);
end;
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;// sha256 7z
  if IsComponentSelected('Rus\text') then begin
      DownloadPage.Add('https://github.com/Russifiers-for-Humans/BioShock-Russificier/releases/download/Final/text.zip', 'text.zip', 'f0d362c9b15b2233c0bc2de8d2b848fbc8a16fcf808936a5031c17d0cc83c472');
    end;
  if IsComponentSelected('Rus\sound') then begin
      DownloadPage.Add('https://github.com/Russifiers-for-Humans/BioShock-Russificier/releases/download/Final/sound.zip', 'sound.zip', '81a2e0683c548171cd542e9da1e2fcf3aed41bbe914818a038f82e94896ebf56');
  end;
    DownloadPage.Show;
    try
      try
        DownloadPage.Download; // This downloads the files to {tmp}
        Result := True;
      except
        if DownloadPage.AbortedByUser then
          Log('Aborted by user.')
        else
          SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end else
    Result := True;
end;

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl";