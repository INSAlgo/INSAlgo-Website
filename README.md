# INSAlgo Website: general information, showcase, portfolio & blog

### Install setup

1. Install [prerequisites](https://jekyllrb.com/docs/installation/other-linux/): Ruby, and Jekyll. If using NixOs, just run `nix develop`.
2. Install Jekyll and Bundler gem: `gem install jekyll bundler`
3. Create a new Jekyll site using `jekyll new INSAlgo`
4. On NixOs, no need to `cd` into the new directory to serve it. Just run `bundle exec jekyll serve`
5. Browse to [http://localhost:4000](http://localhost:4000)

Well, it was actually a lot more trouble than that on NixOs. The problem here is that an environment variable for the theme is missing. Make sure to install the theme as a package, and set `SASS_PATH` accordingly.

```
export SASS_PATH=/home/onyr/.local/share/gem/ruby/3.1.0/gems/minima-2.5.1/_sass
```


### TODO
+ [ ] [Continue tutorial](https://jekyllrb.com/docs/step-by-step/09-collections/)
+ [ ] Create a custom theme for the website.