-- bootstrap the compiler

local fennel = require("lib.fennel").install({
	correlate = true,
	moduleName = "lib.fennel",
})

local make_love_searcher = function(env)
	return function(module_name)
		local path = module_name:gsub("%.", "/") .. ".fnl"
		if love.filesystem.getInfo(path) then
			return function(...)
				local code = love.filesystem.read(path)
				return fennel.eval(code, { env = env }, ...)
			end,
				path
		end
	end
end

table.insert(package.loaders, make_love_searcher(_G))
table.insert(fennel["macro-searchers"], make_love_searcher("_COMPILER"))

require("wrap")
