local F = require('F')

H = {}

H.map = function(mode, mapping)
    for bind, opts in pairs(mapping) do
        local cmd, optionsPatch

	if type(opts) == 'string' then
        cmd, optionsPatch = opts, {}
	else
        cmd, optionsPatch = unpack(opts)
	end

        local options = F.merge({noremap = true}, optionsPatch)

        vim.api.nvim_set_keymap(mode, bind, cmd, options)
    end
end

return H
