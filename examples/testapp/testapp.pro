TEMPLATE = app
TARGET = 

include( ../../installerbuilder/libinstaller/libinstaller.pri )
LIBS = -L$$OUT_PWD/../../installerbuilder/lib -linstaller $$LIBS

DESTDIR = packages/com.nokia.testapp/data

QT += script network xml sql
CONFIG += uitools help
QTPLUGIN += qsqlite

# Input
FORMS += componentselectiondialog.ui
HEADERS += mainwindow.h componentselectiondialog.h
SOURCES += main.cpp mainwindow.cpp componentselectiondialog.cpp
RESOURCES += testapp.qrc

macx:QMAKE_POST_LINK = ($$OUT_PWD/../../installerbuilder/bin/binarycreator -p packages -c config -t ../../installerbuilder/bin/installerbase TestAppInstaller.app com.nokia.testapp)
win32:QMAKE_POST_LINK = ($$OUT_PWD\\..\\..\\installerbuilder\\bin\\binarycreator.exe -p $$PWD\\packages -c $$PWD\\config -t $$OUT_PWD\\..\\..\\installerbuilder\\bin\\installerbase.exe TestAppInstaller.exe com.nokia.testapp)
