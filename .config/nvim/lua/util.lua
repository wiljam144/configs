function MapTable(table)
  for mapping = 1, #table do
    vim.api.nvim_set_keymap(
      "n",
      table[mapping][1],
      table[mapping][2],
      {noremap = true, silent = true}
    )
  end
end

vim.api.nvim_create_user_command("Algo", function()
  vim.api.nvim_buf_set_lines(0, 0, 0, true, {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "",
    "typedef long long ll;",
    "",
    "int main() {",
    "    ios_base::sync_with_stdio(0);",
    "    cin.tie(nullptr);",
    "    cout.tie(nullptr);",
    "",
    "",
    "}"
  })
end, {})

vim.api.nvim_create_user_command("CompileCpp", function()
  local current_file = vim.fn.expand('%');
  local substr = string.sub(current_file, 1, -5);
  os.execute("tmux split-window -h && tmux send-keys \"g++ -Wall -Wextra -Wpedantic -std=c++20 -o " .. substr .. " " .. current_file .. "\"" .. " Enter")
end, {})

