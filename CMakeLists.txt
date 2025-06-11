cmake_minimum_required(VERSION 3.16)
project(fromDb VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core Qt5Widgets )
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Qml Quick QuickControls2 Sql Svg Xml SerialPort PrintSupport )

qt_standard_project_setup()

qt_add_executable(fromDb WIN32 MACOSX_BUNDLE
    ../../BppFa/bppfontawesome.cpp ../../BppFa/bppfontawesome.h
    ../../BppTable/bpptablecolumn.cpp ../../BppTable/bpptablecolumn.h
    ../../BppTable/bpptabledatabase.cpp ../../BppTable/bpptabledatabase.h
    ../../BppTable/bpptablemodel.cpp ../../BppTable/bpptablemodel.h
    main.cpp
    mydatabase.cpp mydatabase.h
)
qt_add_qml_module(fromDb
    URI fromDb
    VERSION ${PROJECT_VERSION}
    QML_FILES
        ../../BppTable/CellButton.qml
        ../../BppTable/CellClicker.qml
        ../../BppTable/CellText.qml
        ../../BppTable/CompGrid.qml
        ../../BppTable/CellFa.qml
        ../../BppTable/GridStatusButton.qml
    RESOURCES
        ../../BppTable/assets/sort-down.svg
        ../../BppTable/assets/sort-up.svg
        ../../BppTable/assets/sort-up-and-down.svg
        ../../BppTable/qmldir
        ../../BppTable/assets/cog-solid.svg
        ../../BppTable/assets/copy-solid.svg
        ../../BppTable/assets/arrows-alt-h-solid.svg
        ../../BppTable/assets/icon-delete.svg
    NO_RESOURCE_TARGET_PATH
    QML_FILES TreeItem.js TreeWidget.qml
    QML_FILES Person/Delete.qml Person/EditInfo.qml Person/PerList.qml Person/Update.qml
RESOURCES Management/providers/map/cycle Management/providers/map/cycle-hires Management/providers/map/hiking Management/providers/map/hiking-hires Management/providers/map/LICENSE Management/providers/map/night-transit Management/providers/map/night-transit-hires Management/providers/map/README.md Management/providers/map/satellite Management/providers/map/set_api_key.sh Management/providers/map/street Management/providers/map/street-hires Management/providers/map/terrain Management/providers/map/terrain-hires Management/providers/map/transit Management/providers/map/transit-hires Management/providers/osm/map.osm Management/providers/satellite/cycle Management/providers/satellite/cycle-hires Management/providers/satellite/hiking Management/providers/satellite/hiking-hires Management/providers/satellite/LICENSE Management/providers/satellite/night-transit Management/providers/satellite/night-transit-hires Management/providers/satellite/README.md Management/providers/satellite/satellite Management/providers/satellite/set_api_key.sh Management/providers/satellite/street Management/providers/satellite/street-hires Management/providers/satellite/terrain Management/providers/satellite/terrain-hires Management/providers/satellite/transit Management/providers/satellite/transit-hires
QML_FILES Management/Line.qml Management/Marker.qml Management/Report.qml Management/SMSPanel.qml User/Create.qml User/Edit.qml User/Remove.qml User/Schedule.qml
RESOURCES providers/map/cycle providers/map/cycle-hires providers/map/hiking providers/map/hiking-hires providers/map/LICENSE providers/map/night-transit providers/map/night-transit-hires providers/map/README.md providers/map/satellite providers/map/set_api_key.sh providers/map/street providers/map/street-hires providers/map/terrain providers/map/terrain-hires providers/map/transit providers/map/transit-hires providers/osm/cycle providers/osm/cycle-hires providers/osm/hiking providers/osm/hiking-hires providers/osm/LICENSE providers/osm/map.osm providers/osm/night-transit providers/osm/night-transit-hires providers/osm/README.md providers/osm/satellite providers/osm/set_api_key.sh providers/osm/street providers/osm/street-hires providers/osm/terrain providers/osm/terrain-hires providers/osm/transit providers/osm/transit-hires providers/satellite/cycle providers/satellite/cycle-hires providers/satellite/hiking providers/satellite/hiking-hires providers/satellite/LICENSE providers/satellite/night-transit providers/satellite/night-transit-hires providers/satellite/README.md providers/satellite/satellite providers/satellite/set_api_key.sh providers/satellite/street providers/satellite/street-hires providers/satellite/terrain providers/satellite/terrain-hires providers/satellite/transit providers/satellite/transit-hires
RESOURCES icons/Bookmarks.svg icons/Explore.svg icons/Home.svg icons/Menu.svg icons/Messages.svg icons/Notifications.svg icons/Profile.svg icons/Search.svg icons/Setting.svg
RESOURCES img/marker.png img/Menu.png img/btn_collapse.png img/btn_expand.png img/jeremy-bishop-8xznAGy4HcY-unsplash.jpg img/Password.png img/2.jpg img/3.jpg img/AddRemove.png img/background.jpg img/background2.jpg img/Report.png img/Schedule.png img/SMSPanel.png img/unnamed-removebg-preview.png img/username.png img/username2.png img/UserSetting.png
SOURCES Printimg.cpp Printimg.h
)

# Avoid collision between executable name and QML module directory (QTBUG-98568).
if(NOT WIN32 AND NOT APPLE)
    set_property(TARGET fromDb PROPERTY OUTPUT_NAME fromDb_app)
endif()

target_include_directories(fromDb PRIVATE
    ../../BppFa
    ../../BppTable
)

target_compile_definitions(fromDb PRIVATE
    QT_DEPRECATED_WARNINGS QT_DEPRECATED_WARNINGS QT_DEPRECATED_WARNINGS
    QT_DISABLE_DEPRECATED_BEFORE=0x060000 QT_DISABLE_DEPRECATED_BEFORE=0x060000
)

target_link_libraries(fromDb PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Qt::QuickControls2
    Qt::Sql
    Qt::Svg
    Qt::Xml
    Qt::SerialPort
    Qt6::PrintSupport
    Qt6::Widgets
)


# Resources:
set(BppFa_resource_files
    "../../BppFa/BppButton.qml"
    "../../BppFa/BppCalendar.qml"
    "../../BppFa/BppColorPicker.qml"
    "../../BppFa/BppColorPickerDialog.qml"
    "../../BppFa/BppGrid.qml"
    "../../BppFa/BppGridFaIcon.qml"
    "../../BppFa/BppGridText.qml"
    "../../BppFa/BppImageArrayChooser.qml"
    "../../BppFa/BppMetrics.qml"
    "../../BppFa/BppMsgBox.qml"
    "../../BppFa/BppPane.qml"
    "../../BppFa/BppShadowImageButton.qml"
    "../../BppFa/BppStyleMaterial.qml"
    "../../BppFa/BppStyleUniversal.qml"
    "../../BppFa/BppTextCp.qml"
    "../../BppFa/BppTextCpEdit.qml"
    "../../BppFa/BppTextDate.qml"
    "../../BppFa/BppTextPlusMin.qml"
    "../../BppFa/BppToolButtonFa.qml"
    "../../BppFa/BppTreeView.qml"
    "../../BppFa/assets/box-shadow.png"
    "../../BppFa/fonts/Roboto-Regular.ttf"
    "../../BppFa/fonts/fa-brands-400.ttf"
    "../../BppFa/fonts/fa-regular-400.ttf"
    "../../BppFa/fonts/fa-solid-900.ttf"
    "../../BppFa/qmldir"
)

qt_add_resources(fromDb "BppFa"
    PREFIX
        "/"
    BASE
        "../.."
    FILES
        ${BppFa_resource_files}
)
set(qml_resource_files
    "ButtonAction.qml"
    "Enums.qml"
    "assets/create_db.sql"
    "main.qml"
)

qt_add_resources(fromDb "qml"
    PREFIX
        "/"
    FILES
        ${qml_resource_files}
)

install(TARGETS fromDb
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET fromDb
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
    MACOS_BUNDLE_POST_BUILD
)
install(SCRIPT ${deploy_script})
