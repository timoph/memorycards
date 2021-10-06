#include "imageprovider.h"
#include "gameengine.h"

ImageProvider::ImageProvider() : QQuickImageProvider(QQuickImageProvider::Pixmap)
{

}

QPixmap ImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    int width = 70;
    int height = 100;

    if (size)
        *size = QSize(width, height);
    QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                   requestedSize.height() > 0 ? requestedSize.height() : height);
    if(id == "99") {
        pixmap.load("://pics/back.png");
    }
    else {
        QString colorName = GameEngine::instance()->cardList().at(id.toInt());
        if(GameEngine::instance()->usePictures()) {
            pixmap.load(QString("://pics/%1.png").arg(colorName));
        }
        else {
            pixmap.fill(QColor(colorName));
        }
    } 
    return pixmap;
}

QList<QString> ImageProvider::cardColors() const
{
    return GameEngine::instance()->cardList();
}

