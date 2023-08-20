-- install gotags with -> go install github.com/jstemmer/gotags@v1.4.1
-- <leader>m  to view the struct symbols
return {
  'crusj/structrue-go.nvim',
  branch = "main",
  config = function()
    require "structrue-go".setup()
  end
}
