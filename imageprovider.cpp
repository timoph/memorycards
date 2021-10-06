/*
 Memory cards - a simple pick pair of cards memory game
 Copyright (C) 2021 Timo Härkönen

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/


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

