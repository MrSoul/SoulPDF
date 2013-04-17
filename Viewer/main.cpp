#include <QtGui/QApplication>
#include <QString>
#include "pdfviewer.h"
#include <QVBoxLayout>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    PdfViewer viewer;
    if (argc == 2)
        viewer.openFile(argv[1]);
   // else
        //window.openFile(":/files/bubbles.svg");
#if defined(Q_OS_SYMBIAN)
    viewer.showMaximized();
#else
    viewer.show();


#endif
    return app.exec();
}
