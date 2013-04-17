#-------------------------------------------------
#
# Project created by QtCreator 2012-08-10T21:55:16
#
#-------------------------------------------------

QT       += core gui
CONFIG += static
TARGET = Viewer
TEMPLATE = app
RESOURCES += \
    Resource.qrc

SOURCES += main.cpp\
           pdfviewer.cpp \
    scrollarea.cpp \
    graphicspixmapitem.cpp

HEADERS  += \
    pdfviewer.h \
    scrollarea.h \
    graphicspixmapitem.h


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Xpdf/release/ -lXpdf
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../Xpdf/debug/ -lXpdf
else:symbian: LIBS += -lXpdf
else:unix: LIBS += -L$$PWD/../Xpdf/ -lXpdf

INCLUDEPATH += $$PWD/../Xpdf
DEPENDPATH += $$PWD/../Xpdf

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../Xpdf/release/Xpdf.lib
else:win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../Xpdf/debug/Xpdf.lib
else:unix:!symbian: PRE_TARGETDEPS += $$PWD/../Xpdf/libXpdf.a



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Freetype/release/ -lfreetype2
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../Freetype/debug/ -lfreetype2
else:unix:!macx:!symbian: LIBS += -L$$PWD/../Freetype/ -lfreetype2

INCLUDEPATH += $$PWD/../Freetype/inc
DEPENDPATH += $$PWD/../Freetype/inc

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../Freetype/release/freetype2.lib
else:win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../Freetype/debug/freetype2.lib
else:unix:!macx:!symbian: PRE_TARGETDEPS += $$PWD/../Freetype/libfreetype2.a

INCLUDEPATH += $$PWD/../Xpdf/goo $$PWD/../Xpdf/fofi $$PWD/../Xpdf/splash $$PWD/../Xpdf/xpdf
