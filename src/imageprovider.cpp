#include "imageprovider.h"

ImageProvider::ImageProvider() :
    QDeclarativeImageProvider(QDeclarativeImageProvider::Pixmap)
{
    // fill colors in pairs
    for(int i = 0; i < 16; i++) {
        m_list.append(QColor(qrand() % 255, qrand() % 255, qrand() % 255).rgba());
    }
    for(int i = 15; i >= 0; i--) {
        m_list.append(m_list.at(i));
    }

    // TODO: random list order
}

QPixmap ImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    // TODO: using actual image or other sane things

    int width = 70;
    int height = 100;

    if (size)
        *size = QSize(width, height);
    QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                   requestedSize.height() > 0 ? requestedSize.height() : height);
    if(id == "99") {
        pixmap.fill(QColor("darkGray"));
    }
    else {
        pixmap.fill(m_list.at(id.toInt()));
    }

    return pixmap;
}

QList<QColor> ImageProvider::cardColors() const
{
    return m_list;
}
