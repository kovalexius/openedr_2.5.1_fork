set BOOST_DIR=%CD%\..\..\eprj\boost

:: Перейти в буст директорию
pushd %BOOST_DIR%

:: Проверим наличие bjam.exe и b2.exe
:: Эти файлы генерируемые, ми их не храним в git'е!
:: bootstrap вызывается с аргументом "msvc : 14.3" для VisualStudio 2022
if not exist bjam.exe call bootstrap.exe msvc : 14.3

:: Собираем необходимые компоненты буста
bjam -a --variant=debug --width-date_time
::bjam -a --variant=release --toolset=msvc-14.2 address-model=64 --width-date_time --with-program_options link=static
::bjam -a --variant=release --toolset=msvc-14.2 address-model=32 --width-date_time --with-program_options link=static runtime-link=static


:: Перейти назад
popd