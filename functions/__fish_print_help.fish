function __fish_print_help --description "Print help message for the specified fish function or builtin" --argument item
    if test "$item" = '.'
        set item source
    end

    # Do nothing if the file does not exist
    if not test -e "$__fish_data_dir/man/man1/$item.1" -o -e "$__fish_data_dir/man/man1/$item.1.gz"
        return
    end

    # Render help output, save output into the variable 'help'
    set -l help
    set -l format
    set -l cols
    if test -n "$COLUMNS"
        set cols (math $COLUMNS - 4) # leave a bit of space on the right
    end

    # Pick which command we are using to render output or fail if none
    if command -qs nroff
        set format nroff -c -man -t
        if test -e $__fish_data_dir/groff/fish.tmac
            set -a format -M$__fish_data_dir/groff -mfish
        end
        if test -n "$cols"
            set -a format -rLL={$cols}n
        end
    else if command -qs mandoc
        set format mandoc -c
        if test -n "$cols"
            set -a format -O width=$cols
        end
    else
        echo fish: (_ "Cannot format help; no parser found")
        return 1
    end

    if test -e "$__fish_data_dir/man/man1/$item.1"
        set help ($format "$__fish_data_dir/man/man1/$item.1" 2>/dev/null)
    else if test -e "$__fish_data_dir/man/man1/$item.1.gz"
        set help (gunzip -c "$__fish_data_dir/man/man1/$item.1.gz" 2>/dev/null | $format 2>/dev/null)
    end

    # The original implementation trimmed off the top 5 lines and bottom 3 lines
    # from the nroff output. Perhaps that's reliable, but the magic numbers make
    # me extremely nervous. Instead, let's just strip out any lines that start
    # in the first column. "normal" manpages put all section headers in the first
    # column, but fish manpages only leave NAME like that, which we want to trim
    # away anyway.
    #
    # While we're at it, let's compress sequences of blank lines down to a single
    # blank line, to duplicate the default behavior of `man`, or more accurately,
    # the `-s` flag to `less` that `man` passes.
    set -l state blank
    for line in $help
        # categorize the line
        set -l line_type
        switch $line
            case ' *' \t\*
                # starts with whitespace, check if it has non-whitespace
                printf "%s\n" $line | read -l word __
                if test -n $word
                    set line_type normal
                else
                    # lines with just spaces probably shouldn't happen
                    # but let's consider them to be blank
                    set line_type blank
                end
            case ''
                set line_type blank
            case '*'
                # not leading space, and not empty, so must contain a non-space
                # in the first column. That makes it a header/footer.
                set line_type meta
        end

        switch $state
            case normal
                switch $line_type
                    case normal
                        printf "%s\n" $line
                    case blank
                        set state blank
                    case meta
                        # skip it
                end
            case blank
                switch $line_type
                    case normal
                        echo # print the blank line
                        printf "%s\n" $line
                        set state normal
                    case blank meta
                        # skip it
                end
        end
    end | ul # post-process with `ul`, to interpret the old-style grotty escapes
    echo # print a trailing blank line
end
