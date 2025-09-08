add_rules("mode.debug", "mode.release")

includes("xmake/includes/tx_kit")
tx_kit_add_repo("tx-kit-repo")
tx_kit_add_pkg_need("tx-pkg-misc")

target("tx-app-demo")
    set_kind("binary")
    add_files("src/*.cpp")
    tx_kit_add_pkg_deps("tx-pkg-misc")
