require("which-key").add({
  {
    "<leader>z",
    group = "zettelkasten",
  },
})
return {
  {
    "epwalsh/obsidian.nvim",
    event = "BufRead */zettelkasten/**/*.md",
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/zettelkasten",
        },
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          suffix = title:gsub(" ", "-")
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        -- return tostring(os.time()) .. "-" .. suffix
        -- return tostring(os.date("%Y%m%d%H%M%S")) .. " " .. suffix
        return suffix
      end,
      wiki_link_func = use_alias_only,
      templates = {
        subdir = "templates",
      },
      daily_notes = {
        folder = "daily",
        template = "daily.md",
      },
      ui = {
        enable = false,
      },
      completion = {
        nvim_cmp = true,
        -- nvim_cmp = false,
      },
    },
    keys = {
      {
        "<leader>zn",
        "<Cmd>ObsidianNew<CR>",
        desc = "New Note",
      },
      {
        "<leader>zt",
        "<Cmd>ObsidianTemplate<CR>",
        desc = "Insert Note's Template",
      },
      {
        "<leader>zb",
        "<Cmd>ObsidianBacklinks<CR>",
        desc = "Shows Note's Backlinks",
      },
      {
        "<leader>zd",
        "<Cmd>ObsidianToday<CR>",
        desc = "Daily Note (Today)",
      },
      {
        "<leader>zy",
        "<Cmd>ObsidianToday -1<CR>",
        desc = "Daily Note (Yest.)",
      },
    },
  },
}
