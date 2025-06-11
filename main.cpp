#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <bpptablemodel.h>
#include <bppfontawesome.h>
#include "mydatabase.h"
#include "Printimg.h"
#include <QCryptographicHash>
#include <QApplication >
int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("bppGrid");
    QCoreApplication::setOrganizationDomain("bigno.it");
    QCoreApplication::setOrganizationName("bpp");
    QApplication app(argc, argv);
    QQuickStyle::setStyle("Material");

    MyDatabase theDb;
    if(!theDb.openDb())
        return 1;

    if(!theDb.createTable())
        return 1;

    QQmlApplicationEngine engine;

    bpp::TableModel::registerQml();
    bpp::FontAwesome::registerQml(engine);
    PrintAction  print;
    engine.rootContext()->setContextProperty("PRINT", &print);
	engine.addImportPath("qrc:/");
    engine.rootContext()->setContextProperty("MysqlModel", &theDb);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
