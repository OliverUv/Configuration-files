complete -c rustup -n "__fish_use_subcommand" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_use_subcommand" -s v -l verbose -d 'Enable verbose output'
complete -c rustup -n "__fish_use_subcommand" -s q -l quiet -d 'Disable progress output'
complete -c rustup -n "__fish_use_subcommand" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_use_subcommand" -f -a "dump-testament" -d 'Dump information about the build'
complete -c rustup -n "__fish_use_subcommand" -f -a "show" -d 'Show the active and installed toolchains or profiles'
complete -c rustup -n "__fish_use_subcommand" -f -a "install" -d 'Update Rust toolchains'
complete -c rustup -n "__fish_use_subcommand" -f -a "uninstall" -d 'Uninstall Rust toolchains'
complete -c rustup -n "__fish_use_subcommand" -f -a "update" -d 'Update Rust toolchains and rustup'
complete -c rustup -n "__fish_use_subcommand" -f -a "check" -d 'Check for updates to Rust toolchains'
complete -c rustup -n "__fish_use_subcommand" -f -a "default" -d 'Set the default toolchain'
complete -c rustup -n "__fish_use_subcommand" -f -a "toolchain" -d 'Modify or query the installed toolchains'
complete -c rustup -n "__fish_use_subcommand" -f -a "target" -d 'Modify a toolchain\'s supported targets'
complete -c rustup -n "__fish_use_subcommand" -f -a "component" -d 'Modify a toolchain\'s installed components'
complete -c rustup -n "__fish_use_subcommand" -f -a "override" -d 'Modify directory toolchain overrides'
complete -c rustup -n "__fish_use_subcommand" -f -a "run" -d 'Run a command with an environment configured for a given toolchain'
complete -c rustup -n "__fish_use_subcommand" -f -a "which" -d 'Display which binary will be run for a given command'
complete -c rustup -n "__fish_use_subcommand" -f -a "doc" -d 'Open the documentation for the current toolchain'
complete -c rustup -n "__fish_use_subcommand" -f -a "man" -d 'View the man page for a given command'
complete -c rustup -n "__fish_use_subcommand" -f -a "self" -d 'Modify the rustup installation'
complete -c rustup -n "__fish_use_subcommand" -f -a "set" -d 'Alter rustup settings'
complete -c rustup -n "__fish_use_subcommand" -f -a "completions" -d 'Generate tab-completion scripts for your shell'
complete -c rustup -n "__fish_use_subcommand" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from dump-testament" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from dump-testament" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from show" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from show" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from show" -f -a "active-toolchain" -d 'Show the active toolchain'
complete -c rustup -n "__fish_seen_subcommand_from show" -f -a "home" -d 'Display the computed value of RUSTUP_HOME'
complete -c rustup -n "__fish_seen_subcommand_from show" -f -a "profile" -d 'Show the current profile'
complete -c rustup -n "__fish_seen_subcommand_from show" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from active-toolchain" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from active-toolchain" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from home" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from home" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from profile" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from profile" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from install" -l no-self-update -d 'Don\'t perform self-update when running the `rustup install` command'
complete -c rustup -n "__fish_seen_subcommand_from install" -l force -d 'Force an update, even if some components are missing'
complete -c rustup -n "__fish_seen_subcommand_from install" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from install" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from update" -l no-self-update -d 'Don\'t perform self update when running the `rustup update` command'
complete -c rustup -n "__fish_seen_subcommand_from update" -l force -d 'Force an update, even if some components are missing'
complete -c rustup -n "__fish_seen_subcommand_from update" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from update" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from check" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from check" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from default" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from default" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -f -a "list" -d 'List installed toolchains'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -f -a "install" -d 'Install or update a given toolchain'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -f -a "uninstall" -d 'Uninstall a toolchain'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -f -a "link" -d 'Create a custom toolchain by symlinking to a directory'
complete -c rustup -n "__fish_seen_subcommand_from toolchain" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from list" -s v -l verbose -d 'Enable verbose output with toolchain information'
complete -c rustup -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from install" -s c -l component -d 'Add specific components on installation'
complete -c rustup -n "__fish_seen_subcommand_from install" -s t -l target -d 'Add specific targets on installation'
complete -c rustup -n "__fish_seen_subcommand_from install" -l no-self-update -d 'Don\'t perform self update when running the `rustup toolchain install` command'
complete -c rustup -n "__fish_seen_subcommand_from install" -l force -d 'Force an update, even if some components are missing'
complete -c rustup -n "__fish_seen_subcommand_from install" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from install" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from link" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from link" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from target" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from target" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from target" -f -a "list" -d 'List installed and available targets'
complete -c rustup -n "__fish_seen_subcommand_from target" -f -a "add" -d 'Add a target to a Rust toolchain'
complete -c rustup -n "__fish_seen_subcommand_from target" -f -a "remove" -d 'Remove a target from a Rust toolchain'
complete -c rustup -n "__fish_seen_subcommand_from target" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from list" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from list" -l installed -d 'List only installed targets'
complete -c rustup -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from add" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from add" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from add" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from remove" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from remove" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from component" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from component" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from component" -f -a "list" -d 'List installed and available components'
complete -c rustup -n "__fish_seen_subcommand_from component" -f -a "add" -d 'Add a component to a Rust toolchain'
complete -c rustup -n "__fish_seen_subcommand_from component" -f -a "remove" -d 'Remove a component from a Rust toolchain'
complete -c rustup -n "__fish_seen_subcommand_from component" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from list" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from list" -l installed -d 'List only installed components'
complete -c rustup -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from add" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from add" -l target
complete -c rustup -n "__fish_seen_subcommand_from add" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from add" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from remove" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from remove" -l target
complete -c rustup -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from remove" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from override" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from override" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from override" -f -a "list" -d 'List directory toolchain overrides'
complete -c rustup -n "__fish_seen_subcommand_from override" -f -a "set" -d 'Set the override toolchain for a directory'
complete -c rustup -n "__fish_seen_subcommand_from override" -f -a "unset" -d 'Remove the override toolchain for a directory'
complete -c rustup -n "__fish_seen_subcommand_from override" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from set" -l path -d 'Path to the directory'
complete -c rustup -n "__fish_seen_subcommand_from set" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from set" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from unset" -l path -d 'Path to the directory'
complete -c rustup -n "__fish_seen_subcommand_from unset" -l nonexistent -d 'Remove override toolchain for all nonexistent directories'
complete -c rustup -n "__fish_seen_subcommand_from unset" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from unset" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from run" -l install -d 'Install the requested toolchain if needed'
complete -c rustup -n "__fish_seen_subcommand_from run" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from run" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from which" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from which" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from which" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l path -d 'Only print the path to the documentation'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l alloc -d 'The Rust core allocation and collections library'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l book -d 'The Rust Programming Language book'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l cargo -d 'The Cargo Book'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l core -d 'The Rust Core Library'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l edition-guide -d 'The Rust Edition Guide'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l nomicon -d 'The Dark Arts of Advanced and Unsafe Rust Programming'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l proc_macro -d 'A support library for macro authors when defining new macros'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l reference -d 'The Rust Reference'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l rust-by-example -d 'A collection of runnable examples that illustrate various Rust concepts and standard libraries'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l rustc -d 'The compiler for the Rust programming language'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l rustdoc -d 'Generate documentation for Rust projects'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l std -d 'Standard library API documentation'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l test -d 'Support code for rustc\'s built in unit-test and micro-benchmarking framework'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l unstable-book -d 'The Unstable Book'
complete -c rustup -n "__fish_seen_subcommand_from doc" -l embedded-book -d 'The Embedded Rust Book'
complete -c rustup -n "__fish_seen_subcommand_from doc" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from doc" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from man" -l toolchain -d 'Toolchain name, such as \'stable\', \'nightly\', or \'1.8.0\'. For more information see `rustup help toolchain`'
complete -c rustup -n "__fish_seen_subcommand_from man" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from man" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from self" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from self" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from self" -f -a "update" -d 'Download and install updates to rustup'
complete -c rustup -n "__fish_seen_subcommand_from self" -f -a "uninstall" -d 'Uninstall rustup.'
complete -c rustup -n "__fish_seen_subcommand_from self" -f -a "upgrade-data" -d 'Upgrade the internal data format.'
complete -c rustup -n "__fish_seen_subcommand_from self" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from update" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from update" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s y
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from uninstall" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from upgrade-data" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from upgrade-data" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from set" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from set" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from set" -f -a "default-host" -d 'The triple used to identify toolchains when not specified'
complete -c rustup -n "__fish_seen_subcommand_from set" -f -a "profile" -d 'The default components installed'
complete -c rustup -n "__fish_seen_subcommand_from set" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c rustup -n "__fish_seen_subcommand_from default-host" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from default-host" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from profile" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from profile" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Prints version information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c rustup -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
