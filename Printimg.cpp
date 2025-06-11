#include "Printimg.h"
#include <QPainter>
#include <QPrinter>
#include <QPrintDialog>
#include <QDebug>
#include <QCryptographicHash>
#include <QPainterPath>
#include <QApplication>
PrintAction::PrintAction()
{

}



QString PrintAction::hash_pass(QString password)
{
    QCryptographicHash *ha = new QCryptographicHash(QCryptographicHash::Md5);
    QByteArray br = password.toUtf8();

    ha->addData(br);
    QString hash1 = QString(ha->result().toHex());
    return hash1;
}



void PrintAction::print(const QVariant &data)

{

  QImage img = qvariant_cast<QImage>(data);
  QPrinter printer;
        QPrintDialog *dlg = new QPrintDialog(&printer,nullptr);
        if(dlg->exec() == QDialog::Accepted) {
                QPainter painter(&printer);
                painter.drawImage(QPoint(0,0),img);
                painter.end();
        }


}
