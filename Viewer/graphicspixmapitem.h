#ifndef GRAPHICSPIXMAPITEM_H
#define GRAPHICSPIXMAPITEM_H

#include <QGraphicsPixmapItem>
#include <QtGui>
#include <QObject>

class GraphicsPixmapItem : public QObject , public QGraphicsPixmapItem
{
    Q_OBJECT
public:
    void setId(int index);
    int getId();
private:
int id;
};

#endif // GRAPHICSPIXMAPITEM_H
