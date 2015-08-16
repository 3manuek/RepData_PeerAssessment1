all: PA1_template.html 

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # vanilla, but with --environ

PA1_template.html: PA1_template.Rmd
	R ${R_OPTS} -e "rmarkdown::render('PA1_template.Rmd', clean=FALSE)"

clean:
	rm PA1_template.md PA1_template.html 
