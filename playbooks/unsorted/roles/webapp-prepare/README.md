Same as 'webapp', but skips last step of symlinking the latest version and restarting Play!.

This helps us run the preparation in parallel for multiple hosts, and then when it comes to actually bouncing the app,
that can be done serially.
