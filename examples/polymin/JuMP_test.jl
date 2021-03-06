#=
Copyright (c) 2018-2022 Chris Coey, Lea Kapelevich, and contributors

This Julia package Hypatia.jl is released under the MIT license; see LICENSE
file in the root directory or at https://github.com/chriscoey/Hypatia.jl
=#

insts = OrderedDict()
insts["minimal"] = [
    ((1, 2, true, true),),
    ((1, 2, false, true),),
    ((1, 2, false, false),),
    ((:lotkavolterra, 3, true, true),),
    ((:motzkin_ellipsoid, 3, false, true),),
    ((:schwefel_ball, 2, false, false),),
    ]
insts["fast"] = [
    ((1, 3, true, true),),
    ((1, 30, true, true),),
    ((1, 30, false, true),),
    ((1, 30, false, false),),
    ((2, 8, true, true),),
    ((3, 6, true, true),),
    ((5, 3, true, true),),
    ((10, 1, true, true),),
    ((10, 1, false, true),),
    ((10, 1, false, false),),
    ((4, 4, true, true),),
    ((4, 4, false, true),),
    ((4, 4, false, false),),
    ((:butcher, 2, true, true),),
    ((:caprasse, 4, true, true),),
    ((:goldsteinprice, 7, true, true),),
    ((:goldsteinprice_ball, 6, true, true),),
    ((:goldsteinprice_ellipsoid, 7, true, true),),
    ((:heart, 2, true, true),),
    ((:lotkavolterra, 3, true, true),),
    ((:magnetism7, 2, true, true),),
    ((:magnetism7_ball, 2, true, true),),
    ((:motzkin, 3, true, true),),
    ((:motzkin_ball, 3, true, true),),
    ((:motzkin_ellipsoid, 3, true, true),),
    ((:reactiondiffusion, 4, true, true),),
    ((:robinson, 8, true, true),),
    ((:robinson_ball, 8, true, true),),
    ((:rosenbrock, 5, true, true),),
    ((:rosenbrock_ball, 5, true, true),),
    ((:schwefel, 2, true, true),),
    ((:schwefel_ball, 2, true, true),),
    ((:lotkavolterra, 3, false, true),),
    ((:motzkin, 3, false, true),),
    ((:motzkin_ball, 3, false, true),),
    ((:schwefel, 2, false, true),),
    ((:lotkavolterra, 3, false, false),),
    ((:motzkin, 3, false, false),),
    ((:motzkin_ball, 3, false, false),),
    ]
insts["various"] = [
    ((4, 5, true, true),),
    ((3, 5, true, false),),
    ((4, 5, false, true),),
    ((4, 5, false, false),),
    ((:butcher, 2, true, true),),
    ((:caprasse, 4, true, true),),
    ((:goldsteinprice, 7, true, true),),
    ((:heart, 2, true, true),),
    ((:lotkavolterra, 3, true, true),),
    ((:magnetism7, 2, true, true),),
    ((:motzkin, 3, true, true),),
    ((:reactiondiffusion, 4, true, true),),
    ((:robinson, 8, true, true),),
    ((:rosenbrock, 5, true, true),),
    ((:schwefel, 2, true, true),),
    ]
return (PolyMinJuMP, insts)
