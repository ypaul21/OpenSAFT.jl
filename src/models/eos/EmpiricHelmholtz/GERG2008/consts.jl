const GERG2008constsProps = (
names =[
        "methane"
        "nitrogen"
        "carbon dioxide",
        "ethane",
        "propane",
        "butane",
        "isobutane",
        "pentane",
        "isopentane",
        "hexane",
        "heptane",
        "octane",
        "nonane",
        "decane",
        "hydrogen",
        "oxygen",
        "carbon monoxide",
        "water",
        "hydrogen sulfide",
        "helium",
        "argon"
        ],    

acentric_factor = [
        0.0115478,
        0.0377215,
        0.223621,
        0.099493,
        0.152291,
        0.200164,
        0.183521,
        0.251506,
        0.227875,
        0.301261,
        0.349469,
        0.399552,
        0.44346,
        0.492328,
        -0.215993,
        0.0221798,
        0.0481621,
        0.344861,
        0.0941677,
        -0.390032,
        0.0,
    ],
    molecularWeight = [
        16.04246,
        28.0134,
        44.0095,
        30.06904,
        44.09562,
        58.1222,
        58.1222,
        72.14878,
        72.14878,
        86.17536,
        100.20194,
        114.22852,
        128.2551,
        142.28168,
        2.01588,
        31.9988,
        28.0101,
        18.01528,
        34.08088,
        4.002602,
        39.948,
    ],
    criticalTemperature = [
        190.564,
        126.192,
        304.1282,
        305.322,
        369.825,
        407.817,
        425.125,
        460.35,
        469.7,
        507.82,
        540.13,
        569.32,
        594.55,
        617.7,
        33.19,
        154.595,
        132.86,
        647.096,
        373.1,
        5.1953,
        150.687,
    ],
    criticalDensity = [
        10.139342719,
        11.1839,
        10.624978698,
        6.87085454,
        5.000043088,
        3.86014294,
        3.920016792,
        3.271,
        3.215577588,
        2.705877875,
        2.315324434,
        2.056404127,
        1.81,
        1.64,
        14.94,
        13.63,
        10.85,
        17.87371609,
        10.19,
        17.399,
        13.407429659,
    ], #molar density, in mol/dm3
    criticalPressure = [
        4599000.,
        3400000.,
        7383000.,
        4872000.,
        4248000.,
        3796000.,
        3640000.,
        3370000.,
        3380000.,
        3025000.,
        2740000.,
        2490000.,
        2290000.,
        2110000.,
        1313000.,
        5043000.,
        3499000.,
        22064000.,
        8962910.,
        117000.,
        4898000.,
    ]#critical pressure, Pa
)


function GERG2008_xsel(names::Vector{String})

symvalues = GERG2008constsProps.names
    xsel = Vector{Int}()
    for i in names
        i in symvalues || throw(ArgumentError("invalid name: $i"))
        push!(xsel, findall(isequal(i), symvalues)[1])

    end
    if iszero(length(xsel))
        return ArgumentError("no match found for input components. valid components are: $(GERG2008constsProps.names)")
    else
        return xsel
    end
end