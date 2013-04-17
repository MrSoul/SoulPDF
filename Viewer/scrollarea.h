#ifndef SCROLLAREA_H
#define SCROLLAREA_H
#include <QtGui>
#include <QScrollBar>
#include <QScrollArea>
#include <QWheelEvent>
class ScrollArea : public QScrollArea
{
    Q_OBJECT

public:

    void setDocLoaded(bool f);

signals:
    void scrollWheel(int);

protected:
    void mousePressEvent(QMouseEvent* );
    void mouseMoveEvent(QMouseEvent* );
    void wheelEvent(QWheelEvent *);
    void mouseReleaseEvent(QMouseEvent *);

private:
    QPoint mousePos;
    bool doc_loaded;
};
#endif // SCROLLAREA_H
