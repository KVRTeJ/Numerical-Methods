#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent, Function function)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , m_function(function)
{
    ui->setupUi(this);


    ui->widget->xAxis2->setVisible(true);
    ui->widget->xAxis2->setTickLabels(false);

    ui->widget->yAxis2->setVisible(true);
    ui->widget->yAxis2->setTickLabels(false);

    setXStart(2);
    setXEnd(2.75);
    setStep(0.1);

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

    ui->widget->xAxis->setRange(*std::max_element(x.begin(), x.end()) + (m_step * stepCoef),
                                *std::min_element(x.begin(), x.end()) - (m_step * stepCoef));
    ui->widget->yAxis->setRange(*std::max_element(y.begin(), y.end()) + (m_step * stepCoef),
                                *std::min_element(y.begin(), y.end()) - (m_step * stepCoef));

    ui->widget->xAxis2->setRange(*std::max_element(x.begin(), x.end()) + (m_step * stepCoef),
                                 *std::min_element(x.begin(), x.end()) - (m_step * stepCoef));
    ui->widget->yAxis2->setRange(*std::max_element(y.begin(), y.end()) + (m_step * stepCoef),
                                 *std::min_element(y.begin(), y.end()) - (m_step * stepCoef));

    ui->widget->graph(0)->setData(x, y);

    ui->widget->replot();
}
