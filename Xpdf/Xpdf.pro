#-------------------------------------------------
#
# Project created by QtCreator 2012-08-10T17:35:12
#
#-------------------------------------------------
QT       -= core gui
TARGET = Xpdf
TEMPLATE = lib
CONFIG += staticlib
SOURCES += \
    goo/FixedPoint.cc \
    goo/gfile.cc \
    goo/GHash.cc \
    goo/GList.cc \
    goo/gmem.cc \
    goo/gmempp.cc \
    goo/GString.cc \
    goo/parseargs.c \
    fofi/FoFiBase.cc \
    fofi/FoFiEncodings.cc \
    fofi/FoFiIdentifier.cc \
    fofi/FoFiTrueType.cc \
    fofi/FoFiType1.cc \
    fofi/FoFiType1C.cc \
    splash/Splash.cc \
    splash/SplashBitmap.cc \
    splash/SplashClip.cc \
    splash/SplashFont.cc \
    splash/SplashFontEngine.cc \
    splash/SplashFontFile.cc \
    splash/SplashFontFileID.cc \
    splash/SplashFTFont.cc \
    splash/SplashFTFontEngine.cc \
    splash/SplashFTFontFile.cc \
    splash/SplashPath.cc \
    splash/SplashPattern.cc \
    splash/SplashScreen.cc \
    splash/SplashState.cc \
    splash/SplashT1Font.cc \
    splash/SplashT1FontEngine.cc \
    splash/SplashT1FontFile.cc \
    splash/SplashXPath.cc \
    splash/SplashXPathScanner.cc \
    xpdf/Annot.cc \
    xpdf/Array.cc \
    xpdf/BuiltinFont.cc \
    xpdf/BuiltinFontTables.cc \
    xpdf/Catalog.cc \
    xpdf/CharCodeToUnicode.cc \
    xpdf/CMap.cc \
    xpdf/CoreOutputDev.cc \
    xpdf/Decrypt.cc \
    xpdf/Dict.cc \
    xpdf/Error.cc \
    xpdf/FontEncodingTables.cc \
    xpdf/Function.cc \
    xpdf/Gfx.cc \
    xpdf/GfxFont.cc \
    xpdf/GfxState.cc \
    xpdf/GlobalParams.cc \
    xpdf/ImageOutputDev.cc \
    xpdf/JArithmeticDecoder.cc \
    xpdf/JBIG2Stream.cc \
    xpdf/JPXStream.cc \
    xpdf/Lexer.cc \
    xpdf/Link.cc \
    xpdf/NameToCharCode.cc \
    xpdf/Object.cc \
    xpdf/OptionalContent.cc \
    xpdf/Outline.cc \
    xpdf/OutputDev.cc \
    xpdf/Page.cc \
    xpdf/Parser.cc \
    xpdf/PDFCore.cc \
    xpdf/PDFDoc.cc \
    xpdf/PDFDocEncoding.cc \
    xpdf/PreScanOutputDev.cc \
    xpdf/PSOutputDev.cc \
    xpdf/PSTokenizer.cc \
    xpdf/SecurityHandler.cc \
    xpdf/SplashOutputDev.cc \
    xpdf/Stream.cc \
    xpdf/TextOutputDev.cc \
    xpdf/UnicodeMap.cc \
    xpdf/UnicodeTypeTable.cc \
    xpdf/XRef.cc
HEADERS += \
    aconf.h \
    aconf2.h \
    goo/FixedPoint.h \
    goo/gfile.h \
    goo/GHash.h \
    goo/GList.h \
    goo/gmem.h \
    goo/GMutex.h \
    goo/GString.h \
    goo/gtypes.h \
    goo/parseargs.h \
    splash/Splash.h \
    splash/SplashBitmap.h \
    splash/SplashClip.h \
    splash/SplashErrorCodes.h \
    splash/SplashFont.h \
    splash/SplashFontEngine.h \
    splash/SplashFontFile.h \
    splash/SplashFontFileID.h \
    splash/SplashFTFont.h \
    splash/SplashFTFontEngine.h \
    splash/SplashFTFontFile.h \
    splash/SplashGlyphBitmap.h \
    splash/SplashMath.h \
    splash/SplashPath.h \
    splash/SplashPattern.h \
    splash/SplashScreen.h \
    splash/SplashState.h \
    splash/SplashT1Font.h \
    splash/SplashT1FontEngine.h \
    splash/SplashT1FontFile.h \
    splash/SplashTypes.h \
    splash/SplashXPath.h \
    splash/SplashXPathScanner.h \
    fofi/FoFiBase.h \
    fofi/FoFiEncodings.h \
    fofi/FoFiIdentifier.h \
    fofi/FoFiTrueType.h \
    fofi/FoFiType1.h \
    fofi/FoFiType1C.h \
    xpdf/about-text.h \
    xpdf/Annot.h \
    xpdf/Array.h \
    xpdf/BuiltinFont.h \
    xpdf/BuiltinFontTables.h \
    xpdf/Catalog.h \
    xpdf/CharCodeToUnicode.h \
    xpdf/CharTypes.h \
    xpdf/CMap.h \
    xpdf/CompactFontTables.h \
    xpdf/config.h \
    xpdf/CoreOutputDev.h \
    xpdf/Decrypt.h \
    xpdf/Dict.h \
    xpdf/Error.h \
    xpdf/ErrorCodes.h \
    xpdf/FontEncodingTables.h \
    xpdf/Function.h \
    xpdf/Gfx.h \
    xpdf/GfxFont.h \
    xpdf/GfxState.h \
    xpdf/GlobalParams.h \
    xpdf/ImageOutputDev.h \
    xpdf/JArithmeticDecoder.h \
    xpdf/JBIG2Stream.h \
    xpdf/JPXStream.h \
    xpdf/Lexer.h \
    xpdf/Link.h \
    xpdf/NameToCharCode.h \
    xpdf/NameToUnicodeTable.h \
    xpdf/Object.h \
    xpdf/OptionalContent.h \
    xpdf/Outline.h \
    xpdf/OutputDev.h \
    xpdf/Page.h \
    xpdf/Parser.h \
    xpdf/PDFCore.h \
    xpdf/PDFDoc.h \
    xpdf/PDFDocEncoding.h \
    xpdf/PreScanOutputDev.h \
    xpdf/PSOutputDev.h \
    xpdf/PSTokenizer.h \
    xpdf/SecurityHandler.h \
    xpdf/SplashOutputDev.h \
    xpdf/Stream.h \
    xpdf/Stream-CCITT.h \
    xpdf/TextOutputDev.h \
    xpdf/UnicodeMap.h \
    xpdf/UnicodeMapTables.h \
    xpdf/UnicodeTypeTable.h \
    xpdf/UTF8.h \
    xpdf/XRef.h
unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
INCLUDEPATH += $$PWD/../Xpdf/goo $$PWD/../Xpdf/fofi $$PWD/../Xpdf/splash $$PWD/../Xpdf/xpdf

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Freetype/release/ -lfreetype2
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../Freetype/debug/ -lfreetype2
else:unix:!macx:!symbian: LIBS += -L$$PWD/../Freetype/ -lfreetype2

INCLUDEPATH += $$PWD/../Freetype/inc
DEPENDPATH += $$PWD/../Freetype/inc

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../Freetype/release/freetype2.lib
else:win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../Freetype/debug/freetype2.lib
else:unix:!macx:!symbian: PRE_TARGETDEPS += $$PWD/../Freetype/libfreetype2.a
