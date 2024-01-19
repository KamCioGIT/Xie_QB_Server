Config = {}

Config.Ver = 'QBCore' --ESX or QBCore

Config.KeyOpen = false --if true, player can press key to open menu
Config.Key = 'F7' --set the open menu keybind

Config.Admin = 'admin' --set admin name for manage the guidebook. if ESX in sql group, if QBCore using QBCore.Functions.HasPermission

Config.Language = {
    create_faild = '创建失败, 请先创建主页面再创建子页面',
    must_number = '页码必须为数字!',
    delete_success = '删除成功!页面ID:',
    delete_failed = '删除失败!',
    create_success = '创建成功,重新打开后可见',
}

--[[ Config.Language = {
    create_faild = 'Failure to create, please create the homepage first and then create a sub page',
    must_number = 'Page number must be numbers!',
    delete_success = 'Delete success! Page ID:',
    delete_failed = 'failed to delete!',
    create_success = 'The creation is successful, it can be seen after reopening',
} ]]