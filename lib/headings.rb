def progress_bar(length)
  progressbar = ProgressBar.create
  length.times { progressbar.increment; sleep 0.01 }
end
