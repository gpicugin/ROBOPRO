QT += testlib
QT += core
QT += gui
QT += qml quick
CONFIG += C++17
SOURCES += \
        src/main.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DEFINES += QT_QML_DEBUG_NO_WARNING

QMAKE_POST_LINK += windeployqt.exe --qmldir $$QML_DIR $$DESTDIR/Demo.exe

DISTFILES += \
    qml/StyleSettings/StyleSettings.qml \
    qml/main.qml
