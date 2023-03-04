#подключаем модули
using Plots
using DifferentialEquations

#задаем начальные условия
const x0 = 2
const y0 = 0

#состояние системы 
u0 = [x0, y0]
#отслеживаемый промежуток времени
time = [0.0, 30.0] 

#задаем константы согласно варианту и случаю
a = 4
b = 1

#сама система 
function M!(du, u, p, t)
	du[1] = u[2]
	du[2] = cos(2*t)-a*u[2]-b*u[1]
end

prob = ODEProblem(M!, u0, time)
sol = solve(prob, saveat=0.05)

const X = Float64[]
const Y = Float64[]

for u in sol.u
	x, y = u
	push!(X,x)
	push!(Y,y)
end
 
#постреоние графиков 
plt1 = plot(
	dpi = 300,
	size = (700,500),
	title ="Случай 3: с затуханием и под действием внешней силы"
)

plot!(
	plt1,
	sol.t,
	X,
	color =:red,
	label ="x"
)

plot!(
	plt1,
	sol.t,
	Y,
	color =:blue,
	label ="y"
)

savefig(plt1, "third.png")

plt2 = plot(
	dpi = 300,
	size = (700,500),
	title ="Случай 3: с затуханием и под действием внешней силы"
)

plot!(
	plt2,
	X,
	Y,
	color =:red,
	label ="(Фазовый портрет случай 3)"
)

savefig(plt2, "third_php.png")
