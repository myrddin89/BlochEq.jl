### A Pluto.jl notebook ###
# v0.14.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 960703e4-98b3-11eb-327d-e3640b19b7e8
begin
	import Pkg; Pkg.activate(@__DIR__)
	using Plots, PlutoUI
end

# ╔═╡ 688ba03f-a052-421d-9c0c-91b33a27d02c
begin
	#@gif for p ∈ plots
#		plot(p)
#	end
end;

# ╔═╡ 664f2bc3-bd52-4240-9443-b2fcd7500f04
begin
	T₁ = 200
	T₂ = 80
	ω₀ = 0.25
	tmax = 1000
	N = 10000
	ts = range(0,tmax,length=N)
	M0x = 0.5
	M0y = 0.5
	M0z = 0
	M = 1
	fMx(t) = (M0x * cos(ω₀ * t) - M0y * sin(ω₀ * t)) * exp(-t/T₂)
	fMy(t) = (M0y * cos(ω₀ * t) + M0y * sin(ω₀ * t)) * exp(-t/T₂)
	fMz(t) = M0z * exp(-t/T₁) + M * (1 - exp(-t/T₁))
	Mxs = fMx.(ts)
	Mys = fMy.(ts)
	Mzs = fMz.(ts)
end;

# ╔═╡ bfd1b44e-b63e-4644-bb91-f2e7d3a6d2eb
plots = map(1:100:N) do i
	@views plot(Mxs[1:i], Mys[1:i], Mzs[1:i], xlims=(-1,1), ylims=(-1,1),zlims=(0,1), leg=:none, aspect_ratio=:equal)
end;

# ╔═╡ 8daf0654-5b8e-4e53-8655-6c52173cc0d5
@bind i Slider(1:length(plots), show_value=true)

# ╔═╡ 6cc56a8a-f937-4735-9f5f-4162aec6c97c
begin
	plots[i]
end

# ╔═╡ Cell order:
# ╠═688ba03f-a052-421d-9c0c-91b33a27d02c
# ╟─8daf0654-5b8e-4e53-8655-6c52173cc0d5
# ╠═6cc56a8a-f937-4735-9f5f-4162aec6c97c
# ╠═bfd1b44e-b63e-4644-bb91-f2e7d3a6d2eb
# ╠═664f2bc3-bd52-4240-9443-b2fcd7500f04
# ╠═960703e4-98b3-11eb-327d-e3640b19b7e8
