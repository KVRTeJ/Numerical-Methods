#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QDebug>

MainWindow::MainWindow(QWidget *parent, Function function,
                       double xBegin, double xEnd, double step,
                       double accuracy)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , m_function(function)
    , m_xStart(xBegin)
    , m_xEnd(xEnd)
    , m_step(step)
    , m_accuracy(accuracy)
{
    ui->setupUi(this);


    ui->widget->xAxis2->setVisible(true);
    ui->widget->xAxis2->setTickLabels(false);

    ui->widget->yAxis2->setVisible(true);
    ui->widget->yAxis2->setTickLabels(false);

    calculateGraphData();
    drawGraph();

    double initialApproximation = 2.5;
    double initialApproximationFarther = 4;
    simpleIterationsMethod(initialApproximation);
    simpleIterationsMethod(initialApproximationFarther);

    ui->textBrowser->append("\n");

    secantMethod(initialApproximation);
    secantMethod(initialApproximationFarther);

    ui->textBrowser->append("\n");

    steffensenMethod(initialApproximation);
    steffensenMethod(initialApproximationFarther);

    ui->textBrowser->append("\n");

    newtonMethod(initialApproximation);
    newtonMethod(initialApproximationFarther);
}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::calculateGraphData() {
    for(double i = m_xStart; i < m_xEnd; i += m_step) {
        x.push_back(i);
        y.push_back(m_function(i));
    }
}

void MainWindow::drawGraph() {
    ui->widget->addGraph();

    ui->widget->graph(0)->setBrush(QBrush(QColor(0, 0, 255, 20)));

    ui->widget->graph(0)->setData(x, y);

    ui->widget->rescaleAxes(true);

    ui->widget->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom | QCP::iSelectPlottables);
    ui->widget->replot();
}

void MainWindow::simpleIterationsMethod(double initialApproximation) const {
    qDebug() << "simpleIterationsMethod started";

    ui->textBrowser->append("Метод простых итераций:");
    ui->textBrowser->append("Начальное приближение - " +
                            QString::number(initialApproximation));

    /*
    ui->textBrowser->append("Итерационная последоватеольность сходится и является немонотонной, т.к. phi' ~ -0.5722");

    double result = (initialApproximation - m_function.getSecondCanonForm(initialApproximation));
    ui->textBrowser->append("x0 - phi(x0) - " +
                            QString::number(result));

    result = result / (1 - -(0.5722));
    ui->textBrowser->append("(x0 - phi(x0)) / (1 - q2) - " +
                            QString::number(result));
    */

    int stepCount = 0;
    double current = m_function.getSecondCanonForm(initialApproximation);
    double next = m_function.getSecondCanonForm(current);
    while(abs(next - current) >= m_accuracy) {
        current = next;
        next = m_function.getSecondCanonForm(current);
        ++stepCount;

        qDebug() << next << current << next - current;
    }

    ui->textBrowser->append("Результат - " + QString::number(next) + "\n" + "Количество итераций - " + QString::number(stepCount) + '\n');

    qDebug() << "simpleIterationsMethod ended\n";
}

void MainWindow::secantMethod(double initialApproximation) const {
    qDebug() << "secantMethod started";

    ui->textBrowser->append("Метод секущих:");
    ui->textBrowser->append("Начальное приближение - " +
                            QString::number(initialApproximation));

    int stepCount = 0;
    double current = m_function.getSecondCanonForm(initialApproximation);
    double next = (initialApproximation * m_function.getSecondCanonForm(current) -
                   current * m_function.getSecondCanonForm(initialApproximation)) /
                  (m_function.getSecondCanonForm(current) - current -
                   m_function.getSecondCanonForm(initialApproximation) + initialApproximation);
    double extra = 0;
    while(abs(next - current) >= m_accuracy) {
        extra = current;
        current = next;
        next = (extra * m_function.getSecondCanonForm(current) - current * m_function.getSecondCanonForm(extra)) /
               (m_function.getSecondCanonForm(current) - current - m_function.getSecondCanonForm(extra) + extra);
        ++stepCount;

        qDebug() << next << current << next - current;
    }

    ui->textBrowser->append("Результат - " + QString::number(next) + "\n" + "Количество итераций - " + QString::number(stepCount) + '\n');

    qDebug() << "secantMethod ended\n";
}

void MainWindow::steffensenMethod(double initialApproximation) const {
    qDebug() << "steffensenMethod started";

    ui->textBrowser->append("Метод Стеффенсена:");
    ui->textBrowser->append("Начальное приближение - " +
                            QString::number(initialApproximation));

    int stepCount = 0;
    double current = m_function.getSecondCanonForm(initialApproximation);
    double next = (initialApproximation * m_function.getSecondCanonForm(m_function.getSecondCanonForm(initialApproximation)) -
                   pow(m_function.getSecondCanonForm(initialApproximation), 2)) /
                  (m_function.getSecondCanonForm(m_function.getSecondCanonForm(initialApproximation)) -
                   2 * m_function.getSecondCanonForm(initialApproximation) + initialApproximation);

    while(abs(next - current) >= m_accuracy) {
        current = next;
        next = (current * m_function.getSecondCanonForm(m_function.getSecondCanonForm(current)) -
                pow(m_function.getSecondCanonForm(current), 2)) /
               (m_function.getSecondCanonForm(m_function.getSecondCanonForm(current)) -
                2 * m_function.getSecondCanonForm(current) + current);
        ++stepCount;

        qDebug() << next << current << next - current;
    }

    ui->textBrowser->append("Результат - " + QString::number(next) + "\n" + "Количество итераций - " + QString::number(stepCount) + '\n');

    qDebug() << "steffensenMethod ended\n";
}

void MainWindow::newtonMethod(double initialApproximation) const {
    qDebug() << "newtonMethod started";

    ui->textBrowser->append("Метод Ньютона:");
    ui->textBrowser->append("Начальное приближение - " +
                            QString::number(initialApproximation));

    int stepCount = 0;
    double current = m_function.getSecondCanonForm(initialApproximation);
    double next = current - m_function(current) / m_function.getDerived(current);

    while(abs(next - current) >= m_accuracy) {
        current = next;
        next =  current - m_function(current) / m_function.getDerived(current);
        ++stepCount;

        qDebug() << next << current << next - current;
    }

    ui->textBrowser->append("Результат - " + QString::number(next) + "\n" + "Количество итераций - " + QString::number(stepCount) + '\n');

    qDebug() << "newtonMethod ended\n";
}
