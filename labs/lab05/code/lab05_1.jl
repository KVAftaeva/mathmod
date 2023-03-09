#подключаем модули
using Plots
using DifferentialEquations

#задаем начальные условия
const x0 = 3
const y0 = 8

#состояние системы 
u0 = [x0, y0]
#отслеживаемый промежуток времени
time = [0.0, 30.0] 

#задаем константы согласно варианту 
a = 0.22
b = 0.051
c = 0.33
d = 0.041

#сама система 
function M!(du, u, p, t)
	du[1] = -a*u[1]+b*u[1]*u[2]
	du[2] = c*u[2]-d*u[1]*u[2]
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
	title ="Изменение численности хищников и численности жертв"
)

plot!(
	plt1,
	sol.t,
	X,
	color =:red,
	label ="Численность хищников"
)

plot!(
	plt1,
	sol.t,
	Y,
	color =:blue,
	label ="Численность жертв"
)

savefig(plt1, "first.png")

plt2 = plot(
	dpi = 300,
	size = (700,500),
	title ="График зависимости численностей"
)

plot!(
	plt2,
	Y,
	X,
	color =:red,
	label ="Зависимость численности хищников от численности жертв"
)

savefig(plt2, "first_php.png")
