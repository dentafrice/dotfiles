on run {the_task, the_content}
    tell application "OmniFocus"
        tell first document
            set NewTask to make new inbox task with properties {name:the_task, note:the_content}
        end tell
    end tell
end run
