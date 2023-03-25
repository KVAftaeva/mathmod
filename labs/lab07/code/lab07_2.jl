#подключаем модули
using Plots
using DifferentialEquations

#задаем начальные условия
N = 995
n0=9
a1=0.000095
a2=0.92
max=[0.0]
max_t=0

#состояние системы 
u0 = [n0]
#отслеживаемый промежуток времени
time = [0.0, 0.5] 

#сама система 
function M!(du, u, p, t)
	du[1] = (a1+a2*u[1])*(N-u[1])
	
	if du[1]>max[1]
		max[1]=du[1]
		max_t=t
	end
end

prob = ODEProblem(M!, u0, time)
sol = solve(prob, saveat=0.0001)

println(max_t)

const N_ = Float64[]

for u in sol.u
	n = u[1]
	push!(N_,n)
end
 
#постреоние графиков 
plt1 = plot(
	dpi = 300,
	size = (1000,600),
	title ="Модель рекламной компании (второй случай)"
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

savefig(plt1, "second.png")
