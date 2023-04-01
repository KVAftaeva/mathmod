#подключаем модули
using Plots
using DifferentialEquations

#задаем начальные условия
M1 = 2.7
M2 = 2
p_cr = 22
N = 25
q = 1
tau1 = 18
tau2 = 21
p1 = 15
p2 = 12

a1 = p_cr / ((tau1 ^ 2) * (p1 ^ 2) * N * q)
a2 = p_cr / ((tau2 ^ 2) * (p2 ^ 2) * N * q)
b = p_cr / ((tau1 ^ 2) * (p1 ^ 2) * (tau2 ^ 2) * (p2 ^ 2) * N * q)
c1 = (p_cr - p1) / (tau1 * p1)
c2 = (p_cr - p2) / (tau2 * p2)

#состояние системы 
u0 = [M1, M2]
#отслеживаемый промежуток времени
time = [0.0, 30.0] 

#сама система 
function F!(du, u, p, t)
	du[1] = u[1] - (b / c1) * u[1] * u[2] - (a1 / c1) * (u[1] ^ 2)
	du[2] = (c2 / c1) * u[2] - (b / c1) * u[1] * u[2] - (a2 / c1) * (u[2] ^ 2)
end

prob = ODEProblem(F!, u0, time)
sol = solve(prob, saveat=0.0001)

const M_1 = Float64[]
const M_2 = Float64[]

for u in sol.u
	m1 = u[1]
	m2 = u[2]
	push!(M_1,m1)
	push!(M_2,m2)
end
 
#постреоние графиков 
plt1 = plot(
	dpi = 300,
	size = (1100,800),
	title ="Модель конкуренции двух фирм (первый случай)"
)

plot!(
	plt1,
	sol.t,
	M_1,
	color =:red,
	xlabel="Время",
	ylabel="Объемы продаж",
	label ="фирма 1"
)

plot!(
	plt1,
	sol.t,
	M_2,
	color =:blue,
	xlabel="Время",
	ylabel="Объемы продаж",
	label ="фирма 2"
)

savefig(plt1, "first.png")
