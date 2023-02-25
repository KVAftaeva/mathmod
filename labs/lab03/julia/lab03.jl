#подключаем модули
using Plots
using DifferentialEquations

#задаем численность армий
const x0 = 21200
const y0 = 9800
#состояние системы (описывается точкой с численностями армий)
point0 = [x0, y0]
#отслеживаемый промежуток времени
time = [0.0, 5.0] 

#задаем константы согласно варианту
#первая модель
a1 = 0.45
b1 = 0.86
c1 = 0.49
h1 = 0.73
#вторая модель
a2 = 0.44
b2 = 0.7
c2 = 0.33
h2 = 0.61

#функции (возможность подкрепления)
#первая модель
function P1(t)
	return sin(t+1)
end

function Q1(t)
	return cos(t+2)
end

#вторая модель
function P2(t)
	return sin(2t)
end

function Q2(t)
	return cos(t)+1
end

#сама система 
#для первой модели	
function F_M!(dp, point, p, t)
	dp[1] = -a1*point[1] - b1*point[2] + P1(t)
	dp[2] = -c1*point[1] - h1*point[2] + Q1(t)
end

#для  второй модели
function S_M!(dp, point, p, t)
	dp[1] = -a2*point[1] - b2*point[2] + P2(t)
	dp[2] = -c2*point[1]*point[2] - h2*point[2] + Q2(t)
end
	
t=collect(LinRange(0, 1, 100))
prob1 = ODEProblem(F_M!, point0, time)
solv1 = solve(prob1, saveat=t)
prob2 = ODEProblem(S_M!, point0, time)
solv2 = solve(prob2, saveat=t)

#постреоние графиков	

#первая модель	
plt1 = plot(
	solv1, 
	vars =(0, 1), 
	color =:red,
	label ="Численость войска армии Х",
	title ="Модель боевых действий 1",
	xlabel ="Время",
	ylabel ="Численность войск"	
)

plot!(
	solv1,
	vars =(0, 2),
	color =:blue,
	label ="Численость войска страны Y"
)

savefig(plt1, "first_j.png")
	
#вторая модель		
plt2 = plot(
	solv2, 
	vars =(0, 1), 
	color =:red,
	label ="Численость войска страны Х",
	title ="Модель боевых действий 2",
	xlabel ="Время",
	ylabel ="Численность войск"	
)

plot!(
	solv2,
	vars =(0, 2),
	color =:blue,
	label ="Численость войска страны Y"
)

savefig(plt2, "second_j.png")
