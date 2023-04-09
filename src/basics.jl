export treedecomp

"""
    Break down a quantum circuit into basic blocks
"""
function transpile(qc::AbstractBlock)
    trans_blocks = AbstractBlock[]
    for bb in Optimise.to_basictypes(qc)
        if !(typeof(bb) ∈ [ChainBlock, PutBlock, PrimitiveBlock])
            throw(ArgumentError("Circuit cannot be decomposed into basic blocks, got $typeof(bb)"))
        end
        for ib in subblocks(bb)
            push!(trans_blocks,ib)
        end
    end
    return trans_blocks
end

"""
    Convert a quantum circuit to a graph regardless of which qubits are measured
"""
function circ2graph(qc::AbstractBlock)
    n = nqubits(qc)
    transpiled_gates = transpile(qc)
    el = []
    # need to add initial states
    for g in transpiled_gates
        if typeof(g) == PrimitiveBlock
            push!(el, (g.qubits[1], g.qubits[2]))
        end
    end
    return SimpleGraph(Edge.[el])
end

struct Tree{T}

end


"""
    Performs the tree decomposition of a Graph

https://www.sciencedirect.com/science/article/pii/0095895684900133
"""
function treedecomp(G::AbstractGraph)

end
