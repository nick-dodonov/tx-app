add_rules("mode.debug", "mode.release")

--add_repositories("local-repo ./local-repo")
add_requires("tx-lib-shared")

target("tx-app")
    set_kind("binary")
    add_files("src/*.cpp")
    add_packages("tx-lib-shared")

package("tx-lib-shared")
    set_sourcedir(path.join(os.scriptdir(), "../tx-lib-shared"))
    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
