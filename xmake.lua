add_rules("mode.debug", "mode.release")
set_languages("c++17")

-- add_repositories("local-repo ./xmake")
add_repositories("tx-kit-repo " .. (os.getenv("TX_REPO") or "git@github.com:nick-dodonov/tx-kit-repo.git main"))
add_requires("tx-kit")
includes(".xmake/tx-kit/includes")

add_requires("tx-pkg-misc")

-- !!!! dependency propagation doesn't work for packages mode =(
add_requires("tx-pkg-aux")
add_requires("lwlog")

target("tx-app-demo", function () 
    set_kind("binary")
    add_files("src/*.cpp")

    add_packages("tx-pkg-misc")

    -- !!!! dependency propagation doesn't work for packages mode and source mode =(
    add_packages("tx-pkg-aux")
    add_packages("lwlog")
end)
