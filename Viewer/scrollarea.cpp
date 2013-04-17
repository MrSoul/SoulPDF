#include "scrollarea.h"
void ScrollArea::setDocLoaded(bool f)
    {
     doc_loaded=f;
    }
void ScrollArea::mousePressEvent(QMouseEvent *e){
        mousePos = e->pos();
        if(doc_loaded)QApplication::setOverrideCursor(Qt::ClosedHandCursor);
    }
void ScrollArea::mouseMoveEvent(QMouseEvent *e){
        QPoint diff = e->pos() - mousePos;
        mousePos = e->pos();
        verticalScrollBar()->setValue(verticalScrollBar()->value()-diff.y());
        horizontalScrollBar()->setValue(horizontalScrollBar()->value()-diff.x());
    }
void ScrollArea::wheelEvent(QWheelEvent *e){

            if (e->delta() > 0)
                emit scrollWheel(9);
            else
                emit scrollWheel(-2);

    }
void ScrollArea::mouseReleaseEvent(QMouseEvent *e)
    {
        QApplication::restoreOverrideCursor();
    }

