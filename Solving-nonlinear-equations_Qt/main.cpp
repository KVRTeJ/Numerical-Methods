#include "mainwindow.h"

#include <QApplication>

#include "function.h"

#include <iostream>

int main(int argc, char *argv[]) {

    Function func;

    std::cout << "func(2) = " << func(2) << std::endl;

    return -1;
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
