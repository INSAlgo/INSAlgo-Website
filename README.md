# INSAlgo Website: general information, showcase, portfolio & blog

### Install setup

##### Initial setup on NixOs
>Now, this should work directly using `nix develop`, the following describes the full initial setup.

1. Install [prerequisites](https://jekyllrb.com/docs/installation/other-linux/): Ruby, and Jekyll. If using NixOs, just run `nix develop`.
2. Install Jekyll and Bundler gem: `gem install jekyll bundler`
3. Create a new Jekyll site using `jekyll new INSAlgo`
4. On NixOs, no need to `cd` into the new directory to serve it. Just run `bundle exec jekyll serve`
5. Browse to [http://localhost:4000](http://localhost:4000)

Well, it was actually a lot more trouble than that on NixOs. The problem here is that an environment variable for the theme is missing. Make sure to install the theme as a package, and set `SASS_PATH` accordingly.

```
export SASS_PATH=/home/onyr/.local/share/gem/ruby/3.1.0/gems/minima-2.5.1/_sass
```

Serve locally during development using `bundle exec jekyll serve`.

##### On other distros

Check: [Requirements and install | Jekyll doc](https://jekyllrb.com/docs/installation/#requirements)

### Working on the website.

This website is built using [Jekyll](https://jekyllrb.com/).

All content on the website is written in Markdown or HTML, with a preference for Markdown which is simple. Note that if you need punctually some HTML inside your Markdown file, you can use it directly inside.

For emojis, please use [NerdFont Icons](https://www.nerdfonts.com/cheat-sheet), like in the example below:

```html
I really <i class="nf nf-fa-heart"></i> <i class="nf nf-custom-vim"></i>
```



