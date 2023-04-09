using Graphs, Revise
using GLMakie, GraphMakie
using Yao, YaoExtensions
include("../src/TinySim.jl")
using .TinySim

n_qubits = 10
circ = qft_circuit(n_qubits)

my_g = random_regular_graph(10, 3)

graphplot(my_g)

graph2tree(my_g)
