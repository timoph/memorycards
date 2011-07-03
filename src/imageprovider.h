#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#include <QDeclarativeImageProvider>

class ImageProvider : public QDeclarativeImageProvider
{
public:
    ImageProvider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
    QList<QColor> cardColors() const;

private:
    QList<QColor> m_list;
};

#endif // IMAGEPROVIDER_H
