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

/*
 * Этот класс противоречит принципам SOLID, но, для экономии времени, я решил ими пренебречь,
 * т.к. в дальнейшем, я не буду поддерживать этот проект.
 */

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr, Function function = {},
               double xBegin = -10, double xEnd = 10, double step = 0.1,
               double accuracy = (0.5 * pow(10, -4)));
    ~MainWindow();

    double getXStart() const {return m_xStart;}
    double getXEnd() const {return m_xEnd;}
    double getStep() const {return m_step;}

    void setXStart(const double start) {m_xStart = start;}
    void setXEnd(const double end) {m_xEnd = end;}
    void setStep(const double step) {m_step = step;}

    void calculateGraphData();
    void drawGraph();

    void simpleIterationsMethod(double initialApproximation) const;
    void secantMethod(double initialApproximation) const;


private:
    Ui::MainWindow *ui;

    double m_xStart = 0.0;
    double m_xEnd = 0.0;
    double m_step = 0.1;

    QVector<double> x;
    QVector<double> y;

    double m_accuracy = 0.1;

    Function m_function;
};

#endif // MAINWINDOW_H
