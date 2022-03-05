#=
Copyright (c) 2018-2022 Chris Coey, Lea Kapelevich, and contributors

This Julia package Hypatia.jl is released under the MIT license; see LICENSE
file in the root directory or at https://github.com/chriscoey/Hypatia.jl
=#

insts = OrderedDict()
insts["minimal"] = [
    ((2, 2),),
    ((2, 2), :ExpPSD),
    ((2, 2), :SOCExpPSD),
    ]
insts["fast"] = [
    ((3, 4),),
    ((3, 4), :ExpPSD),
    ((3, 4), :SOCExpPSD),
    ((10, 3),),
    ((5, 3), :ExpPSD),
    ((5, 3), :SOCExpPSD),
    ]
insts["various"] = [
    ((10, 20),),
    ((10, 15), :ExpPSD),
    ((10, 15), :SOCExpPSD),
    ((10, 25),),
    ((10, 20), :ExpPSD),
    ((10, 20), :SOCExpPSD),
    ((10, 30),),
    ]
return (MatrixCompletionJuMP, insts)
