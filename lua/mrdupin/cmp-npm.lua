local cmp_npm_status_ok, cmp_npm = pcall(require, "cmp-npm")
if not cmp_npm_status_ok then
	vim.notify("cmp-npm not found ERROR!!", "error")
	return
end

cmp_npm.setup({
  ignore = {},
  only_semantic_versions = true,
})
