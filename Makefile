SELENIUM_JAR = `ls ext/*.jar`

.PHONY: default
default: coffee lib/SeleniumWrapper.class

.PHONY: download
download:
	@mkdir -p ext
	cd ext; wget $(npm_package_selenium_url)

.PHONY: coffee
coffee: 
	coffee -c -o lib src

lib/SeleniumWrapper.class: src/SeleniumWrapper.java
	echo "----->"
	echo `pwd`
	echo `ls ext/`
	echo $SELENIUM_JAR
	echo $(SELENIUM_JAR)
	echo "-----|"
	javac -d lib/ -classpath $(SELENIUM_JAR) src/SeleniumWrapper.java

