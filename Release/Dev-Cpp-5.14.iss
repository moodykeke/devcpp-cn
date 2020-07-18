; Dev-C++安装脚本（可使用 Inno Setup 进行编辑和打包处理）

[Setup]
; 注: AppId的值为单独标识该应用程序。不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|生成GUID。)
;其它内容可在 Inno Setup 安装目录下的 Default.isl 中设置。
AppId={{EED0431C-249C-4C72-8D3D-E92F3C8F4324}}
AppName=Dev-C++
AppVerName=Dev-C++ 5.14 TDM-GCC 9.2.0
AppPublisher= BanzhuSoft
AppPublisherURL= https://banzhusoft.github.io/devcpp-cn/
AppSupportURL=
AppUpdatesURL=
PrivilegesRequired=admin
DefaultDirName={commonpf}\Dev-Cpp
DefaultGroupName=Dev-C++
DisableProgramGroupPage=yes
InfoBeforeFile  = Readme.txt
LicenseFile = GPLv2.txt 
OutputDir= Setup-output
OutputBaseFilename=Dev-Cpp-5.14    
Compression=lzma
SolidCompression=no
SetupIconFile=devcpp.ico

LanguageDetectionMethod=uilanguage
ShowLanguageDialog=yes

[Languages]
;要设置 inno setup 的 default.isl 中的参数（例如字体和字号）
Name: "english"; MessagesFile: "compiler:Default.isl"; InfoBeforeFile: "Readme.txt"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimp.isl"; InfoBeforeFile: "Readme-cn.txt"
Name: "ChineseTrad"; MessagesFile: "compiler:Languages\ChineseTrad.isl"; InfoBeforeFile: "Readme-cn.txt"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
;Name: "Korea"; MessagesFile: "compiler:Languages\Korea.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"; LicenseFile:GPLv2.txt; InfoBeforeFile: "Readme.txt"

[Dirs]
name: "{app}\AStyle"; Permissions: authusers-full

[Files]
Source: "*.iss"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.manifest"; DestDir: "{app}"; Flags: ignoreversion

Source: "AStyle\*.*"; DestDir: "{app}\AStyle"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "Help\*.*"; DestDir: "{app}\Help"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Lang\*.*"; DestDir: "{app}\Lang"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "TDM-GCC-64\*.*"; DestDir: "{app}\TDM-GCC-64"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Templates\*.*"; DestDir: "{app}\Templates"; Flags: ignoreversion recursesubdirs createallsubdirs

;额外添加的示例和说明文件
Source: "Examples\*.*"; DestDir: "{app}\Examples"; Flags: ignoreversion recursesubdirs createallsubdirs
;注意：所发行的 DevCpp.ini 文件中需要把语言文件设为空白，以便首次运行时自动检测。
Source: "ini\*.*"; DestDir: "{app}\ini"; Flags: ignoreversion recursesubdirs createallsubdirsSource: "Icons\*.*"; DestDir: "{app}\Icons"; Flags: ignoreversion recursesubdirs createallsubdirs

;参数文件。默认位置：c:\Users\Administrator\AppData\Roaming\Dev-Cpp\
Source: "ini\codeinsertion.ini"; DestDir: "{userappdata}\Dev-Cpp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ini\defaultcode.ini"; DestDir: "{userappdata}\Dev-Cpp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ini\devcpp.ini"; DestDir: "{userappdata}\Dev-Cpp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ini\tools.ini"; DestDir: "{userappdata}\Dev-Cpp"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

[UninstallDelete]
;该目录下可能有额外的文件，卸载时应该删除。
Type: filesandordirs; Name: "{app}\AStyle"
Type: filesandordirs; Name: "{userappdata}\Dev-Cpp" 

[CustomMessages]
english.whatsnew = What's new
chinesesimp.whatsnew = 更新说明
ChineseTrad.whatsnew = 更新說明
french.whatsnew = What's new
german.whatsnew = What's new
italian.whatsnew = What's new
japanese.whatsnew = What's new
;Korea.whatsnew = What's new
spanish.whatsnew = What's new
russian.whatsnew = What's new

english.uninstall = Uninstall
chinesesimp.uninstall = 卸载
ChineseTrad.uninstall = 卸載
french.uninstall = Désinstaller
german.uninstall = Deinstallieren
italian.uninstall = Disinstallare
japanese.uninstall = アンインストール
;Korea.whatsnew = Uninstall
spanish.uninstall = Desinstalar
russian.uninstall = Удалить

;english.project = Project
;chinesesimp.project = 项目
;ChineseTrad.project = 專案
;french.project = Project
;german.project = Project
;italian.project = Project
;japanese.project = Project
;spanish.project = Project
;russian.project = Project

;english.source = Source file
;chinesesimp.source = 源文件
;ChineseTrad.source = 原始檔案
;french.source = Source file
;german.source = Source file
;italian.source = Source file
;japanese.source = Source file
;spanish.source = Source file
;russian.source = Source file

;english.header = Head file
;chinesesimp.header = 头文件
;ChineseTrad.header = 頭檔
;french.header = Head file
;german.header = Head file
;italian.header = Head file
;japanese.header = Head file
;spanish.header = Head file
;russian.header = Head file

english.runnow = Run Dev-C++ now
chinesesimp.runnow = 现在就运行 Dev-C++
ChineseTrad.runnow = 現在就運行 Dev-C++
french.runnow = Exécutez Dev-C++ maintenant
german.runnow = Führen Sie jetzt Dev-C++ aus
italian.runnow = Esegui Dev-C++ ora
japanese.runnow = 今すぐ Dev-C++ を実行する
;Korea.runnow = Run Dev-C++ now
spanish.runnow = Ejecute Dev-C++ ahora
russian.runnow = Запустите Dev-C++ сейчас

[Registry]
;下面这个键可能要覆盖原有的设置，建议事先备份，等卸载程序时再恢复原样
;Root: HKCR; Subkey: ".dev"; ValueType: String; ValueData: "Dev-C++ {cm:project}"
;Root: HKCR; Subkey: ".c"; ValueType: String; ValueData: "C {cm:source}"
;Root: HKCR; Subkey: ".cpp"; ValueType: String; ValueData: "C++ {cm:source}"
;Root: HKCR; Subkey: ".h"; ValueType: String; ValueData: "C {cm:header}"
;Root: HKCR; Subkey: ".hpp"; ValueType: String; ValueData: "C++ {cm:header}"

;设置图标
;Root: HKCR; Subkey: "Dev-C++ {cm:project}\DefaultIcon"; ValueType: String; ValueData: "{app}\DevCpp.exe, 3"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C {cm:source}\DefaultIcon"; ValueType: String; ValueData: "{app}\DevCpp.exe, 4"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C++ {cm:source}\DefaultIcon"; ValueType: String; ValueData: "{app}\DevCpp.exe, 5"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C {cm:header}\DefaultIcon"; ValueType: String; ValueData: "{app}\DevCpp.exe, 6"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C++ {cm:header}\DefaultIcon"; ValueType: String; ValueData: "{app}\DevCpp.exe, 7"; Flags: uninsdeletekey

;设置双击时用什么程序打开
;Root: HKCR; Subkey: "Dev-C++ {cm:project}\shell\open\command"; ValueType: String; ValueData: "{app}\DevCpp.exe ""%1"""; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C {cm:source}\shell\open\command"; ValueType: String; ValueData: "{app}\DevCpp.exe ""%1"""; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C++ {cm:source}\shell\open\command"; ValueType: String; ValueData: "{app}\DevCpp.exe ""%1"""; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C {cm:header}\shell\open\command"; ValueType: String; ValueData: "{app}\DevCpp.exe ""%1"""; Flags: uninsdeletekey
;Root: HKCR; Subkey: "C++ {cm:header}\shell\open\command"; ValueType: String; ValueData: "{app}\DevCpp.exe ""%1"""; Flags: uninsdeletekey
 
;设置右键菜单项
;Root: HKCR; Subkey: "C++ 源文件\shell\用 Dev-C++ 打开(O)\command"; ValueType: String; ValueData: "{app}\DevCpp.exe %1"; Flags: uninsdeletekey

[Icons]
Name: "{commondesktop}\Dev-C++"; Filename: "{app}\DevCpp.exe"
Name: "{group}\Dev-C++"; Filename: "{app}\DevCpp.exe"
Name: "{group}\{cm:whatsnew}"; Filename: "{app}\whatsnew-cn.txt"
Name: "{group}\{cm:uninstall} Dev-C++"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\DevCpp.exe"; Description: {cm:runnow}; Flags: nowait postinstall skipifsilent





