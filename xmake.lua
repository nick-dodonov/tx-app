add_rules("mode.debug", "mode.release")
includes("xmake/modules/tx_dep.lua")

tx_add_package_dep("tx-lib-shared")

target("tx-app")
    set_kind("binary")
    add_files("src/*.cpp")
    tx_add_target_dep("tx-lib-shared")

package("tx-lib-shared")
    add_urls("https://github.com/nick-dodonov/tx-lib-shared.git")

    --set_sourcedir(path.join(os.scriptdir(), "../tx-lib-shared"))
    --set_policy("package.install_always", true)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
