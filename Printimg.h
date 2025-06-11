#ifndef PRINTIMG_H
#define PRINTIMG_H
#include <QPainterPath>
#include <QObject>
#include <QVariant>
#include <QSerialPort>

class PrintAction : public QObject
{
  Q_OBJECT

public:
  PrintAction();
   Q_INVOKABLE void print(const QVariant &data);
   Q_INVOKABLE QString hash_pass(QString password);


};
#endif // PRINTIMG_H
