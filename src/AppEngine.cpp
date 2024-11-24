#include "AppEngine.h"
#include <QDebug>
#include <cmath>
//#define DEBUG

AppEngine::AppEngine(QObject *parent)
    : QObject{parent},
    a_arr{0, -0.8, -0.59, 0, 0, 0},
    d_arr{0.213, 0.193, -0.16, 0.25, 0.28, 0.25},
    alpha_arr{M_PI_2, 0, 0, M_PI_2, -M_PI_2, 0}
{
    theta_arr.resize(6);
}

QVector<double> AppEngine::calculate(const QVector<double>& thetaFromInput)
{
    QVector<double> result = {-1,-1,-1};
    for(int i = 0; i < thetaFromInput.size(); i++) {
        theta_arr[i] = degreesToRadians(thetaFromInput[i]);
    }

    Eigen::Matrix4d T = getTransformationMatrix(0);

    for(int i = 1; i < theta_arr.size(); i++) {
        T *= getTransformationMatrix(i);
    }

    result[0] = roundFourSign(T(0, 3));
    result[1] = roundFourSign(T(1, 3));
    result[2] = roundFourSign(T(2, 3));

#ifdef DEBUG
    qDebug() << result;
#endif
    return result;
}

Eigen::Matrix4d AppEngine::getTransformationMatrix(int index) const
{
    Eigen::Matrix4d T;

    const double& theta = theta_arr[index];
    const double& alpha = alpha_arr[index];
    const double& d     = d_arr[index];
    const double& a     = a_arr[index];


    T << roundFourSign(cos(theta)),
        -roundFourSign(sin(theta)) * roundFourSign(cos(alpha)),
        roundFourSign(sin(theta)) * roundFourSign(sin(alpha)),
        a * roundFourSign(cos(theta)),
        roundFourSign(sin(theta)),
        roundFourSign(cos(theta)) * roundFourSign(cos(alpha)),
        -roundFourSign(cos(theta)) * roundFourSign(sin(alpha)),
        a * roundFourSign(sin(theta)),
        0,
        roundFourSign(sin(alpha)),
        roundFourSign(cos(alpha)),
        d,
        0, 0, 0, 1;

#ifdef DEBUG
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
#endif

    return T;
}

double AppEngine::degreesToRadians(double degrees)
{
    return degrees * M_PI / 180;
}

double AppEngine::roundFourSign(double value) const
{
    return std::round(value * 1000) / 1000;
}


