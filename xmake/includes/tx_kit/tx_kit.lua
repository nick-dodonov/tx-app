-- Extended dependency management, allows using local pkg repos for develop
local KEY_REPO = "TX_LOCAL_REPO"
local KEY_PKG = "TX_LOCAL_PKG"

option(KEY_REPO, {default = os.getenv(KEY_REPO)})
option(KEY_PKG, {default = os.getenv(KEY_PKG)})

function tx_kit_add_repo(name)
    if has_config(KEY_REPO) then
        add_repositories(name .. " ../" .. name)
    else
        add_repositories(name .. " git@github.com:nick-dodonov/" .. name .. ".git")
    end
end

function tx_kit_add_pkg_need(name)
    if has_config(KEY_PKG) then
        includes(os.scriptdir() .. "/../" .. name)
    else
        add_requires(name, {system = false})
    end
end

function tx_kit_add_pkg_deps(name)
    if has_config(KEY_PKG) then
        add_deps(name)
    else
        add_packages(name)
    end
end
