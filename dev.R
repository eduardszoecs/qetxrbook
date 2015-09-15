# require(devtools)
# install_github('renkun-ken/Rgitbook') # newer version

require(Rgitbook)
# gitbookInfo()  # fails
checkForGitbook()

# # create new gitbook in
# newGitbook('/home/edisz/Documents/Uni/Projects/qetxrbook')
# initGitbook()


setwd('/home/edisz/Documents/Uni/Projects/qetxrbook')
buildGitbook()
openGitbook()
publishGitbook('EDiLD/qetxrbook')
