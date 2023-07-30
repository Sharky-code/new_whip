local M = {}

local split = function (inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          table.insert(t, str)
  end
  return t
end

M.runfile = function(input1, input2)
	-- TODO: try and do this with an for loop. im not good with lua :(
	input1 = string.gsub(input1, "\\\\", "\\\\\\\\")
	input1 = string.gsub(input1, " ", "\\\\ ")
	input1 = string.gsub(input1, "%(", "\\\\%(")
	input1 = string.gsub(input1, "%)", "\\\\%)")

	input2 = string.gsub(input2, "\\\\", "\\\\\\\\")
	input2 = string.gsub(input2, " ", "\\\\ ")
	input2 = string.gsub(input2, "%(", "\\\\%(")
	input2 = string.gsub(input2, "%)", "\\\\%)")

	vim.cmd(':w')

	if vim.bo.filetype == "python" then
		vim.cmd(string.format(":TermExec cmd=';python3 %s'", input1))
	elseif vim.bo.filetype == "cpp" then
		local file_exec = split(input1, ".")
		local arg = vim.fn.input("Input arguments: ")
		vim.cmd(string.format(":TermExec cmd=';g++ -std=c++20 -o %s %s %s; ./%s'", file_exec[#file_exec - 1], input2, arg, file_exec[#file_exec - 1]))
		elseif vim.bo.filetype == "lua" then
		vim.cmd(string.format(":TermExec cmd='lua %s'", input1))
	else
		print("your file cannot be run with this plugin")
	end

end

return M
