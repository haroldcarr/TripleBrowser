#
# Created       : 2006 Jul 26 (Wed) 14:50:24 by Harold Carr.
# Last Modified : 2006 Jul 28 (Fri) 16:58:49 by Harold Carr.
#

SRCDIR		= ./src
BINDIR		= ./bin
OUTDIR		= ./www
TOMCATDIR	= ./tomcat
URL		= com.differentity.Main

JAVA_HOME	= $(ALT_BOOTDIR)/bin
JAVA		= $(JAVA_HOME)/java
JAVAC		= $(JAVA_HOME)/javac
GWT_HOME	= $(shell hcGwtHome)
PSEP		= $(shell hcPathSep)
GWT_DEV		= $(GWT_HOME)/gwt-dev-windows.jar
GWT_RUN		= $(GWT_HOME)/gwt-user.jar

CP		= "$(SRCDIR)$(PSEP)$(BINDIR)$(PSEP)$(GWT_DEV)$(PSEP)$(GWT_RUN)"
GWT_COMPILER	= $(JAVA) -cp $(CP) com.google.gwt.dev.GWTCompiler
GWT_COMPILER_HELP = $(GWT_COMPILER) --help
GWT_COMPILE	= $(GWT_COMPILER) -out $(OUTDIR) $(URL)

SERVER_COMPILE	= $(JAVAC) -cp $(CP) -sourcepath $(SRCDIR) -d $(BINDIR)  src/com/differentity/server/MyServiceImpl.java 

GWT_SHELLER	= $(JAVA)  -cp $(CP) com.google.gwt.dev.GWTShell
GWT_SHELLER_HELP= $(GWT_SHELLER) --help
GWT_SHELL	= $(GWT_SHELLER) -out $(OUTDIR) $(URL)/Main.html

all :
	-@echo "Usage: make [ sc | gc | gs ]"

gc :
	$(GWT_COMPILE)

gch :
	$(GWT_COMPILER_HELP)

sc : $(BINDIR)
	-echo $(SERVER_COMPILE)
	$(SERVER_COMPILE)

gs :
	$(GWT_SHELL)&

gsh :
	$(GWT_SHELLER_HELP)

$(BINDIR) : FORCE
	mkdir -p $(BINDIR)

clean : FORCE
	rm -rf $(BINDIR) $(OUTDIR) $(TOMCATDIR)

FORCE :



# End of file.
