local lint_status_ok, lint = pcall(require, "lint")
if not lint_status_ok then
	vim.notify("lint not found!!", "error")
	return
end

lint.linters_by_ft = {
	markdown = { "eslint", "markdownlint", "golangcilint" },
}
