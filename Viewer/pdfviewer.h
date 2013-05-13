#ifndef PDFVIEWER_H
#define PDFVIEWER_H
#include <QtGui>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "parseargs.h"
#include "gmem.h"
#include "GString.h"
#include "GlobalParams.h"
#include "Object.h"
#include "PDFDoc.h"
#include <splash/SplashBitmap.h>
#include "splash/Splash.h"
#include "SplashOutputDev.h"
#include "config.h"
#include "QWheelEvent"
#include <QGraphicsItem>
#include <QtAlgorithms>
#include "scrollarea.h"
#include "graphicspixmapitem.h"


class PdfViewer : public QMainWindow
{
    Q_OBJECT
    
public:
    PdfViewer();
    ~PdfViewer();
    void loadDocument(const QString &file);

public slots:
    void openFile(const QString &path = QString());
    void zoomIn();
    void zoomOut();
    void nextPage();
    void prevPage();
    void fitToWindow();
    void normalSize();
    void zoomComboBoxChanged(int cbindex);
    void renderCurrentPage();
    void setCurrentPage(int page);
    void thumbnailSelected();
    void closeDocument();
private:
    void disableActs();
    void scaleImage(double factor);
    void updateActions();
    void createActions();
    void createMenus();
    void createToolbars();
    void createStatusBar();
    void createComboBoxes();
    void populateScene();
    void adjustScrollBar(QScrollBar *scrollBar, double factor);
    QImage renderPage(int pageNumber);

    GString *ownerPW, *userPW;
    PDFDoc *m_doc;                      // Текущий документ
    SplashOutputDev *m_out;             // OutputDevice для рендеринга.
                                         // Сцена для иконок страниц
    QString m_currentPath;              // Текущий путь
    int m_currentPage;                  // Current page number
    int m_pageCount;                    // Число страниц
    double scaleFactor;

    QComboBox *m_zoomComboBox;
    QSpinBox *m_pageSpinBox;
    QGraphicsScene *m_scene;

    ScrollArea *m_scrollArea;
    QGraphicsView *m_view;

    QLabel *m_imgLabel;
    QSplitter *m_vSplitter;

    QToolBar *fileToolBar;
    QToolBar *NavigateToolBar;
    QAction *openAct;
    QAction *closeAct;
    QAction *nextPageAct;
    QAction *prevPageAct;
    QAction *exitAct;
    QAction *zoomInAct;
    QAction *zoomOutAct;
    QAction *normalSizeAct;
    QAction *fitToWindowAct;
    QString m_file;
    QSignalMapper *m_mapper;
    QMenu *fileMenu;
    QMenu *viewMenu;
   };

#endif // PDFVIEWER_H
