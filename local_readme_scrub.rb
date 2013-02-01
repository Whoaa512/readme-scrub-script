#!/usr/bin/env ruby
def scrub_local_repo (*filenames)

  raise ArgumentError, 'Arguments array cannot be empty' unless filenames.any?

  # No need to do file sanity check--this command is tolerant of invalid filenames
  command = "git filter-branch --index-filter 'git rm --cached --ignore-unmatch #{filenames.join(' ')}' --prune-empty --tag-name-filter cat -- --all"
  %x(#{command})
end



# TODO: before scrubbing check to make sure current dir is a catalyst repo
scrub_local_repo 'README.*'