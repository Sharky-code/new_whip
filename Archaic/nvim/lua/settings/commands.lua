-- COMMANDS.LUA

vim.cmd([[
command! CMakeInit :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 nvim CMakeLists.txt; cmake init .; echo "CMake has been initiated"<CR>
command! CMakeBuild :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 cmake --build .;<CR>
command! CMakeBuild :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 cmake --build .;<CR>

command! -nargs=1 CargoNew :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 cargo new <args><CR>
command! CargoInit :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 cargo init .<CR>
command! CargoBuild :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 cargo build <CR>

command! -nargs=1 PythonVenvCreate :AsyncRun -mode=term -pos=bottom -rows=10 -raw -save=1 python3.9 -m venv <args><CR>
]])
