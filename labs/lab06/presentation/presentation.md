---
## Front matter
lang: ru-RU
title: Лабораторная работа №6
subtitle: Задача об эпидемии
author:
  - Афтаева К.В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 18 марта 2023

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Афтаева Ксения Васильевна
  * студент группы НПИбд-01-20
  * Российский университет дружбы народов
  * [1032201739@pfur.ru](mailto:1032201739@pfur.ru)
  * <https:https://github.com/KVAftaeva>

:::
::: {.column width="30%"}

:::
::::::::::::::

# Вводная часть

## Актуальность

- Необходим навык математического моделирования, которое является неизбежной составляющей научно-технического прогресса

## Объект и предмет исследования

- Модель эпидемии
- Julia
- OpenModelica

## Цели и задачи

Рассмотреть простейшую модель эпидемии на примере задачи.

Задача:

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих
на острове ($N=16 000$) в момент начала эпидемии ($t=0$) число заболевших людей
(являющихся распространителями инфекции) $I(0)=116$, а число здоровых людей с
иммунитетом к болезни $R(0)=16$. Таким образом, число людей восприимчивых к
болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)-R(0)$.

Построить графики изменения числа особей в каждой из трех групп.
Рассмотреть, как будет протекать эпидемия в случае:

1. если $I(0) \leq I^*$

2. если $I(0) > I^*$


## Материалы и методы

- Julia
- OpenModelica


# Выполнение работы

## Изучение теории
:::::::::::::: {.columns align=center}
::: {.column width="50%"}

Если $I(0) \leq I^*$, то 

$$
   	\begin{cases}
    	\frac{dS}{dt} = 0
     	\\
     	 \frac{dI}{dt} = - \beta I
	 	 \\
	 	 \frac{dR}{dt} = \beta I
   		\end{cases}
	$$ 

:::
::: {.column width="50%"}

Если $I(0) > I^*$ 

$$
   		\begin{cases}
     	 \frac{dS}{dt} = -\alpha S
     	 \\
     	 \frac{dI}{dt} = \alpha S- \beta I
	 	 \\
	 	 \frac{dR}{dt} = \beta I
   	\end{cases}
	$$ 

:::
::::::::::::::

## Написание кода для первого случая
:::::::::::::: {.columns align=center}
::: {.column width="50%"}
Фрагмент кода на Julia

![](image/code_jl.png)

:::
::: {.column width="50%"}

Код на OpenModelica

![](image/code_om.png)
:::
::::::::::::::

## Результаты для первого случая

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

Из Julia

![](image/first.png)

:::
::: {.column width="50%"}

Из OpenModelica

![](image/first_om.png)
:::
::::::::::::::

## Результаты, для первого случая

![](image/ir_f.png)


## Написание кода для второго случая
:::::::::::::: {.columns align=center}
::: {.column width="50%"}
Фрагмент кода на Julia
![](image/code2_jl.png)

:::
::: {.column width="50%"}

Код на OpenModelica

![](image/code2_om.png)
:::
::::::::::::::

## Результаты для второго случая

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

Из Julia
![](image/second.png)

:::
::: {.column width="50%"}

Из OpenModelica
![](image/second_om.png)
:::
::::::::::::::

# Результаты

## Результат

Рассмотрена простейшая модель эпидемии на примере задачи. Построены графики изменения числа особей в каждой из трех групп.
Рассмотрено, как будет протекать эпидемия в случае:

1. если $I(0) \leq I^*$

2. если $I(0) > I^*$


# Вывод

## Вывод

Я рассмотрела простейшую модель эпидемии. Выполнила задание согласно варианту: построила графики изменения числа особей в каждой из трех групп для двух случаев.