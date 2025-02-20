#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent, Function function, double xBegin, double xEnd, double step)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , m_function(function)
    , m_xStart(xBegin)
    , m_xEnd(xEnd)
    , m_step(step)
{
    ui->setupUi(this);


    ui->widget->xAxis2->setVisible(true);
    ui->widget->xAxis2->setTickLabels(false);

    ui->widget->yAxis2->setVisible(true);
    ui->widget->yAxis2->setTickLabels(false);

    calculateData();

    drawGraph();

}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::calculateData() {
    for(double i = m_xStart; i < m_xEnd; i += m_step) {
        x.push_back(i);
        y.push_back(m_function(i));
    }
}

void MainWindow::drawGraph() {
    ui->widget->addGraph();

    const int stepCoef = 1;

    ui->widget->graph(0)->setBrush(QBrush(QColor(0, 0, 255, 20)));

    ui->widget->graph(0)->setData(x, y);

    ui->widget->rescaleAxes(true);

    ui->widget->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom | QCP::iSelectPlottables);
    ui->widget->replot();
}
