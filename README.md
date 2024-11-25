# Demo
## Программа расчета прямой задачи кинематики 6-осевого коллаборативного робота, по данной DH модели
<!--Блок информации о репозитории в бейджах-->
![Static Badge](https://img.shields.io/badge/gpicugin-ROBOPRO)
![GitHub top language](https://img.shields.io/github/languages/top/gpicugin/ROBOPRO)
![GitHub Repo stars](https://img.shields.io/github/stars/gpicugin/ROBOPRO)

![Logotype](./res/icon.jpg)

<!--Установка-->
## Установка (Linux)
У вас должны быть установлены [зависимости проекта](https://github.com/gpicugin/ROBOPRO#зависимости)

1. Клонирование репозитория 
```git clone https://github.com/gpicugin/ROBOPRO.git```
2. Клонирование репозитория библиотеки для работы с матрицами в папку Libs
```git clone https://gitlab.com/libeigen/eigen.git```
3. Переименовать папку репозитория библиотеки на
```EigenLib``` Должно получиться Demo/Libs/EigenLib/
<!--зависимости-->
## Зависимости
Программа использует в работе исходный код библиотеки Eigen и Qt6
```https://eigen.tuxfamily.org/```

## Исходные данные
Программа в работе использует следующую DH модель
| Kinematics  | theta (deg) | a(m)  | **d(m)** | **alpha(rad)** |
| ----------- | ----------- | ----- | -------- | -------------- |
| **Joint 0** | 15          | 0     | 0.213    | π/2            |
| **Joint 1** | -50         | -0.8  | 0.193    | 0              |
| **Joint 2** | -60         | -0.59 | -0.16    | 0              |
| **Joint 3** | 95          | 0     | 0.25     | π/2            |
| **Joint 4** | 50          | 0     | 0.28     | -π/2           |
| **Joint 5** | 0           | 0     | 0.25     | 0              |


