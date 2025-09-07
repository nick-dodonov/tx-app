add_rules("mode.debug", "mode.release")
includes("xmake/modules/tx_dep.lua")

tx_add_package_dep("tx-pkg-misc")

target("tx-app-demo")
    set_kind("binary")
    add_files("src/*.cpp")
    tx_add_target_dep("tx-pkg-misc")

package("tx-pkg-misc")
    add_urls("https://github.com/nick-dodonov/tx-pkg-misc.git")

    --set_sourcedir(path.join(os.scriptdir(), "../tx-pkg-misc"))
    --set_policy("package.install_always", true)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
