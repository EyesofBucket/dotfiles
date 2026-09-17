return {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    config = function()
        require("nvim-web-devicons").set_icon_by_filetype({
            ["yaml.gitlab"] = ".gitlab-ci.yml",
        })
    end,
}
