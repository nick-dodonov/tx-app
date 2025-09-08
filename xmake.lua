add_rules("mode.debug", "mode.release")
set_languages("c++17")

add_repositories("tx-kit-repo " .. (os.getenv("TX_REPO") or "git@github.com:nick-dodonov/tx-kit-repo.git main"))
add_repositories("local-repo ./xmake")

add_requires("tx-kit")
includes(".xmake/tx-kit/includes")

add_requires("tx-pkg-misc")
add_requires("centurion")

target("tx-app-demo", function () 
    set_kind("binary")
    add_files("src/*.cpp")
    add_packages("tx-pkg-misc")
    add_packages("centurion")
end)
