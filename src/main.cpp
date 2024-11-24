#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "AppEngine.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/res/icon.png"));
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/Application.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);


    AppEngine appEngine;

    engine.rootContext()->setContextProperty("appEngine", &appEngine);

    engine.load(url);

    return app.exec();
}
