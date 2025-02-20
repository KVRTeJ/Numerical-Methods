#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <functional>

#include <QMainWindow>
#include <QVector>

#include "function.h"

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

/*
 * This class contradicts the principles of SOLID, but to save time, I decided to ignore them,
 * because in the future, I will not support this project.
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
    double getAccuracy() const {return m_accuracy;}

    void setXStart(const double start) {m_xStart = start;}
    void setXEnd(const double end) {m_xEnd = end;}
    void setStep(const double step) {m_step = step;}
    void setAccuracy(const double accuracy) {m_accuracy = accuracy;}

    void calculateGraphData();
    void drawGraph();

    void simpleIterationsMethod(double initialApproximation) const;
    void secantMethod(double initialApproximation) const;
    void steffensenMethod(double initialApproximation) const;

    void newtonMethod(double initialApproximation) const;
    void newtonSecantMethod(double initialApproximation) const;
    void newtonConstDerivativeValue(double initialApproximation) const;

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
