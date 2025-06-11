#include <mydatabase.h>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>
#include <QSqlQuery>
#include <QSqlError>
#include <QDate>
#include <QDateTime>
//#include <QMessageBox>
MyDatabase::MyDatabase():
    db(QSqlDatabase::addDatabase("QMYSQL"))
{

}

MyDatabase::~MyDatabase()
{
    db.close();
}

bool MyDatabase::openDb()
{

    db.setHostName("localhost");
    db.setDatabaseName("supervision_db");
    db.setPort(3307);
    db.setUserName("root");
    db.setPassword("root");
    db.open();
    return true;
}

bool MyDatabase::createTable()
{
    bool allOk(true);
    return allOk;
}

QSqlDatabase *MyDatabase::getDb()
{
    return &db;
}


