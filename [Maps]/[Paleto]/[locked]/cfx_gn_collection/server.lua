--! Please keep this file to stay tuned about all our updates!

local git_versions
local gn_resources = {}
local isGnEnv = GetConvarInt('isGnEnv', 0) == 1
local GITHUB_URL = 'https://raw.githubusercontent.com/G-N-s-Studio/gn_versions/main/versions.json'

local function loadVersions()
    PerformHttpRequest(GITHUB_URL, function(status, response)
        if status ~= 200 then return end
        git_versions = json.decode(response)
    end, 'GET')
end

local function isGnResource(resourceName)
    local author = GetResourceMetadata(resourceName, 'author', 0)
    return author and author:find('G&N') and resourceName:find('gn_')
end

local function checkResources()
    loadVersions()

    local timeout = 1000
    while not git_versions and timeout > 0 do
        Wait(0)
        timeout -= 1
    end

    if not git_versions then return end

    local resourcesCount = GetNumResources()

    for i = 1, resourcesCount do
        local resource = GetResourceByFindIndex(i)
        local latestVersion = git_versions[resource]

        if resource and latestVersion and isGnResource(resource) then
            local currentVersion = GetResourceMetadata(resource, 'version', 0)

            if currentVersion and currentVersion < latestVersion then
                local msg = "^3・[G&N's Studio] v%s is available for ^5%s^3 (current version: %s)\r\n・Download it here: ^5%s^7"
                print(msg:format(latestVersion, resource, currentVersion, 'https://keymaster.fivem.net/'))
            end

            gn_resources[#gn_resources + 1] = resource

        elseif isGnEnv and resource and isGnResource(resource) and not latestVersion then
            print("^5[G&N's Studio]^6[DEV] ^3No latest version found for " .. resource .. "^7")
        end
    end

    if #gn_resources == 0 then
        print("^1[^7G&N's Studio^1] You're running ^5cfx_gn_collection^1 but no map resources are using it!^7")
    end
end

CreateThread(checkResources)
