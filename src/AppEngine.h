#ifndef APPENGINE_H
#define APPENGINE_H
#include <QObject>
#include <Libs/eigen-3.4.0/Eigen/Dense>

class AppEngine : public QObject
{
    Q_OBJECT
public:
    explicit AppEngine(QObject *parent = nullptr);

public slots:
    QVector<double> calculate(const QVector<double>& thetas);

private:
    QVector<double> a_arr;
    QVector<double> d_arr;
    QVector<double> alpha_arr;
    QVector<double> theta_arr;

    double degreesToRadians(double degrees);
    double roundFourSign(double value) const;
    Eigen::Matrix4d getTransformationMatrix(int index) const;


signals:
};

#endif // APPENGINE_H
