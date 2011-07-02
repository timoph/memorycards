#include "imageprovider.h"

ImageProvider::ImageProvider() :
    QDeclarativeImageProvider(QDeclarativeImageProvider::Pixmap)
{
}

QPixmap ImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    // TODO: using actual image or other sane things
    // information on pairs (does not belong here?)
    // Custom class to return the image (that should know about the pairs..)
    // is that an engine or something ^
    // image.at(id.toInt())
    int width = 70;
    int height = 100;

    if (size)
        *size = QSize(width, height);
    QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                   requestedSize.height() > 0 ? requestedSize.height() : height);
    pixmap.fill(QColor(qrand() % 255, qrand() % 255, qrand() % 255).rgba());

    return pixmap;
}
