#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QVector>

#include "function.h"

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr, Function function = {}, double xBegin = -10, double xEnd = 10, double step = 0.1);
    ~MainWindow();

    double getXStart() const {return m_xStart;}
    double getXEnd() const {return m_xEnd;}
    double getStep() const {return m_step;}

    void setXStart(const double start) {m_xStart = start;}
    void setXEnd(const double end) {m_xEnd = end;}
    void setStep(const double step) {m_step = step;}

    void calculateData();
    void drawGraph();



private:
    Ui::MainWindow *ui;

    double m_xStart = 0;
    double m_xEnd = 0;
    double m_step = 0.1;

    QVector<double> x;
    QVector<double> y;

    Function m_function;
};

#endif // MAINWINDOW_H
