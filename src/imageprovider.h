#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#ifdef QT5BUILD
#include <QQuickImageProvider>
#else
#include <QDeclarativeImageProvider>
#endif

#ifdef QT5BUILD
class ImageProvider : public QQuickImageProvider
#else
class ImageProvider : public QDeclarativeImageProvider
#endif
{
public:
    ImageProvider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
    QList<QColor> cardColors() const;

private:
    QList<QColor> m_list;
};

#endif // IMAGEPROVIDER_H
