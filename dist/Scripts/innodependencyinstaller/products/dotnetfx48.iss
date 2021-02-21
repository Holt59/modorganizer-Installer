; requires Windows 10, Windows 7 Service Pack 1, Windows 8.1, Windows Server 2008 R2 SP1, Windows Server 2012, Windows Server 2012 R2, Windows Server 2016
; WARNING: express setup (downloads and installs the components depending on your OS) if you want to deploy it on cd or network download the full bootsrapper on website below
; https://www.microsoft.com/en-US/download/details.aspx?id=55170

[CustomMessages]
dotnetfx48_title=.NET Framework 4.8

dotnetfx48_size=1 MB - 59 MB

[Code]
const
	dotnetfx48_url = 'http://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/1f81f3962f75eff5d83a60abd3a3ec7b/ndp48-web.exe';

procedure dotnetfx48(minVersion: integer);
begin
	if (not netfxinstalled(NetFx4x, '') or (netfxspversion(NetFx4x, '') < minVersion)) then
		AddProduct('dotnetfx48.exe',
			'/lcid ' + CustomMessage('lcid') + ' /passive /norestart',
			CustomMessage('dotnetfx48_title'),
			CustomMessage('dotnetfx48_size'),
			dotnetfx48_url,
			false, false, false);
end;

[Setup]
