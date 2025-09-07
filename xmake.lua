add_rules("mode.debug", "mode.release")

option("use_local_src", {default = false})

function tx_add_package_dep(name)
    if has_config("use_local_src") then
        includes("../" .. name)
    else
        add_requires(name, {system = false})
    end
end

function tx_add_target_dep(name)
    if has_config("use_local_src") then
        add_deps(name)
    else
        add_packages(name)
    end
end

tx_add_package_dep("tx-lib-shared")

target("tx-app")
    set_kind("binary")
    add_files("src/*.cpp")
    tx_add_target_dep("tx-lib-shared")

package("tx-lib-shared")
    set_sourcedir(path.join(os.scriptdir(), "../tx-lib-shared"))
    --add_urls("https://github.com/nick-dodonov/tx-lib-shared.git")
    --set_policy("package.install_always", true)
    on_install(function (package)
        import("package.tools.xmake").install(package)
        --package:installdeps(os.files(path.join(package:sourcebase(), "src/**")))
    end)
