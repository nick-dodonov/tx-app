-- tx_xdep.lua: локальный модуль для управления зависимостями
-- 
-- clean/configure/run for remote: xmake f -cy && xmake run -yv
-- clean/configure/run for local: xmake f -cy --use_local=1 && xmake run -yv

local USE_LOCAL = "use_local"
option(USE_LOCAL, {default = false})

function tx_add_package_dep(name)
    if has_config(USE_LOCAL) then
        includes("../" .. name)
    else
        add_requires(name, {system = false})
    end
end

function tx_add_target_dep(name)
    if has_config(USE_LOCAL) then
        add_deps(name)
    else
        add_packages(name)
    end
end
