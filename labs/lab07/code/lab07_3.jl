#подключаем модули
using Plots
using DifferentialEquations

#задаем начальные условия
N = 995
n0=9
a1=0.95
a2=0.93

#состояние системы 
u0 = [n0]
#отслеживаемый промежуток времени
time = [0.0, 0.5] 

#сама система 
function M!(du, u, p, t)
	du[1] = (a1*sin(t)+a2*cos(9*t)*u[1])*(N-u[1])
end

prob = ODEProblem(M!, u0, time)
sol = solve(prob, saveat=0.0001)

const N_ = Float64[]

for u in sol.u
	n = u[1]
	push!(N_,n)
end
 
#постреоние графиков 
plt1 = plot(
	dpi = 300,
	size = (1000,600),
	title ="Модель рекламной компании (третий случай)"
)

plot!(
	plt1,
	sol.t,
	N_,
	color =:red,
	xlabel="t",
	ylabel="N(t)",
	label ="Число знающих о товаре"
)

savefig(plt1, "third.png")
