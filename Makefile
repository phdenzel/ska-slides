PREFIX ?= $(HOME)/phdenzel.github.io/assets/blog-assets/xyz-blog-title

export: emacs-compile
	mv index.html slides.html
	sed -i 's#file:///home/phdenzel/local/reveal.js/dist/reveal.css#./assets/css/reveal.css#g' slides.html
	sed -i 's#file:///home/phdenzel/local/reveal.js/dist/theme/phdcolloq.css#./assets/css/theme/phdcolloq.css#g' slides.html
	sed -i 's#/home/phdenzel/local/reveal.js/dist/reveal.js#./assets/js/reveal.js#g' slides.html
	sed -i 's#file:///home/phdenzel/local/reveal.js/plugin/markdown/markdown.js#./assets/js/markdown/markdown.js#g' slides.html
	sed -i 's#file:///home/phdenzel/local/reveal.js/plugin/math/math.js#./assets/js/math/math.js#g' slides.html
	sed -i 's#file:///home/phdenzel/local/reveal.js/plugin/zoom/zoom.js#./assets/js/zoom/zoom.js#g' slides.html

emacs-compile:
	@emacsclient --alternate-editor='' -e '(progn (find-file "index.org") (org-reveal-export-to-html))'

install: export
	cp slides.html $(PREFIX)/slides.html

clean:
	rm -rf index.html
