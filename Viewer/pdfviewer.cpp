#include <QMainWindow>
#include "pdfviewer.h"
#include <QtGui>

PdfViewer::PdfViewer()
    :m_currentPage(1)
    ,m_pageCount(0)
    ,scaleFactor(1.0)
    ,m_doc(0)
    ,userPW(0)
    ,ownerPW(0)
{
// SplashDev init
    globalParams = new GlobalParams("");
    globalParams->setupBaseFonts(NULL);
    globalParams->setEnableT1lib("yes");
    globalParams->setEnableFreeType("yes");
    globalParams->setAntialias("yes");
    globalParams->setVectorAntialias("yes");
    globalParams->setErrQuiet(gTrue);
    SplashColor paperColor;
    paperColor[0] = paperColor[1] = paperColor[2] = 0xff;
    m_out = new SplashOutputDev(splashModeRGB8,4,gFalse,paperColor);
    m_mapper = new QSignalMapper(this);

//Setup Central Widget

    m_scene = new QGraphicsScene;
    m_view = new QGraphicsView;
    m_view->setBackgroundBrush(Qt::gray);
    m_view->setScene(m_scene);
    m_view->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Ignored);

    m_view->setDragMode(QGraphicsView::ScrollHandDrag);
   // m_view->setDragMode(QGraphicsView::NoDrag);

    m_view->setInteractive(true);

    m_imgLabel = new QLabel;
    m_imgLabel->setSizePolicy(QSizePolicy::Ignored,QSizePolicy::Ignored);
    m_imgLabel->setScaledContents(true);

    m_scrollArea = new ScrollArea;
    m_scrollArea->setBackgroundRole(QPalette::Dark);
    m_scrollArea->setAlignment(Qt::AlignCenter);
    m_scrollArea->setWidget(m_imgLabel);

    QList<int> sizes;
    sizes << 175 << 100 << 100;
    m_vSplitter = new QSplitter;                    //Потом добавляем разделитель
    m_vSplitter->setOrientation(Qt::Horizontal);    //Виджеты на него добавятся слева направо
    m_vSplitter->addWidget(m_view);                 //слева будет сцена с превьюшками
    m_vSplitter->addWidget(m_scrollArea);           //Справа будет отображение выбранной страницы
    m_vSplitter->setStretchFactor(0,0);
    m_vSplitter->setStretchFactor(1,1);
    m_vSplitter->setSizes(sizes);

    //QWidget *mainWidget = new QWidget(this);     -это старый вариант с Layout_ом, слишком избыточен в данном случае,
    //QHBoxLayout *layout = new QHBoxLayout;        но он более верен если понадобиться усложнить оформление.
    //layout->addWidget(m_vSplitter);
    //layout->setContentsMargins(0, 0, 0, 0);
    //mainWidget->setLayout(layout);

    //setCentralWidget(mainWidget);

    setCentralWidget(m_vSplitter);
    createComboBoxes();
    createActions();
    createMenus();
    createToolbars();
    createStatusBar();
    setWindowTitle(tr("MyXPDF Viewer"));
    resize(600, 500);
}
PdfViewer::~PdfViewer()
{
closeDocument();
}
void PdfViewer::closeDocument()
{
   // qDeleteAll( m_scene->items() );
    m_scene->clear();
    m_imgLabel->clear();
    m_currentPage=1;
    m_pageCount=0;
    disableActs();
    //delete ownerPW;
    //delete userPW;
    if(m_doc!=0)m_doc->~PDFDoc();
    // delete m_imgLabel;
}
void PdfViewer::openFile(const QString &path)
{
    QString fileName;
    if (path.isNull())
        fileName = QFileDialog::getOpenFileName(this, tr("Open PDF File"),
                m_currentPath, "PDF files (*.pdf )");
    else
        fileName = path;


    if (!fileName.isEmpty()) {
        QFile file(fileName);
        if (!file.exists()) {
            QMessageBox::critical(this, tr("Open PDF File"),
                           QString("Could not open file '%1'.").arg(fileName));
            }

        loadDocument(fileName);
        m_imgLabel->setPixmap(QPixmap::fromImage(renderPage(m_currentPage)));
        populateScene();
        m_vSplitter->adjustSize();
        fitToWindowAct->setEnabled(true);
        updateActions();
        if (!fitToWindowAct->isChecked())
            m_imgLabel->adjustSize();
        setWindowTitle(fileName + " - MyXPDF");

       return;
    }



}
void PdfViewer::loadDocument(const QString &fileName)
{
    ownerPW = new GString;
    ownerPW = NULL;
    userPW = new GString;
    userPW = NULL;
    m_doc = new PDFDoc(new GString(QFile::encodeName(fileName)),ownerPW,userPW);
    m_pageCount=m_doc->getNumPages();
    m_scrollArea->setDocLoaded(true);
    // дальше должна идти разблокировка менюшек
}
void PdfViewer::createActions()
{
    openAct = new QAction(QIcon(":/images/open.png"), tr("&Open..."), this);
    openAct->setShortcuts(QKeySequence::Open);
    openAct->setStatusTip(tr("Open an existing file"));
    connect(openAct, SIGNAL(triggered()), this, SLOT(openFile()));

    closeAct = new QAction(QIcon(":/images/window-close.png"),tr("&Close"),this);
    closeAct->setStatusTip(tr("Close document"));
    connect(closeAct,SIGNAL(triggered()),this,SLOT(closeDocument()));

    exitAct = new QAction(QIcon(":/images/exit.png"), tr("&Exit"),this);
    exitAct->setStatusTip(tr("Close program"));
    connect(exitAct, SIGNAL(triggered()), this, SLOT(close()));

    zoomInAct =new QAction(QIcon(":/images/zoom-in.png"), tr("&Zoom In"),this);
    zoomInAct->setStatusTip(tr("Zooming in current page"));
    zoomInAct->setEnabled(false);
    connect(zoomInAct,SIGNAL(triggered()),this,SLOT(zoomIn()));

    zoomOutAct =new QAction(QIcon(":/images/zoom-out.png"), tr("&Zoom Out"),this);
    zoomOutAct->setStatusTip(tr("Zooming Out current page"));
    zoomOutAct->setEnabled(false);
    connect(zoomOutAct,SIGNAL(triggered()),this,SLOT(zoomOut()));

    connect(m_scrollArea,SIGNAL(scrollWheel(int)),this,SLOT(zoomComboBoxChanged(int)));

    fitToWindowAct = new QAction(tr("&Fit to Window"), this);
    fitToWindowAct->setEnabled(false);
    fitToWindowAct->setCheckable(true);
    fitToWindowAct->setShortcut(tr("Ctrl+F"));
    connect(fitToWindowAct, SIGNAL(triggered()), this, SLOT(fitToWindow()));

    normalSizeAct = new QAction(tr("&Normal Size"), this);
    normalSizeAct->setShortcut(tr("Ctrl+S"));
    normalSizeAct->setEnabled(false);
    connect(normalSizeAct, SIGNAL(triggered()), this, SLOT(normalSize()));

    connect(m_pageSpinBox,SIGNAL(valueChanged(int)),this,SLOT(setCurrentPage(int)));

    nextPageAct = new QAction(QIcon(":/images/go-next.png"),tr("Next Page"), this);
    nextPageAct->setEnabled(false);
    connect(nextPageAct,SIGNAL(triggered()),this,SLOT(nextPage()));

    prevPageAct = new QAction(QIcon(":/images/go-previous.png"), tr("&Previous Page"),this);
    prevPageAct->setEnabled(false);
    connect(prevPageAct,SIGNAL(triggered()),this,SLOT(prevPage()));
}
void PdfViewer::createMenus()
{
    fileMenu = new QMenu(tr("&File"), this);
    fileMenu->addAction(openAct);
    fileMenu->addSeparator();
    fileMenu->addAction(exitAct);

    viewMenu = new QMenu(tr("&View"), this);
    viewMenu->addSeparator();
    viewMenu->addAction(fitToWindowAct);

    menuBar()->addMenu(fileMenu);
    menuBar()->addMenu(viewMenu);
    }
void PdfViewer::createToolbars(){
    fileToolBar = addToolBar(tr("File"));
    fileToolBar->addAction(openAct);
    fileToolBar->addAction(closeAct);
    fileToolBar->addAction(exitAct);
    NavigateToolBar = addToolBar(tr("Navigate"));

    NavigateToolBar->addAction(prevPageAct);
    NavigateToolBar->addWidget(m_pageSpinBox);
    NavigateToolBar->addAction(nextPageAct);
    NavigateToolBar->addSeparator();
    NavigateToolBar->addAction(zoomInAct);
    NavigateToolBar->addWidget(m_zoomComboBox);
    NavigateToolBar->addAction(zoomOutAct);

}
void PdfViewer::createStatusBar()
{
    statusBar()->showMessage(tr("Ready"));
}
QImage PdfViewer::renderPage(int pageNumber)
{

    m_out->startDoc(m_doc->getXRef());
    m_doc->displayPageSlice(m_out,pageNumber,72.0*scaleFactor,72.0*scaleFactor,0,gFalse,gTrue,gFalse,-1,-1,-1,-1);
    SplashBitmap *bitmap = m_out->getBitmap();
    int bw = bitmap->getWidth();
    int bh = bitmap->getHeight();

    QImage * tmpimg = new QImage( bw, bh, QImage::Format_RGB32 );
    SplashColorPtr pixel = new Guchar[4];
    for (int i = 0; i < bw; i++) {
        for (int j = 0; j < bh; j++) {
          m_out->getBitmap()->getPixel(i, j, pixel);
          tmpimg->setPixel( i, j, qRgb( pixel[0], pixel[1], pixel[2] ) );
        }
      }
     delete[] pixel;



          QImage img = tmpimg->copy();

          /*
          FILE *picfile;
          picfile = fopen("Breakpoint.ppm","w");
          bitmap->writePNMFile(picfile);
          fclose(picfile);
*/
             return img;
}
void PdfViewer::zoomIn()
{
int temp =  m_zoomComboBox->currentIndex();
    if (temp<8 && temp>=0)
        m_zoomComboBox->setCurrentIndex(temp+1);
}
void PdfViewer::zoomOut()
{int temp =  m_zoomComboBox->currentIndex();
    if (temp<=8 && temp>0)
    m_zoomComboBox->setCurrentIndex(temp-1);
}
void PdfViewer::scaleImage(double factor)
{
    if(m_imgLabel->pixmap()) {
    Q_ASSERT(m_imgLabel->pixmap());
    scaleFactor *= factor;
    renderCurrentPage();
    m_imgLabel->resize(1.0 * m_imgLabel->pixmap()->size());
    adjustScrollBar(m_scrollArea->horizontalScrollBar(), factor);
    adjustScrollBar(m_scrollArea->verticalScrollBar(), factor);
    };
}
void PdfViewer::adjustScrollBar(QScrollBar *scrollBar, double factor)
{
    scrollBar->setValue(int(factor * scrollBar->value()
                            + ((factor - 1) * scrollBar->pageStep()/2)));
}
void PdfViewer::updateActions()
{
    zoomInAct->setEnabled(!fitToWindowAct->isChecked());
    zoomOutAct->setEnabled(!fitToWindowAct->isChecked());
    nextPageAct->setEnabled(true);
    m_zoomComboBox->setEnabled(true);
    m_pageSpinBox->setMaximum(m_pageCount);
    m_pageSpinBox->setMinimum(1);
    m_pageSpinBox->setEnabled(true);
 //   normalSizeAct->setEnabled(!fitToWindowAct->isChecked());

}
void PdfViewer::fitToWindow()
{
    bool fitToWindow = fitToWindowAct->isChecked();
    m_scrollArea->setWidgetResizable(fitToWindow);
    if (!fitToWindow) {
        normalSize();
    }
    updateActions();
}
void PdfViewer::normalSize()
{
    m_imgLabel->adjustSize();
    scaleFactor = 1.0;
}
void PdfViewer::createComboBoxes()
{
    m_zoomComboBox = new QComboBox;
    m_zoomComboBox->addItem(tr("12.5%"));
    m_zoomComboBox->addItem(tr("25%"));
    m_zoomComboBox->addItem(tr("50%"));
    m_zoomComboBox->addItem(tr("75%"));
    m_zoomComboBox->addItem(tr("100%"));
    m_zoomComboBox->addItem(tr("125%"));
    m_zoomComboBox->addItem(tr("150%"));
    m_zoomComboBox->addItem(tr("175%"));
    m_zoomComboBox->addItem(tr("200%"));
    m_zoomComboBox->setEditable(false);
    m_zoomComboBox->setCurrentIndex(4);
    m_zoomComboBox->setDisabled(true);
    connect(m_zoomComboBox,SIGNAL(currentIndexChanged(int)),this,SLOT(zoomComboBoxChanged(int)));

    m_pageSpinBox = new QSpinBox;
    m_pageSpinBox->setDisabled(true);
}
void PdfViewer::zoomComboBoxChanged(int cbindex)
{
    double temp =scaleFactor;
    scaleFactor=1.0;
    switch(cbindex)
    {
    case 0:
        scaleImage(0.125);
        break;
    case 1:
        scaleImage(0.25);
        break;
    case 2:
        scaleImage(0.5);
        break;
    case 3:
        scaleImage(0.75);
        break;
    case 4:
        scaleImage(1.0);
        break;
    case 5:
        scaleImage(1.25);
        break;
    case 6:
        scaleImage(1.5);
        break;
    case 7:
        scaleImage(1.75);
        break;
    case 8:
        scaleImage(2.0);
        break;
    case 9:
        scaleFactor = temp;
        scaleImage(1.05);
        break;
    case -2:
        scaleFactor = temp;
        scaleImage(0.95);

    };
}
void PdfViewer::nextPage()
{
    if(m_currentPage<m_pageCount)
    {
        prevPageAct->setEnabled(true);
        m_pageSpinBox->setValue(m_currentPage+1);
    };
}
void PdfViewer::prevPage()
{
    if(m_currentPage>1)
    {
        nextPageAct->setEnabled(true);
        m_pageSpinBox->setValue(m_currentPage-1);
    };
}
void PdfViewer::renderCurrentPage()
{
    m_imgLabel->setPixmap(QPixmap::fromImage(renderPage(m_currentPage)));
    zoomInAct->setEnabled(scaleFactor < 2.0);
    zoomOutAct->setEnabled(scaleFactor > 0.125);
    prevPageAct->setEnabled(m_currentPage>1);
    nextPageAct->setEnabled(m_currentPage<m_pageCount);

}
void PdfViewer::setCurrentPage(int page)
{
    if(page!=m_currentPage)
    {m_currentPage=page;
    renderCurrentPage();
    };
}
void PdfViewer::populateScene()
{
    scaleFactor=0.2;
    for (int i=0;i<m_pageCount;i++)
    {

    GraphicsPixmapItem *item = static_cast<GraphicsPixmapItem*>(m_scene->addPixmap(QPixmap::fromImage(renderPage(i+1))));
    QGraphicsTextItem *label =m_scene->addText(QString::number(i+1));
    label->setPos(QPointF(55,160 + i*200));
    label->setActive(false);
    item->setPos(QPointF(0,i*200));
    item->setFlag(QGraphicsItem::ItemIsSelectable,true);
    item->setSelected(false);
    item->setId(i+1);

    };

    //connect(m_mapper,SIGNAL(mapped(int)),this,SLOT(setCurrentPage(int)));
    scaleFactor=1.0;
    connect(m_scene,SIGNAL(selectionChanged()),this,SLOT(thumbnailSelected()));
}
void PdfViewer::thumbnailSelected()
{
    if(!(m_scene->selectedItems()).isEmpty()){
     GraphicsPixmapItem *item =static_cast<GraphicsPixmapItem*>((m_scene->selectedItems()).first());
     m_pageSpinBox->setValue(item->getId());
    };

}
void PdfViewer::disableActs()
{
zoomInAct->setEnabled(false);
zoomOutAct->setEnabled(false);
prevPageAct->setEnabled(false);
nextPageAct->setEnabled(false);
m_zoomComboBox->setEnabled(false);
m_pageSpinBox->setEnabled(false);

}
