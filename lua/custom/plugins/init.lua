-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	config = function() require('competitest').setup{
        local_config_file_name = ".competitest.lua",
        floating_border = "rounded",
        floating_border_highlight = "FloatBorder",
        picker_ui = {
            width = 0.2,
            height = 0.3,
            mappings = {
                focus_next = { "j", "<down>", "<Tab>" },
                focus_prev = { "k", "<up>", "<S-Tab>" },
                close = { "<esc>", "<C-c>", "q", "Q" },
                submit = { "<cr>" },
            },
        },
        editor_ui = {
            popup_width = 0.4,
            popup_height = 0.6,
            show_nu = true,
            show_rnu = false,
            normal_mode_mappings = {
                switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                save_and_close = "<C-s>",
                cancel = { "q", "Q" },
            },
            insert_mode_mappings = {
                switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                save_and_close = "<C-s>",
                cancel = "<C-q>",
            },
        },
        runner_ui = {
            interface = "popup",
            selector_show_nu = false,
            selector_show_rnu = false,
            show_nu = true,
            show_rnu = false,
            mappings = {
                run_again = "R",
                run_all_again = "<C-r>",
                kill = "K",
                kill_all = "<C-k>",
                view_input = { "i", "I" },
                view_output = { "a", "A" },
                view_stdout = { "o", "O" },
                view_stderr = { "e", "E" },
                toggle_diff = { "d", "D" },
                close = { "q", "Q" },
            },
            viewer = {
                width = 0.5,
                height = 0.5,
                show_nu = true,
                show_rnu = false,
                close_mappings = { "q", "Q" },
            },
        },
        popup_ui = {
            total_width = 0.8,
            total_height = 0.8,
            layout = {
                { 4, "tc" },
                { 5, { { 1, "so" }, { 1, "si" } } },
                { 5, { { 1, "eo" }, { 1, "se" } } },
            },
        },
        split_ui = {
            position = "right",
            relative_to_editor = true,
            total_width = 0.3,
            vertical_layout = {
                { 1, "tc" },
                { 1, { { 1, "so" }, { 1, "eo" } } },
                { 1, { { 1, "si" }, { 1, "se" } } },
            },
            total_height = 0.4,
            horizontal_layout = {
                { 2, "tc" },
                { 3, { { 1, "so" }, { 1, "si" } } },
                { 3, { { 1, "eo" }, { 1, "se" } } },
            },
        },

        save_current_file = true,
        save_all_files = false,
        compile_directory = ".",
        compile_command = {
            cpp = {
                exec = "g++",
                args = { 
                    "-Wall", 
                    "-Wextra", 
                    "-Wshadow", 
                    "-o", "a",  -- Output binary name
                    "-static-libstdc++", 
                    "-std=c++20", 
                    "-DMISAKA", 
                    "./$(FNAME)"  -- Source file
                }
            },
        },
        running_directory = ".",
        run_command = {
            cpp = { exec = "./a" },
        },
        multiple_testing = -1,
        maximum_time = tonumber("$(TIMELIM)"),
        output_compare_method = "squish",
        view_output_diff = false,

        testcases_directory = "./testcases",
        testcases_use_single_file = false,
        testcases_auto_detect_storage = true,
        testcases_single_file_format = "$(FNOEXT).testcases",
        testcases_input_file_format = "input$(TCNUM).txt",
        testcases_output_file_format = "output$(TCNUM).txt",

        companion_port = 27121,
        receive_print_message = true,
        template_file = "$(HOME)/OneDrive/Documents/competitve-programming/lib/atcoder.cpp",
        evaluate_template_modifiers = true,
        date_format = "%c",
        received_files_extension = "cpp",
        received_problems_path = function(task, file_extension)
            -- Extract the problem identifier from the name (e.g., "G. Castle Defense" -> "g")
            local problem_letter = string.match(task.name, "^%u")
            if not problem_letter then
                -- Default to using the task name if a letter isn't found
                problem_letter = "unknown"
            else
                -- Convert the problem letter to lowercase (e.g., "G" -> "g")
                problem_letter = string.lower(problem_letter)
            end
        
            -- Construct the path with the problem letter as the filename
            return string.format("%s.%s",
                problem_letter,
                file_extension
            )
        end,
        received_problems_prompt_path = true,
        received_contests_directory = "$(HOME)/OneDrive/Documents/competitve-programming/atcoder/$(CONTEST)",
        received_contests_problems_path = "$(HOME)/OneDrive/Documents/competitve-programming/atcoder/$(CONTEST)/$(PROBLEM).cpp",
        received_contests_prompt_directory = true,
        received_contests_prompt_extension = true,
        open_received_problems = true,
        open_received_contests = true,
        replace_received_testcases = false,
    } end,
}
