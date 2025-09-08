-- Extended dependency management, allows using local pkg repos for develop
--  xmake f -cy && xmake run -yv                # clean/configure/run using remote pkg repos
--  xmake f -cy --use_local=1 && xmake run -yv  # clean/configure/run for local pkg repos
local USE_LOCAL = "use_local"
option(USE_LOCAL, {default = false})

function tx_kit_add_repo(name)
    if has_config(USE_LOCAL) then
        add_repositories(name, "../" .. name)
    else
        add_repositories(name, "git@github.com:nick-dodonov/" .. name .. ".git")
    end
end

function tx_kit_add_pkg_need(name)
    if has_config(USE_LOCAL) then
        includes(os.scriptdir() .. "/../" .. name)
    else
        add_requires(name, {system = false})
    end
end

function tx_kit_add_pkg_deps(name)
    if has_config(USE_LOCAL) then
        add_deps(name)
    else
        add_packages(name)
    end
end
