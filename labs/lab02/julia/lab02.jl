# подключение модулей
using Plots

# расстояние между лодкой и катером
const k = 6.7

# для первого случая (k-x)
const x1 = k/3.7  # точка старта охотников (выведена в отчете)
const C1 = k/3.7  # значение константы С при тета=0

# для второго случая (k+x)
const x2 = -k/1.7  # точка старта охотников (выведена в отчете)
const C2 = k/(1.7*exp(-pi/sqrt(6.29))) # значение константы С при тета=-pi

# массив углов отклонения для первого случая 
theta1 = range(0, 2pi, 100)

# функция для первого случая
function r1(theta1)
	return C1*exp(theta1/sqrt(6.29))
end

# массив радиусов (длин) для первого случая
R1 = r1.(theta1)

# массив углов отклонения для второго случая 
theta2 = range(-pi, pi, 100)

# функция для второго случая
function r2(theta2)
	return C2*exp(theta2/sqrt(6.29))
end

# массив радиусов (длин) для второго случая
R2 = r2.(theta2)

#вывод координат на экран
println("Координаты точки пересечения для 1 случая - длина (радиус) и угол")
println(R1[40])
println(theta1[40])
println("Координаты точки пересечения для 2 случая - длина (радиус) и угол")
println(R2[40])
println(theta2[40])

# График для первого случая
plt1 = plot(
	proj = :polar,
	aspect_ratio=:equal,
	dpi=200,
	title="Случай 1",
	legend=true)
	
plot!(
	plt1,
	theta1,
	R1,
	xlabel="theta",
	ylabel="r(theta)",
	label="Траектория движения катера",
	color=:red)
	
plot!(
	plt1,
	[0.0,0.0],
	[x1,6.7],	
	color=:red,
	label="")
	
plot!(
	plt1,
	[0.0,theta1[40]],
	[0,40],
	xlabel="theta",
	ylabel="r(theta)",
	label="Траектория движения лодки",
	color=:blue)
	
scatter!(
	plt1,
	[theta1[40]],
	[R1[40]],
	label="Точка пересечения",
	ms=1.5)
	
savefig(plt1,"First.png")

# График для второго случая
plt2 = plot(
	proj = :polar,
	aspect_ratio=:equal,
	dpi=200,
	title="Случай 2",
	legend=true)
	
plot!(
	plt2,
	theta2,
	R2,
	xlabel="theta",
	ylabel="r(theta)",
	label="Траектория движения катера",
	color=:red)
	
plot!(
	plt2,
	[0.0,0.0],
	[x2,6.7],	
	color=:red,
	label="")
	
plot!(
	plt2,
	[0.0,theta2[40]],
	[0,40],
	xlabel="theta",
	ylabel="r(theta)",
	label="Траектория движения лодки",
	color=:blue)
	
scatter!(
	plt2,
	[theta2[40]],
	[R2[40]],
	label="Точка пересечения",
	ms=1.5)
	
savefig(plt2,"Second.png")