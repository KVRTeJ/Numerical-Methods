#include "mainwindow.h"

#include <QApplication>

#include "function.h"

int main(int argc, char *argv[]) {
    Function func;

    QApplication a(argc, argv);
    MainWindow w(nullptr, func);
    w.setWindowTitle("Solving nonlinear equations");
    w.show();
    return a.exec();
}
