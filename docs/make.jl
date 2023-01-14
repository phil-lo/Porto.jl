using Porto
using Documenter

DocMeta.setdocmeta!(Porto, :DocTestSetup, :(using Porto); recursive=true)

makedocs(;
    modules=[Porto],
    authors="Philippe Lacroix-Ouellette",
    repo="https://github.com/phil-lo/Porto.jl/blob/{commit}{path}#{line}",
    sitename="Porto.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://phil-lo.github.io/Porto.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/phil-lo/Porto.jl",
    devbranch="main",
)
