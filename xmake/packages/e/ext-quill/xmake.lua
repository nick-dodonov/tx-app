-- https://xmake.io/api/description/package-dependencies.html#set-base
package("ext-quill")
    set_base("quill")
    add_versions("v10.1.0", "840f8171cba1d4f31db9bd2de1a3808f33082832420b2ea19962f05a59359ce9")
    -- debug set_policy("package.install_always", true)

    on_install("wasm", function (package)
        local configs = {"-DQUILL_ENABLE_INSTALL=ON"}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DQUILL_NO_EXCEPTIONS=" .. (package:config("noexcept") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)
package_end()
