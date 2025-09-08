package('tx-kit', function ()
    -- print(string.format([[tx-kit: package:
    -- os.curdir=%s
    -- os.projectdir=%s
    -- os.scriptdir=%s]], 
    --     os.curdir(), os.projectdir(), os.scriptdir()))

    set_kind("phony") -- OR headeronly
    -- set_policy("package.install_always", true)

    on_load(function (package)
        -- print(string.format([[tx-kit: on_load:
        -- package:is_toplevel=%s
        -- package:installdir=%s]], 
        --     tostring(package:is_toplevel()), 
        --     package:installdir())
        -- )

        local source_include_dir = path.join(os.scriptdir(), "includes")
        local target_include_dir = path.join(os.projectdir(), ".xmake", "tx-kit", "includes")
        local existing_link
        if os.exists(target_include_dir) then
            existing_link = os.readlink(target_include_dir)
            if existing_link and existing_link ~= source_include_dir then
                print('tx-kit: removing link', target_include_dir, '->', existing_link)
                os.rm(target_include_dir)
            end
        end

        -- https://xmake.io/api/scripts/builtin-modules/os.html#os-ln
        if not os.exists(target_include_dir) then
            print('tx-kit: creating link', target_include_dir, '->', source_include_dir)
            os.ln(source_include_dir, target_include_dir)
        else
            print('tx-kit: existing link', target_include_dir, '->', existing_link)
        end
    end)

    on_install(function (package)
        -- print('tx-kit: on_install')
    end)
end)
