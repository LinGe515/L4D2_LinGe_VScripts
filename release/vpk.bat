@echo off
set main=..\vscripts
set output=vpk
set all=LinGe_VScripts
set all_name=LinGe VScripts 整合
set Base=Base
set Base_name=基础库
set vs[0]=HUD
set vs[1]=MoreSI
set vs[2]=Hint
set vs[3]=zs
set vs[4]=RewardHP
set name[0]=排行榜、伤害统计
set name[1]=多特控制
set name[2]=标记物资、队友倒地被控提示
set name[3]=自杀指令
set name[4]=击杀回血
set vpk="D:\Program Files (x86)\Steam\steamapps\common\Left 4 Dead 2\bin\vpk.exe"

rd /s /q %output%
mkdir %output%

:: 全套
mkdir %output%\%all%\scripts\vscripts\LinGe
copy %all%-addoninfo.txt %output%\%all%\addoninfo.txt
copy %all%-addonimage.jpg %output%\%all%\addonimage.jpg
xcopy %main%\LinGe %output%\%all%\scripts\vscripts\LinGe /E /I
copy %main%\director_base_addon.nut %output%\%all%\scripts\vscripts\director_base_addon.nut
copy %main%\scriptedmode_addon.nut %output%\%all%\scripts\vscripts\scriptedmode_addon.nut
%vpk% %output%\%all%
move %output%\%all%.vpk "%output%\%all_name%.vpk"

:: Base
mkdir %output%\%Base%\scripts\vscripts\LinGe
copy %Base%-addoninfo.txt %output%\%Base%\addoninfo.txt
copy %Base%-addonimage.jpg %output%\%Base%\addonimage.jpg
copy %main%\LinGe\Base.nut %output%\%Base%\scripts\vscripts\LinGe\Base.nut
copy %main%\LinGe\Loader.nut %output%\%Base%\scripts\vscripts\LinGe\Loader.nut
copy %main%\LinGe\VSLib.nut %output%\%Base%\scripts\vscripts\LinGe\VSLib.nut
xcopy %main%\LinGe\VSLib %output%\%Base%\scripts\vscripts\LinGe\VSLib /E /I
copy %main%\director_base_addon.nut %output%\%Base%\scripts\vscripts\director_base_addon.nut
copy %main%\scriptedmode_addon.nut %output%\%Base%\scripts\vscripts\scriptedmode_addon.nut
%vpk% %output%\%Base%
move %output%\%Base%.vpk "%output%\%Base_name% %Base%.vpk"

setlocal enabledelayedexpansion
:: 子项目
for /l %%i in (0,1,4) do (
	set obj=!vs[%%i]!
	set vpk_name=!name[%%i]!
	mkdir %output%\!obj!\scripts\vscripts\LinGe
	copy !obj!-addoninfo.txt		%output%\!obj!\addoninfo.txt
	copy !obj!-addonimage.jpg		%output%\!obj!\addonimage.jpg
	copy %main%\LinGe\!obj!.nut 	%output%\!obj!\scripts\vscripts\LinGe\!obj!.nut
	%vpk% %output%\!obj!
	move %output%\!obj!.vpk "%output%\!vpk_name! !obj!.vpk"
)

pause