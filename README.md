## Let's stop delayed releases...

Finally, most of my projects including Karma and all its plugins are released automatically.
I though it might be helpful for others, so I’m gonna try to describe the process here.

**I think it would be neat if somebody made it more generic and created a service for it...**

Each project uses [grunt-auto-release], which does:
- fetch the latest changes from given remote repository (upstream by default)
- check for new changes (that is either feat/fix, style/tests/chore commits are ignored)
- check Travis build 
- run `grunt release` task (assuming there are some new changes and Travis build succeeded)

Each project defines `grunt release` task, which typically does:
- bump the version
- generate the changelog
- update the list of contributors
- create tag
- push to upstream
- push to NPM

See Karma’s [Gruntfile] for an example. It uses [grunt-conventional-changelog], [grunt-bump], [grunt-npm plugins].

The rest is kind of dirty [shell script], that basically goes through all the projects and calls `grunt auto-release`.
It also buffers outputs and send me an email afterwards.

The whole thing is run as a cron job:
```bash
# crontab -e
# run each Sunday/Wednesday at midnight
5 23 * * 0,3 /home/vojta/auto-release/cron.sh >> /var/tmp/auto-release.cron
```

You can also run it on Mac:
```bash
launchctl load org.vojta-auto-release.plist
```


*Note:* this workflow is based on the [git commit message convention].


[shell script]: https://github.com/vojtajina/auto-release/blob/master/cron.sh
[grunt-auto-release]: https://github.com/vojtajina/grunt-auto-release
[Gruntfile]: https://github.com/karma-runner/karma/blob/master/Gruntfile.coffee
[grunt-conventional-changelog]: https://github.com/btford/grunt-conventional-changelog
[grunt-bump]: https://github.com/vojtajina/grunt-bump
[grunt-npm plugins]: https://github.com/vojtajina/grunt-npm
[git commit message convention]: https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/pub
