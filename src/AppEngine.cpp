#include "AppEngine.h"
#include <QDebug>
#include <math.h>
AppEngine::AppEngine(QObject *parent)
    : QObject{parent},
    a_arr{0, -0.8, -0.59, 0, 0, 0},
    d_arr{0.213, 0.193, -0.16, 0.25, 0.28, 0.25},
    alpha_arr{M_PI_2, 0, 0, M_PI_2, -M_PI_2, 0}
{
    theta_arr.resize(6);
}

QVector<double> AppEngine::calculate(QVector<double> thetaFromInput)
{
    QVector<double> result = {-1,-1,-1};
    for(int i = 0; i < thetaFromInput.size(); i++) {
        theta_arr[i] = degreesToRadians(thetaFromInput[i]);
        //alpha_arr[i] = degreesToRadians(alpha_arr[i]);
    }

    Matrix4d T = getTransformationMatrix(0);

    for(int i = 1; i < theta_arr.size(); i++) {
        T *= getTransformationMatrix(i);
    }

    result[0] = (T(0, 3));
    result[1] = (T(1, 3));
    result[2] = (T(2, 3));

    qDebug() << result;
    return result;
}

double AppEngine::degreesToRadians(double degrees)
{
    return degrees * M_PI / 180;
}

Matrix4d AppEngine::getTransformationMatrix(int index)
{
    Matrix4d T; // 4x4 матрица


    const double& theta = theta_arr[index];
    const double& alpha = alpha_arr[index];
    const double& d     = d_arr[index];
    const double& a     = a_arr[index];


    T << cos(theta), -sin(theta) * cos(alpha), sin(theta) * sin(alpha), a * cos(theta),
         sin(theta), cos(theta) * cos(alpha), -cos(theta) * sin(alpha), a * sin(theta),
         0, sin(alpha), cos(alpha), d,
         0, 0, 0, 1;

    qDebug() << "theta is" << theta;
    qDebug() << "alpha is" << alpha << "cos is" << cosf(alpha);
    qDebug() << "d is" << d;
    qDebug() << "a is" << a;

    qDebug() << "start";
    qDebug() << T(0,0) << T(0,1) << T(0,2) << T(0,3);
    qDebug() << T(1,0) << T(1,1) << T(1,2) << T(1,3);
    qDebug() << T(2,0) << T(2,1) << T(2,2) << T(2,3);
    qDebug() << T(3,0) << T(3,1) << T(3,2) << T(3,3);
    qDebug() << "end";

    return T;
}