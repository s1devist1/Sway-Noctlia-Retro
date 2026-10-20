# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_himalaya_global_optspecs
    string join \n c/config= a/account= b/backend= json log-level= log-file= h/help V/version
end

function __fish_himalaya_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_himalaya_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_himalaya_using_subcommand
    set -l cmd (__fish_himalaya_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c himalaya -n "__fish_himalaya_needs_command" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_needs_command" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_needs_command" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_needs_command" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_needs_command" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_needs_command" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_needs_command" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "mailbox" -d 'Manage mailboxes using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "mbox" -d 'Manage mailboxes using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "envelope" -d 'Manage envelopes using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "flag" -d 'Manage flags using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "message" -d 'Manage messages using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "msg" -d 'Manage messages using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "attachment" -d 'Manage attachments using the shared API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "imap" -d 'IMAP-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "jmap" -d 'JMAP-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "gmail" -d 'Gmail-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "msgraph" -d 'Microsoft Graph CLI'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "maildir" -d 'Maildir-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "m2dir" -d 'M2dir-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "smtp" -d 'SMTP-specific API'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "configure" -d 'Configure an account interactively'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "wizard" -d 'Configure an account interactively'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "account" -d 'Manage accounts defined in the TOML configuration file'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "completion" -d 'Generate completion script for the give shell(s) to the given directory'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "manual" -d 'Generate manual pages to the given directory'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "json-schema" -d 'Generate JSON Schemas of every command\'s JSON output to the given directory'
complete -c himalaya -n "__fish_himalaya_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -f -a "list" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -f -a "ls" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and not __fish_seen_subcommand_from list ls help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -l counts -d 'Populate per-mailbox message counts (TOTAL and UNREAD columns)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -l counts -d 'Populate per-mailbox message counts (TOTAL and UNREAD columns)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from ls" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from help" -f -a "list" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mailbox; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -f -a "list" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -f -a "ls" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and not __fish_seen_subcommand_from list ls help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -l counts -d 'Populate per-mailbox message counts (TOTAL and UNREAD columns)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -l counts -d 'Populate per-mailbox message counts (TOTAL and UNREAD columns)'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from ls" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from help" -f -a "list" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand mbox; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -f -a "list" -d 'List envelopes for the active account, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -f -a "ls" -d 'List envelopes for the active account, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -f -a "search" -d 'Search envelopes for the active account using the shared search query DSL, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -f -a "sr" -d 'Search envelopes for the active account using the shared search query DSL, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and not __fish_seen_subcommand_from list ls search sr help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s p -l page -d 'Page number, starting from 1. The most recent envelopes are on page 1' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s s -l page-size -d 'Maximum number of envelopes per page' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s r -l recipient -d 'Render recipients (`To:`) instead of senders (`From:`). Useful for sent folders'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -l has-attachment -d 'Populate the ATT column. Depending on the backend this can cost an extra lookup per envelope, so it is opt-in'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s p -l page -d 'Page number, starting from 1. The most recent envelopes are on page 1' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s s -l page-size -d 'Maximum number of envelopes per page' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s r -l recipient -d 'Render recipients (`To:`) instead of senders (`From:`). Useful for sent folders'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -l has-attachment -d 'Populate the ATT column. Depending on the backend this can cost an extra lookup per envelope, so it is opt-in'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from ls" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s p -l page -d 'Page number, starting from 1' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s s -l page-size -d 'Maximum number of envelopes per page' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s r -l recipient -d 'Render recipients (`To:`) instead of senders (`From:`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -l has-attachment -d 'Populate the ATT column'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from search" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s p -l page -d 'Page number, starting from 1' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s s -l page-size -d 'Maximum number of envelopes per page' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s w -l max-width -d 'Maximum width of the rendered table, in terminal columns' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s r -l recipient -d 'Render recipients (`To:`) instead of senders (`From:`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -l has-attachment -d 'Populate the ATT column'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from sr" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from help" -f -a "list" -d 'List envelopes for the active account, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search envelopes for the active account using the shared search query DSL, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand envelope; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -f -a "add" -d 'Add flag(s) to message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -f -a "set" -d 'Replace flag(s) of message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -f -a "remove" -d 'Remove flag(s) from message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -f -a "rm" -d 'Remove flag(s) from message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and not __fish_seen_subcommand_from add set remove rm help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s f -l flag -d 'Flag(s) to apply. Repeat the option to pass several (e.g. `-f seen -f flagged`)' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from add" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s f -l flag -d 'Flag(s) to apply. Repeat the option to pass several (e.g. `-f seen -f flagged`)' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s f -l flag -d 'Flag(s) to apply. Repeat the option to pass several (e.g. `-f seen -f flagged`)' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from remove" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s f -l flag -d 'Flag(s) to apply. Repeat the option to pass several (e.g. `-f seen -f flagged`)' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from rm" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add flag(s) to message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from help" -f -a "set" -d 'Replace flag(s) of message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove flag(s) from message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand flag; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "add" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "save" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "compose" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "write" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "copy" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "cp" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "delete" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "rm" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "forward" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "fwd" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "move" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "mv" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "read" -d 'Read a message from the active account (built-in flag reader)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "reply" -d 'Reply to a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "send" -d 'Send a message via the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s m -l mailbox -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s f -l flag -d 'Flag(s) to set on the new message. Optional' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -l send -d 'Send the message after appending it. Combines with the mandatory `--mailbox` to save-then-send'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from add" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s m -l mailbox -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s f -l flag -d 'Flag(s) to set on the new message. Optional' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -l send -d 'Send the message after appending it. Combines with the mandatory `--mailbox` to save-then-send'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from save" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l body-file -d 'Read the body from a file. Mutually exclusive with `--body` and stdin' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l signature-file -d 'Read the signature from a file. Mutually exclusive with `--signature`' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l save -d 'Append a copy of the composed message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l send -d 'Send the composed message through the account\'s SMTP/JMAP path. Combines with `--save` to also keep a copy'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from compose" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l body-file -d 'Read the body from a file. Mutually exclusive with `--body` and stdin' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l signature-file -d 'Read the signature from a file. Mutually exclusive with `--signature`' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l save -d 'Append a copy of the composed message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l send -d 'Send the composed message through the account\'s SMTP/JMAP path. Combines with `--save` to also keep a copy'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from write" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from copy" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from cp" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from rm" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user; write your message inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from forward" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user; write your message inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from fwd" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from move" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from mv" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -l raw -d 'Write the raw RFC 5322 bytes to stdout. With the global `--json` flag the bytes are emitted as a JSON `{ "message": "…" }` string instead, keeping the output valid JSON'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -l seen -d 'Mark the message as seen while reading it. Without this flag the read leaves the seen state untouched'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from read" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user — write your reply inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from reply" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -l save -d 'Append a copy of the sent message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from send" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "compose" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "copy" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "forward" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "move" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "read" -d 'Read a message from the active account (built-in flag reader)'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "reply" -d 'Reply to a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "send" -d 'Send a message via the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand message; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "add" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "save" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "compose" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "write" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "copy" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "cp" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "delete" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "rm" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "forward" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "fwd" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "move" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "mv" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "read" -d 'Read a message from the active account (built-in flag reader)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "reply" -d 'Reply to a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "send" -d 'Send a message via the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and not __fish_seen_subcommand_from add save compose write copy cp delete rm forward fwd move mv read reply send help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s m -l mailbox -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s f -l flag -d 'Flag(s) to set on the new message. Optional' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -l send -d 'Send the message after appending it. Combines with the mandatory `--mailbox` to save-then-send'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from add" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s m -l mailbox -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s f -l flag -d 'Flag(s) to set on the new message. Optional' -r -f -a "seen\t''
answered\t''
flagged\t''
draft\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -l send -d 'Send the message after appending it. Combines with the mandatory `--mailbox` to save-then-send'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from save" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l body-file -d 'Read the body from a file. Mutually exclusive with `--body` and stdin' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l signature-file -d 'Read the signature from a file. Mutually exclusive with `--signature`' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l save -d 'Append a copy of the composed message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l send -d 'Send the composed message through the account\'s SMTP/JMAP path. Combines with `--save` to also keep a copy'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from compose" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l body-file -d 'Read the body from a file. Mutually exclusive with `--body` and stdin' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l signature-file -d 'Read the signature from a file. Mutually exclusive with `--signature`' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l save -d 'Append a copy of the composed message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l send -d 'Send the composed message through the account\'s SMTP/JMAP path. Combines with `--save` to also keep a copy'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from write" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from copy" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from cp" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from rm" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user; write your message inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from forward" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user; write your message inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from fwd" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from move" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s f -l from -d 'Source mailbox name or alias. Omit to fall back to the `inbox` alias (errors when none is configured, as the shared layer cannot guess a backend\'s inbox id)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s t -l to -d 'Destination mailbox name or alias. Mandatory' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from mv" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -l raw -d 'Write the raw RFC 5322 bytes to stdout. With the global `--json` flag the bytes are emitted as a JSON `{ "message": "…" }` string instead, keeping the output valid JSON'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -l seen -d 'Mark the message as seen while reading it. Without this flag the read leaves the seen state untouched'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from read" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l from -d 'Sender address (`From` header). Defaults to the account\'s `email`, named by its `display-name`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s t -l to -d 'Recipient address(es) (`To` header). Repeat the flag or use a comma-separated list' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l cc -d 'Carbon-copy recipient(s) (`Cc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l bcc -d 'Blind carbon-copy recipient(s) (`Bcc` header)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s s -l subject -d 'Subject line' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l body -d 'Inline body. Conflicts with `--body-file`; stdin is used as a fallback when neither is given' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l body-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l attach -d 'Attachment file(s)' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l signature -d 'Signature appended after the body, introduced by the account\'s `signature-delim` (RFC 3676 §4.3 `-- ` by default). Defaults to the account\'s `signature`' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l signature-file -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s P -l posting-style -d 'How to lay out the quoted source body relative to the user\'s body. Interleaved posting is left to the user — write your reply inside the quoted block' -r -f -a "top\t'User body above the quoted source body'
bottom\t'Quoted source body above the user body'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s Q -l quote-headline -d 'Plain-text headline placed before the quoted source body (e.g. `"On {date}, {from} wrote:"`). No substitution is performed; pass the literal string you want' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l save -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l send
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from reply" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -l save -d 'Append a copy of the sent message to this mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from send" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "compose" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "copy" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "forward" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "move" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "read" -d 'Read a message from the active account (built-in flag reader)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "reply" -d 'Reply to a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "send" -d 'Send a message via the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand msg; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -f -a "list" -d 'List the attachments carried by a single message in the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -f -a "ls" -d 'List the attachments carried by a single message in the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -f -a "download" -d 'Download specific attachments of a single message to disk'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -f -a "dl" -d 'Download specific attachments of a single message to disk'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and not __fish_seen_subcommand_from list ls download dl help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s i -l inline -d 'Include parts with `Content-Disposition: inline`'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s i -l inline -d 'Include parts with `Content-Disposition: inline`'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from ls" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s d -l dir -d 'Destination directory' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from download" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s m -l mailbox -d 'Mailbox name. Looked up against `[mailbox.alias]` case-insensitively; raw backend-native ids are accepted too and returned verbatim when no alias matches. Omit to fall back to the id mapped to the `inbox` alias' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s d -l dir -d 'Destination directory' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from dl" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from help" -f -a "list" -d 'List the attachments carried by a single message in the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from help" -f -a "download" -d 'Download specific attachments of a single message to disk'
complete -c himalaya -n "__fish_himalaya_using_subcommand attachment; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "id" -d 'Get information about the IMAP server'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "select" -d 'Select the given mailbox (SELECT, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "create" -d 'Create the given mailbox (CREATE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "delete" -d 'Delete the given mailbox (DELETE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "rename" -d 'Rename the given mailbox (RENAME, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "subscribe" -d 'Subscribe to the given mailbox (SUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "unsubscribe" -d 'Unsubscribe from the given mailbox (UNSUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "list" -d 'List mailboxes (LIST / LSUB, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "status" -d 'Get the status of the given mailbox (STATUS, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "close" -d 'Close the selected mailbox (CLOSE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "unselect" -d 'Unselect the selected mailbox (UNSELECT, RFC 3691)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "expunge" -d 'Expunge the given mailbox (EXPUNGE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "search" -d 'Search IMAP messages (SEARCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "sort" -d 'Sort IMAP messages (SORT, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "thread" -d 'Thread IMAP messages (THREAD, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "store" -d 'Store IMAP flags on message(s) (STORE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "flags" -d 'List the flags available in the given mailbox (SELECT response, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "fetch" -d 'Fetch IMAP message data items (FETCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "append" -d 'Append a message to a mailbox (APPEND, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "copy" -d 'Copy IMAP message(s) to the given mailbox (COPY, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "move" -d 'Move IMAP message(s) to the given mailbox (MOVE, RFC 6851)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "raw" -d 'Send one or more raw IMAP commands and print the verbatim server response'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and not __fish_seen_subcommand_from id select create delete rename subscribe unsubscribe list status close unselect expunge search sort thread store flags fetch append copy move raw help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s p -l parameter -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from id" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from select" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from rename" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from subscribe" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unsubscribe" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s r -l reference -d 'The reference name for the LIST/LSUB command' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s p -l pattern -d 'The mailbox name pattern with wildcards (* and %)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s A -l all -d 'List all mailboxes, not just subscribed ones'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from status" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from close" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from unselect" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from expunge" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l from -d 'Match messages whose From header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l to -d 'Match messages whose To header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l cc -d 'Match messages whose Cc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l bcc -d 'Match messages whose Bcc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l subject -d 'Match messages whose Subject header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l body -d 'Match messages whose body contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l text -d 'Match messages whose headers or body contain TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l before -d 'Match messages received before DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l since -d 'Match messages received since DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l on -d 'Match messages received on DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l larger -d 'Match messages larger than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l smaller -d 'Match messages smaller than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l seen -d 'Match \\Seen messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l unseen -d 'Match messages without the \\Seen flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l flagged -d 'Match \\Flagged messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l unflagged -d 'Match messages without the \\Flagged flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l answered -d 'Match \\Answered messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l unanswered -d 'Match messages without the \\Answered flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l deleted -d 'Match \\Deleted messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l undeleted -d 'Match messages without the \\Deleted flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l draft -d 'Match \\Draft messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l undraft -d 'Match messages without the \\Draft flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l new -d 'Match \\Recent messages that are also unseen (NEW)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l old -d 'Match messages without the \\Recent flag (OLD)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l recent -d 'Match \\Recent messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from search" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s S -l sort -d 'Sort key' -r -f -a "date\t''
arrival\t''
from\t''
to\t''
cc\t''
subject\t''
size\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l from -d 'Match messages whose From header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l to -d 'Match messages whose To header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l cc -d 'Match messages whose Cc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l bcc -d 'Match messages whose Bcc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l subject -d 'Match messages whose Subject header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l body -d 'Match messages whose body contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l text -d 'Match messages whose headers or body contain TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l before -d 'Match messages received before DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l since -d 'Match messages received since DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l on -d 'Match messages received on DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l larger -d 'Match messages larger than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l smaller -d 'Match messages smaller than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s r -l reverse -d 'Reverse sort order'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l seen -d 'Match \\Seen messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l unseen -d 'Match messages without the \\Seen flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l flagged -d 'Match \\Flagged messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l unflagged -d 'Match messages without the \\Flagged flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l answered -d 'Match \\Answered messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l unanswered -d 'Match messages without the \\Answered flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l deleted -d 'Match \\Deleted messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l undeleted -d 'Match messages without the \\Deleted flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l draft -d 'Match \\Draft messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l undraft -d 'Match messages without the \\Draft flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l new -d 'Match \\Recent messages that are also unseen (NEW)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l old -d 'Match messages without the \\Recent flag (OLD)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l recent -d 'Match \\Recent messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from sort" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s A -l algorithm -d 'Threading algorithm' -r -f -a "references\t''
orderedsubject\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l from -d 'Match messages whose From header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l to -d 'Match messages whose To header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l cc -d 'Match messages whose Cc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l bcc -d 'Match messages whose Bcc header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l subject -d 'Match messages whose Subject header contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l body -d 'Match messages whose body contains TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l text -d 'Match messages whose headers or body contain TEXT' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l before -d 'Match messages received before DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l since -d 'Match messages received since DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l on -d 'Match messages received on DATE (YYYY-MM-DD)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l larger -d 'Match messages larger than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l smaller -d 'Match messages smaller than BYTES' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l seen -d 'Match \\Seen messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l unseen -d 'Match messages without the \\Seen flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l flagged -d 'Match \\Flagged messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l unflagged -d 'Match messages without the \\Flagged flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l answered -d 'Match \\Answered messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l unanswered -d 'Match messages without the \\Answered flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l deleted -d 'Match \\Deleted messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l undeleted -d 'Match messages without the \\Deleted flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l draft -d 'Match \\Draft messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l undraft -d 'Match messages without the \\Draft flag'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l new -d 'Match \\Recent messages that are also unseen (NEW)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l old -d 'Match messages without the \\Recent flag (OLD)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l recent -d 'Match \\Recent messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from thread" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l action -d 'How to apply the flags' -r -f -a "add\t''
remove\t''
set\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s f -l flag -d 'Flags as raw IMAP tokens (RFC 3501) — this is the raw IMAP API, NOT the shared `seen|answered|flagged|draft` enum. System flags keep their backslash: `-f \'\\Seen\'`, `-f \'\\Flagged\'`. A bare word is a custom keyword: `-f seen` stores the keyword `seen`, not the `\\Seen` system flag. Use the shared `flag add -f seen` for the enum-mapped behaviour' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from store" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from flags" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l envelope -d 'Fetch the envelope (date, subject, from, to, cc, ...)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l structure -d 'Fetch the MIME body structure tree'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l flags -d 'Fetch the flags set on the message'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l internal-date -d 'Fetch the internal (server) date'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l size -d 'Fetch the size in octets'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from fetch" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s f -l flag -d 'Flags to set on the appended message, as raw IMAP tokens (RFC 3501) — this is the raw IMAP API, NOT the shared `seen|answered|flagged|draft` enum. System flags keep their backslash: `-f \'\\Seen\'`, `-f \'\\Flagged\'`. A bare word is a custom keyword: `-f seen` stores the keyword `seen`, not the `\\Seen` system flag (so `imap search --seen` will NOT match it). Use the shared `message add -f seen` for the enum-mapped behaviour' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from append" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from copy" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s m -l mailbox -d 'The name of the mailbox' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -l no-select -d 'Do not select the given mailbox before performing the current action'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -l seq -d 'Use sequence numbers instead of UIDs'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from move" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from raw" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "id" -d 'Get information about the IMAP server'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "select" -d 'Select the given mailbox (SELECT, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create the given mailbox (CREATE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete the given mailbox (DELETE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename the given mailbox (RENAME, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "subscribe" -d 'Subscribe to the given mailbox (SUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "unsubscribe" -d 'Unsubscribe from the given mailbox (UNSUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "list" -d 'List mailboxes (LIST / LSUB, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "status" -d 'Get the status of the given mailbox (STATUS, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "close" -d 'Close the selected mailbox (CLOSE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "unselect" -d 'Unselect the selected mailbox (UNSELECT, RFC 3691)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "expunge" -d 'Expunge the given mailbox (EXPUNGE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search IMAP messages (SEARCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "sort" -d 'Sort IMAP messages (SORT, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "thread" -d 'Thread IMAP messages (THREAD, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "store" -d 'Store IMAP flags on message(s) (STORE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "flags" -d 'List the flags available in the given mailbox (SELECT response, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "fetch" -d 'Fetch IMAP message data items (FETCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "append" -d 'Append a message to a mailbox (APPEND, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "copy" -d 'Copy IMAP message(s) to the given mailbox (COPY, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "move" -d 'Move IMAP message(s) to the given mailbox (MOVE, RFC 6851)'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "raw" -d 'Send one or more raw IMAP commands and print the verbatim server response'
complete -c himalaya -n "__fish_himalaya_using_subcommand imap; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "query" -d 'Send a raw JMAP method-calls array and print the response'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "mailbox" -d 'Manage JMAP mailboxes'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "mbox" -d 'Manage JMAP mailboxes'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "email" -d 'Manage JMAP emails'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "thread" -d 'Manage JMAP threads'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "identity" -d 'Manage JMAP sender identities'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "submission" -d 'Manage JMAP email submissions'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "vacation-response" -d 'Manage JMAP vacation response'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "vacation" -d 'Manage JMAP vacation response'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and not __fish_seen_subcommand_from query mailbox mbox email thread identity submission vacation-response vacation help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -l using -d 'Extra capability URNs to declare (core and mail are always included)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from query" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "get" -d 'Get JMAP mailboxes by ID (Mailbox/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "query" -d 'Query JMAP mailboxes (Mailbox/query + Mailbox/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "create" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "add" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "new" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "update" -d 'Update a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "destroy" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "delete" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "del" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "remove" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "rm" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mailbox" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "get" -d 'Get JMAP mailboxes by ID (Mailbox/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "query" -d 'Query JMAP mailboxes (Mailbox/query + Mailbox/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "create" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "add" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "new" -d 'Create a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "update" -d 'Update a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "destroy" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "delete" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "del" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "remove" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "rm" -d 'Delete a JMAP mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from mbox" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "get" -d 'Get JMAP emails by ID (Email/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "query" -d 'Query JMAP emails (Email/query + Email/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "read" -d 'Read the content of a JMAP email (Email/get with body)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "update" -d 'Update JMAP emails via patch operations (Email/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "delete" -d 'Delete JMAP emails (Email/set destroy)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "copy" -d 'Copy JMAP emails from another account (Email/copy)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "export" -d 'Export a raw RFC 5322 message to stdout (Email/get + blob download)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "import" -d 'Import an RFC 5322 message into a mailbox (upload + Email/import)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "parse" -d 'Parse RFC 5322 message blobs without storing them (Email/parse)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from email" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -f -a "get" -d 'Fetch threads by ID (Thread/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from thread" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -f -a "get" -d 'Fetch identities (Identity/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -f -a "create" -d 'Create a new identity (Identity/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -f -a "update" -d 'Update an existing identity (Identity/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -f -a "delete" -d 'Delete an identity (Identity/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from identity" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -f -a "get" -d 'Fetch submissions by ID (EmailSubmission/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -f -a "query" -d 'Query and list submissions (EmailSubmission/query + EmailSubmission/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -f -a "create" -d 'Submit a draft email for sending (EmailSubmission/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -f -a "cancel" -d 'Cancel a pending submission (EmailSubmission/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from submission" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -f -a "get" -d 'Get the vacation response (VacationResponse/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -f -a "set" -d 'Update the vacation response (VacationResponse/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation-response" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -f -a "get" -d 'Get the vacation response (VacationResponse/get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -f -a "set" -d 'Update the vacation response (VacationResponse/set)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from vacation" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "query" -d 'Send a raw JMAP method-calls array and print the response'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "mailbox" -d 'Manage JMAP mailboxes'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "email" -d 'Manage JMAP emails'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "thread" -d 'Manage JMAP threads'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "identity" -d 'Manage JMAP sender identities'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "submission" -d 'Manage JMAP email submissions'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "vacation-response" -d 'Manage JMAP vacation response'
complete -c himalaya -n "__fish_himalaya_using_subcommand jmap; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "profile" -d 'Manage the Gmail user profile (users.getProfile)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "labels" -d 'Manage Gmail labels (users.labels)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "label" -d 'Manage Gmail labels (users.labels)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "messages" -d 'Manage Gmail messages (users.messages)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "message" -d 'Manage Gmail messages (users.messages)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "msg" -d 'Manage Gmail messages (users.messages)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "attachments" -d 'Manage Gmail message attachments (messages.attachments)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "attachment" -d 'Manage Gmail message attachments (messages.attachments)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "drafts" -d 'Manage Gmail drafts (users.drafts)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "draft" -d 'Manage Gmail drafts (users.drafts)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "threads" -d 'Manage Gmail threads (users.threads)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "thread" -d 'Manage Gmail threads (users.threads)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "history" -d 'Manage the Gmail mailbox history (users.history)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "settings" -d 'Manage Gmail settings (users.settings), organized by sub-resource'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "setting" -d 'Manage Gmail settings (users.settings), organized by sub-resource'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and not __fish_seen_subcommand_from profile labels label messages message msg attachments attachment drafts draft threads thread history settings setting help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -f -a "get" -d 'Get the Gmail profile: email address, message/thread totals and the current history id'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from profile" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "list" -d 'List all Gmail labels (users.labels.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "get" -d 'Get one or more Gmail labels by identifier (users.labels.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "create" -d 'Create a Gmail label (users.labels.create)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "update" -d 'Update a Gmail label name (users.labels.update)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "delete" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "del" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "remove" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "rm" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from labels" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "list" -d 'List all Gmail labels (users.labels.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "get" -d 'Get one or more Gmail labels by identifier (users.labels.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "create" -d 'Create a Gmail label (users.labels.create)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "update" -d 'Update a Gmail label name (users.labels.update)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "delete" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "del" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "remove" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "rm" -d 'Delete a Gmail label (users.labels.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from label" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "list" -d 'List Gmail message ids matching the given query and labels (users.messages.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "get" -d 'Get a single Gmail message (users.messages.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "send" -d 'Send a Gmail message (users.messages.send)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "import" -d 'Import a Gmail message into the mailbox (users.messages.import)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "insert" -d 'Insert a Gmail message into the mailbox without sending (users.messages.insert)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "modify" -d 'Modify the labels of a Gmail message (users.messages.modify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "trash" -d 'Move a Gmail message to the trash (users.messages.trash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "untrash" -d 'Remove a Gmail message from the trash (users.messages.untrash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "delete" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "del" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "remove" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "rm" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "batch-modify" -d 'Modify the labels of several Gmail messages at once (users.messages.batchModify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "batch-delete" -d 'Permanently delete several Gmail messages at once (users.messages.batchDelete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from messages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "list" -d 'List Gmail message ids matching the given query and labels (users.messages.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "get" -d 'Get a single Gmail message (users.messages.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "send" -d 'Send a Gmail message (users.messages.send)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "import" -d 'Import a Gmail message into the mailbox (users.messages.import)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "insert" -d 'Insert a Gmail message into the mailbox without sending (users.messages.insert)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "modify" -d 'Modify the labels of a Gmail message (users.messages.modify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "trash" -d 'Move a Gmail message to the trash (users.messages.trash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "untrash" -d 'Remove a Gmail message from the trash (users.messages.untrash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "delete" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "del" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "remove" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "rm" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "batch-modify" -d 'Modify the labels of several Gmail messages at once (users.messages.batchModify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "batch-delete" -d 'Permanently delete several Gmail messages at once (users.messages.batchDelete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from message" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "list" -d 'List Gmail message ids matching the given query and labels (users.messages.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "get" -d 'Get a single Gmail message (users.messages.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "send" -d 'Send a Gmail message (users.messages.send)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "import" -d 'Import a Gmail message into the mailbox (users.messages.import)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "insert" -d 'Insert a Gmail message into the mailbox without sending (users.messages.insert)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "modify" -d 'Modify the labels of a Gmail message (users.messages.modify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "trash" -d 'Move a Gmail message to the trash (users.messages.trash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "untrash" -d 'Remove a Gmail message from the trash (users.messages.untrash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "delete" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "del" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "remove" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "rm" -d 'Permanently delete a Gmail message (users.messages.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "batch-modify" -d 'Modify the labels of several Gmail messages at once (users.messages.batchModify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "batch-delete" -d 'Permanently delete several Gmail messages at once (users.messages.batchDelete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from msg" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -f -a "get" -d 'Get a Gmail attachment by message and attachment id, then print or save its decoded bytes'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -f -a "get" -d 'Get a Gmail attachment by message and attachment id, then print or save its decoded bytes'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from attachment" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "list" -d 'List Gmail drafts (users.drafts.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "get" -d 'Get a single Gmail draft (users.drafts.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "create" -d 'Create a Gmail draft (users.drafts.create)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "update" -d 'Update a Gmail draft (users.drafts.update)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "send" -d 'Send a Gmail draft (users.drafts.send)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "delete" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "del" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "remove" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "rm" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from drafts" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "list" -d 'List Gmail drafts (users.drafts.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "get" -d 'Get a single Gmail draft (users.drafts.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "create" -d 'Create a Gmail draft (users.drafts.create)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "update" -d 'Update a Gmail draft (users.drafts.update)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "send" -d 'Send a Gmail draft (users.drafts.send)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "delete" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "del" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "remove" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "rm" -d 'Permanently delete a Gmail draft (users.drafts.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from draft" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "list" -d 'List Gmail threads matching the given query and labels (users.threads.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "get" -d 'Get a single Gmail thread with all its messages (users.threads.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "modify" -d 'Modify the labels of every message in a Gmail thread (users.threads.modify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "trash" -d 'Move a Gmail thread to the trash (users.threads.trash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "untrash" -d 'Remove a Gmail thread from the trash (users.threads.untrash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "delete" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "del" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "remove" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "rm" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from threads" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "list" -d 'List Gmail threads matching the given query and labels (users.threads.list)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "get" -d 'Get a single Gmail thread with all its messages (users.threads.get)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "modify" -d 'Modify the labels of every message in a Gmail thread (users.threads.modify)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "trash" -d 'Move a Gmail thread to the trash (users.threads.trash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "untrash" -d 'Remove a Gmail thread from the trash (users.threads.untrash)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "delete" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "del" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "remove" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "rm" -d 'Permanently delete a Gmail thread (users.threads.delete)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from thread" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -f -a "list" -d 'List the changes applied to the mailbox since a given history id'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from history" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "vacation" -d 'Manage the Gmail vacation responder settings (users.settings.getVacation / updateVacation)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "imap" -d 'Manage the Gmail IMAP access settings (users.settings.getImap / updateImap)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "pop" -d 'Manage the Gmail POP access settings (users.settings.getPop / updatePop)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "language" -d 'Manage the Gmail display language settings (users.settings.getLanguage / updateLanguage)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "auto-forwarding" -d 'Manage the Gmail auto-forwarding settings (users.settings.getAutoForwarding / updateAutoForwarding)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "autoforwarding" -d 'Manage the Gmail auto-forwarding settings (users.settings.getAutoForwarding / updateAutoForwarding)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "filters" -d 'Manage Gmail filters (users.settings.filters)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "filter" -d 'Manage Gmail filters (users.settings.filters)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "forwarding-addresses" -d 'Manage Gmail forwarding addresses (users.settings.forwardingAddresses)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "forwarding-address" -d 'Manage Gmail forwarding addresses (users.settings.forwardingAddresses)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "delegates" -d 'Manage Gmail delegates (users.settings.delegates)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "delegate" -d 'Manage Gmail delegates (users.settings.delegates)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "send-as" -d 'Manage Gmail send-as aliases (settings.sendAs)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "sendas" -d 'Manage Gmail send-as aliases (settings.sendAs)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from settings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "vacation" -d 'Manage the Gmail vacation responder settings (users.settings.getVacation / updateVacation)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "imap" -d 'Manage the Gmail IMAP access settings (users.settings.getImap / updateImap)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "pop" -d 'Manage the Gmail POP access settings (users.settings.getPop / updatePop)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "language" -d 'Manage the Gmail display language settings (users.settings.getLanguage / updateLanguage)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "auto-forwarding" -d 'Manage the Gmail auto-forwarding settings (users.settings.getAutoForwarding / updateAutoForwarding)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "autoforwarding" -d 'Manage the Gmail auto-forwarding settings (users.settings.getAutoForwarding / updateAutoForwarding)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "filters" -d 'Manage Gmail filters (users.settings.filters)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "filter" -d 'Manage Gmail filters (users.settings.filters)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "forwarding-addresses" -d 'Manage Gmail forwarding addresses (users.settings.forwardingAddresses)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "forwarding-address" -d 'Manage Gmail forwarding addresses (users.settings.forwardingAddresses)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "delegates" -d 'Manage Gmail delegates (users.settings.delegates)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "delegate" -d 'Manage Gmail delegates (users.settings.delegates)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "send-as" -d 'Manage Gmail send-as aliases (settings.sendAs)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "sendas" -d 'Manage Gmail send-as aliases (settings.sendAs)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from setting" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "profile" -d 'Manage the Gmail user profile (users.getProfile)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "labels" -d 'Manage Gmail labels (users.labels)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "messages" -d 'Manage Gmail messages (users.messages)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "attachments" -d 'Manage Gmail message attachments (messages.attachments)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "drafts" -d 'Manage Gmail drafts (users.drafts)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "threads" -d 'Manage Gmail threads (users.threads)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "history" -d 'Manage the Gmail mailbox history (users.history)'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "settings" -d 'Manage Gmail settings (users.settings), organized by sub-resource'
complete -c himalaya -n "__fish_himalaya_using_subcommand gmail; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "profile" -d 'Manage the Microsoft Graph signed-in user (`GET /me`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "mail-folder" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "mail-folders" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "folder" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "folders" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "message" -d 'Manage Microsoft Graph messages (`me.messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "messages" -d 'Manage Microsoft Graph messages (`me.messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "msg" -d 'Manage Microsoft Graph messages (`me.messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "attachment" -d 'Manage Microsoft Graph message attachments (`me.messages.attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "attachments" -d 'Manage Microsoft Graph message attachments (`me.messages.attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and not __fish_seen_subcommand_from profile mail-folder mail-folders folder folders message messages msg attachment attachments help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -f -a "get" -d 'Get the Microsoft Graph user profile: id, display name, mail and user principal name'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from profile" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "list" -d 'List Microsoft Graph mail folders (`GET /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "child-folders" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "children" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "child" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "get" -d 'Get one or more Microsoft Graph mail folders by id (`GET /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "create" -d 'Create a Microsoft Graph mail folder under the mailbox root (`POST /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "rename" -d 'Rename a Microsoft Graph mail folder (`PATCH /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "copy" -d 'Copy a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "move" -d 'Move a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "delete" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "del" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "remove" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "rm" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folder" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "list" -d 'List Microsoft Graph mail folders (`GET /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "child-folders" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "children" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "child" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "get" -d 'Get one or more Microsoft Graph mail folders by id (`GET /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "create" -d 'Create a Microsoft Graph mail folder under the mailbox root (`POST /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "rename" -d 'Rename a Microsoft Graph mail folder (`PATCH /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "copy" -d 'Copy a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "move" -d 'Move a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "delete" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "del" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "remove" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "rm" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from mail-folders" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "list" -d 'List Microsoft Graph mail folders (`GET /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "child-folders" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "children" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "child" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "get" -d 'Get one or more Microsoft Graph mail folders by id (`GET /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "create" -d 'Create a Microsoft Graph mail folder under the mailbox root (`POST /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "rename" -d 'Rename a Microsoft Graph mail folder (`PATCH /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "copy" -d 'Copy a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "move" -d 'Move a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "delete" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "del" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "remove" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "rm" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folder" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "list" -d 'List Microsoft Graph mail folders (`GET /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "child-folders" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "children" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "child" -d 'List a mail folder\'s child folders (`GET /me/mailFolders/{id}/childFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "get" -d 'Get one or more Microsoft Graph mail folders by id (`GET /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "create" -d 'Create a Microsoft Graph mail folder under the mailbox root (`POST /me/mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "rename" -d 'Rename a Microsoft Graph mail folder (`PATCH /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "copy" -d 'Copy a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "move" -d 'Move a Microsoft Graph mail folder into another folder (`POST /me/mailFolders/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "delete" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "del" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "remove" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "rm" -d 'Delete a Microsoft Graph mail folder and everything in it (`DELETE /me/mailFolders/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from folders" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "list" -d 'List Microsoft Graph messages (`GET /me/messages` or, with `--folder`, `GET /me/mailFolders/{id}/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "get" -d 'Get a single Microsoft Graph message (`GET /me/messages/{id}`), or its raw RFC 5322 bytes with `--raw` (`GET /me/messages/{id}/$value`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "create" -d 'Create a Microsoft Graph draft message from raw MIME (`POST /me/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "update" -d 'Update a Microsoft Graph message (`PATCH /me/messages/{id}`): mark read/unread, set importance or replace categories'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "send" -d 'Send a Microsoft Graph message from raw MIME (`POST /me/sendMail`); Graph saves it to Sent Items'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "copy" -d 'Copy a Microsoft Graph message into another folder (`POST /me/messages/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "move" -d 'Move a Microsoft Graph message into another folder (`POST /me/messages/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "delete" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "del" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "remove" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "rm" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from message" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "list" -d 'List Microsoft Graph messages (`GET /me/messages` or, with `--folder`, `GET /me/mailFolders/{id}/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "get" -d 'Get a single Microsoft Graph message (`GET /me/messages/{id}`), or its raw RFC 5322 bytes with `--raw` (`GET /me/messages/{id}/$value`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "create" -d 'Create a Microsoft Graph draft message from raw MIME (`POST /me/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "update" -d 'Update a Microsoft Graph message (`PATCH /me/messages/{id}`): mark read/unread, set importance or replace categories'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "send" -d 'Send a Microsoft Graph message from raw MIME (`POST /me/sendMail`); Graph saves it to Sent Items'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "copy" -d 'Copy a Microsoft Graph message into another folder (`POST /me/messages/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "move" -d 'Move a Microsoft Graph message into another folder (`POST /me/messages/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "delete" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "del" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "remove" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "rm" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from messages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "list" -d 'List Microsoft Graph messages (`GET /me/messages` or, with `--folder`, `GET /me/mailFolders/{id}/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "get" -d 'Get a single Microsoft Graph message (`GET /me/messages/{id}`), or its raw RFC 5322 bytes with `--raw` (`GET /me/messages/{id}/$value`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "create" -d 'Create a Microsoft Graph draft message from raw MIME (`POST /me/messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "update" -d 'Update a Microsoft Graph message (`PATCH /me/messages/{id}`): mark read/unread, set importance or replace categories'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "send" -d 'Send a Microsoft Graph message from raw MIME (`POST /me/sendMail`); Graph saves it to Sent Items'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "copy" -d 'Copy a Microsoft Graph message into another folder (`POST /me/messages/{id}/copy`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "move" -d 'Move a Microsoft Graph message into another folder (`POST /me/messages/{id}/move`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "delete" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "del" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "remove" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "rm" -d 'Permanently delete a Microsoft Graph message (`DELETE /me/messages/{id}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from msg" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "list" -d 'List a message\'s attachments (`GET /me/messages/{id}/attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "get" -d 'Download an attachment\'s content (`GET /me/messages/{id}/attachments/{aid}/$value`), then print or save its bytes'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "create" -d 'Add a file attachment to a message (`POST /me/messages/{id}/attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "delete" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "del" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "remove" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "rm" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachment" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "list" -d 'List a message\'s attachments (`GET /me/messages/{id}/attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "get" -d 'Download an attachment\'s content (`GET /me/messages/{id}/attachments/{aid}/$value`), then print or save its bytes'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "create" -d 'Add a file attachment to a message (`POST /me/messages/{id}/attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "delete" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "del" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "remove" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "rm" -d 'Delete an attachment (`DELETE /me/messages/{id}/attachments/{aid}`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from attachments" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from help" -f -a "profile" -d 'Manage the Microsoft Graph signed-in user (`GET /me`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from help" -f -a "mail-folder" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from help" -f -a "message" -d 'Manage Microsoft Graph messages (`me.messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from help" -f -a "attachment" -d 'Manage Microsoft Graph message attachments (`me.messages.attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand msgraph; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "create" -d 'Create a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "rename" -d 'Rename a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "delete" -d 'Delete a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "list" -d 'List Maildir folders'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "messages" -d 'Manage MAILDIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "flags" -d 'Manage MAILDIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and not __fish_seen_subcommand_from create rename delete list messages flags help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s m -l maildir -d 'Path to the Maildir' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from rename" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s m -l maildir -d 'Path to the Maildir' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -f -a "save" -d 'Store a message into a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -f -a "copy" -d 'Copy Maildir message(s) to another folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -f -a "move" -d 'Move Maildir message(s) to another folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from messages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -f -a "list" -d 'List the standard Maildir flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -f -a "add" -d 'Add MAILDIR flag(s) to message(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -f -a "set" -d 'Set MAILDIR flag(s) on message(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -f -a "remove" -d 'Remove MAILDIR flag(s) from message(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from flags" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "list" -d 'List Maildir folders'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "messages" -d 'Manage MAILDIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "flags" -d 'Manage MAILDIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand maildir; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "create" -d 'Create the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "delete" -d 'Delete the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "list" -d 'List m2dir folders found under the store root'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "messages" -d 'Manage M2DIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "flags" -d 'Manage M2DIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and not __fish_seen_subcommand_from create delete list messages flags help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -f -a "save" -d 'Save a message to an m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from messages" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -f -a "list" -d 'List flags set on an m2dir message'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -f -a "add" -d 'Add M2DIR flag(s) to message(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -f -a "set" -d 'Set M2DIR flag(s) on message(s) (replaces any existing flags)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -f -a "remove" -d 'Remove M2DIR flag(s) from message(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from flags" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "list" -d 'List m2dir folders found under the store root'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "messages" -d 'Manage M2DIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "flags" -d 'Manage M2DIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand m2dir; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -f -a "send" -d 'Send a raw RFC 5322 message (MAIL FROM / RCPT TO / DATA)'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -f -a "raw" -d 'Send a raw SMTP command and print the verbatim reply'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and not __fish_seen_subcommand_from send raw help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s f -l mail-from -d 'The envelope sender (MAIL FROM reverse path)' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s t -l rcpt-to -d 'The envelope recipient(s) (RCPT TO forward path); repeatable' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from send" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from raw" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from help" -f -a "send" -d 'Send a raw RFC 5322 message (MAIL FROM / RCPT TO / DATA)'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from help" -f -a "raw" -d 'Send a raw SMTP command and print the verbatim reply'
complete -c himalaya -n "__fish_himalaya_using_subcommand smtp; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand configure" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand wizard" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -f -a "list" -d 'List all accounts declared in the configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -f -a "ls" -d 'List all accounts declared in the configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -f -a "check" -d 'Validate the account configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and not __fish_seen_subcommand_from list ls check help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from ls" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from check" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all accounts declared in the configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from help" -f -a "check" -d 'Validate the account configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand account; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s d -l dir -d 'Save completion script to the given directory' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand completion" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand manual" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -s c -l config -d 'Override the default configuration file path' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -s a -l account -d 'Override the default account' -r
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -s b -l backend -d 'Force a specific backend for cross-protocol commands' -r -f -a "auto\t''
imap\t''
jmap\t''
gmail\t''
msgraph\t''
maildir\t''
m2dir\t''
pimdir\t''
smtp\t''"
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -l log-level -l log -d 'Filter log output by level' -r -f -a "off\t'No logging'
error\t'Errors only'
warn\t'Warnings and errors'
info\t'Informational messages and above'
debug\t'Debug messages and above'
trace\t'Trace messages and above (most verbose)'"
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -l log-file -d 'Append log output to the given file instead of stderr' -r -F
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -l json -d 'Enable JSON output'
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c himalaya -n "__fish_himalaya_using_subcommand json-schema" -s V -l version -d 'Print version'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "mailbox" -d 'Manage mailboxes using the shared API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "envelope" -d 'Manage envelopes using the shared API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "flag" -d 'Manage flags using the shared API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "message" -d 'Manage messages using the shared API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "attachment" -d 'Manage attachments using the shared API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "imap" -d 'IMAP-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "jmap" -d 'JMAP-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "gmail" -d 'Gmail-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "msgraph" -d 'Microsoft Graph CLI'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "maildir" -d 'Maildir-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "m2dir" -d 'M2dir-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "smtp" -d 'SMTP-specific API'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "configure" -d 'Configure an account interactively'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "account" -d 'Manage accounts defined in the TOML configuration file'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "completion" -d 'Generate completion script for the give shell(s) to the given directory'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "manual" -d 'Generate manual pages to the given directory'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "json-schema" -d 'Generate JSON Schemas of every command\'s JSON output to the given directory'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and not __fish_seen_subcommand_from mailbox envelope flag message attachment imap jmap gmail msgraph maildir m2dir smtp configure account completion manual json-schema help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from mailbox" -f -a "list" -d 'Shared API to list mailboxes for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from envelope" -f -a "list" -d 'List envelopes for the active account, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from envelope" -f -a "search" -d 'Search envelopes for the active account using the shared search query DSL, regardless of the underlying backend'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from flag" -f -a "add" -d 'Add flag(s) to message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from flag" -f -a "set" -d 'Replace flag(s) of message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from flag" -f -a "remove" -d 'Remove flag(s) from message(s) for the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "add" -d 'Add a raw RFC 5322 message to a mailbox'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "compose" -d 'Compose a new message from CLI arguments (built-in flag composer)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "copy" -d 'Copy message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "delete" -d 'Delete message(s) from the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "forward" -d 'Forward a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "move" -d 'Move message(s) from one mailbox to another within the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "read" -d 'Read a message from the active account (built-in flag reader)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "reply" -d 'Reply to a message using the built-in flag composer'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from message" -f -a "send" -d 'Send a message via the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from attachment" -f -a "list" -d 'List the attachments carried by a single message in the active account'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from attachment" -f -a "download" -d 'Download specific attachments of a single message to disk'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "id" -d 'Get information about the IMAP server'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "select" -d 'Select the given mailbox (SELECT, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "create" -d 'Create the given mailbox (CREATE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "delete" -d 'Delete the given mailbox (DELETE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "rename" -d 'Rename the given mailbox (RENAME, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "subscribe" -d 'Subscribe to the given mailbox (SUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "unsubscribe" -d 'Unsubscribe from the given mailbox (UNSUBSCRIBE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "list" -d 'List mailboxes (LIST / LSUB, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "status" -d 'Get the status of the given mailbox (STATUS, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "close" -d 'Close the selected mailbox (CLOSE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "unselect" -d 'Unselect the selected mailbox (UNSELECT, RFC 3691)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "expunge" -d 'Expunge the given mailbox (EXPUNGE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "search" -d 'Search IMAP messages (SEARCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "sort" -d 'Sort IMAP messages (SORT, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "thread" -d 'Thread IMAP messages (THREAD, RFC 5256)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "store" -d 'Store IMAP flags on message(s) (STORE, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "flags" -d 'List the flags available in the given mailbox (SELECT response, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "fetch" -d 'Fetch IMAP message data items (FETCH, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "append" -d 'Append a message to a mailbox (APPEND, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "copy" -d 'Copy IMAP message(s) to the given mailbox (COPY, RFC 3501)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "move" -d 'Move IMAP message(s) to the given mailbox (MOVE, RFC 6851)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from imap" -f -a "raw" -d 'Send one or more raw IMAP commands and print the verbatim server response'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "query" -d 'Send a raw JMAP method-calls array and print the response'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "mailbox" -d 'Manage JMAP mailboxes'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "email" -d 'Manage JMAP emails'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "thread" -d 'Manage JMAP threads'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "identity" -d 'Manage JMAP sender identities'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "submission" -d 'Manage JMAP email submissions'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from jmap" -f -a "vacation-response" -d 'Manage JMAP vacation response'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "profile" -d 'Manage the Gmail user profile (users.getProfile)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "labels" -d 'Manage Gmail labels (users.labels)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "messages" -d 'Manage Gmail messages (users.messages)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "attachments" -d 'Manage Gmail message attachments (messages.attachments)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "drafts" -d 'Manage Gmail drafts (users.drafts)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "threads" -d 'Manage Gmail threads (users.threads)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "history" -d 'Manage the Gmail mailbox history (users.history)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from gmail" -f -a "settings" -d 'Manage Gmail settings (users.settings), organized by sub-resource'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from msgraph" -f -a "profile" -d 'Manage the Microsoft Graph signed-in user (`GET /me`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from msgraph" -f -a "mail-folder" -d 'Manage Microsoft Graph mail folders (`me.mailFolders`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from msgraph" -f -a "message" -d 'Manage Microsoft Graph messages (`me.messages`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from msgraph" -f -a "attachment" -d 'Manage Microsoft Graph message attachments (`me.messages.attachments`)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "create" -d 'Create a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "rename" -d 'Rename a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "delete" -d 'Delete a Maildir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "list" -d 'List Maildir folders'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "messages" -d 'Manage MAILDIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from maildir" -f -a "flags" -d 'Manage MAILDIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from m2dir" -f -a "create" -d 'Create the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from m2dir" -f -a "delete" -d 'Delete the given m2dir folder'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from m2dir" -f -a "list" -d 'List m2dir folders found under the store root'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from m2dir" -f -a "messages" -d 'Manage M2DIR messages'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from m2dir" -f -a "flags" -d 'Manage M2DIR flags'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from smtp" -f -a "send" -d 'Send a raw RFC 5322 message (MAIL FROM / RCPT TO / DATA)'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from smtp" -f -a "raw" -d 'Send a raw SMTP command and print the verbatim reply'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from account" -f -a "list" -d 'List all accounts declared in the configuration'
complete -c himalaya -n "__fish_himalaya_using_subcommand help; and __fish_seen_subcommand_from account" -f -a "check" -d 'Validate the account configuration'
