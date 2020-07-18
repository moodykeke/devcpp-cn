program Packman;

uses
  Forms,
  InstallWizards in 'InstallWizards.pas' {InstallWizard},
  InstallFiles in 'InstallFiles.pas',
  Installers in 'Installers.pas',
  Main in 'Main.pas' {MainForm},
  PackmanUtils in 'PackmanUtils.pas',
  RemoveForms in 'RemoveForms.pas' {RemoveForm},
  VerifyForms in 'VerifyForms.pas' {VerifyForm},
  DetailsForms in 'DetailsForms.pas' {DetailsForm},
  AboutForms in 'AboutForms.pas' {AboutForm},
  LibTar in 'LibTar.pas',
  ExtractionProgressDialog in 'ExtractionProgressDialog.pas' {ExtractionProgress},
  PackmanExitCodesU in 'PackmanExitCodesU.pas',
  ExceptionsAnalyzer in 'ExceptionsAnalyzer.pas' {frmExceptionsAnalyzer},
  UNZIP in 'unzip\UNZIP.PAS',
  ZIPTYPES in 'unzip\ZIPTYPES.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Package Manager';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
