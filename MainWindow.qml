/*
    (C) Copyright 2015 Adam Cowdy

    This file is part of Pictures.

    Pictures is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Pictures is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Pictures. If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import "UIUtils.js" as UI

ApplicationWindow {
    id: appWindow
    width: 500
    height: 400
    visible: false

    FileDialog {
        id: mainFileDialog
        title: "Pictures"
        nameFilters: [ "Image files (*.jpg *.png *.bmp *.gif)", "All files (*)" ]
        onAccepted: {
            imageView.source = fileUrl
            appWindow.visible = true
        }
        onRejected: {
            appWindow.close()
        }
        Component.onCompleted: {
            if (!appWindow.visible) { visible = true }
            else { visible = false }
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent

        Image {
            id: imageView
        }
    }
}
