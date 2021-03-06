#############################################################################
# Makefile for building: MyXPDF
# Generated by qmake (2.01a) (Qt 4.8.1) on: Mon May 13 22:50:26 2013
# Project:  MyXPDF.pro
# Template: subdirs
# Command: /usr/bin/qmake -spec /usr/share/qt4/mkspecs/linux-g++ -o Makefile MyXPDF.pro
#############################################################################

first: make_default
MAKEFILE      = Makefile
QMAKE         = /usr/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = $(COPY_DIR)
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
SUBTARGETS    =  \
		sub-Freetype \
		sub-Xpdf \
		sub-Viewer

Freetype//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) Freetype/ || $(MKDIR) Freetype/ 
	cd Freetype/ && $(QMAKE) /home/mrsoul/Documents/source/Freetype/Freetype.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Freetype-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) Freetype/ || $(MKDIR) Freetype/ 
	cd Freetype/ && $(QMAKE) /home/mrsoul/Documents/source/Freetype/Freetype.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Freetype: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE)
sub-Freetype-make_default-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) 
sub-Freetype-make_default: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) 
sub-Freetype-make_first-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) first
sub-Freetype-make_first: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) first
sub-Freetype-all-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) all
sub-Freetype-all: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) all
sub-Freetype-clean-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) clean
sub-Freetype-clean: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) clean
sub-Freetype-distclean-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Freetype-distclean: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Freetype-install_subtargets-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) install
sub-Freetype-install_subtargets: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) install
sub-Freetype-uninstall_subtargets-ordered: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) uninstall
sub-Freetype-uninstall_subtargets: Freetype//$(MAKEFILE) FORCE
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) uninstall
Xpdf//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) Xpdf/ || $(MKDIR) Xpdf/ 
	cd Xpdf/ && $(QMAKE) /home/mrsoul/Documents/source/Xpdf/Xpdf.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Xpdf-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) Xpdf/ || $(MKDIR) Xpdf/ 
	cd Xpdf/ && $(QMAKE) /home/mrsoul/Documents/source/Xpdf/Xpdf.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Xpdf: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE)
sub-Xpdf-make_default-ordered: Xpdf//$(MAKEFILE) sub-Freetype-make_default-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) 
sub-Xpdf-make_default: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) 
sub-Xpdf-make_first-ordered: Xpdf//$(MAKEFILE) sub-Freetype-make_first-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) first
sub-Xpdf-make_first: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) first
sub-Xpdf-all-ordered: Xpdf//$(MAKEFILE) sub-Freetype-all-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) all
sub-Xpdf-all: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) all
sub-Xpdf-clean-ordered: Xpdf//$(MAKEFILE) sub-Freetype-clean-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) clean
sub-Xpdf-clean: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) clean
sub-Xpdf-distclean-ordered: Xpdf//$(MAKEFILE) sub-Freetype-distclean-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Xpdf-distclean: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Xpdf-install_subtargets-ordered: Xpdf//$(MAKEFILE) sub-Freetype-install_subtargets-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) install
sub-Xpdf-install_subtargets: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) install
sub-Xpdf-uninstall_subtargets-ordered: Xpdf//$(MAKEFILE) sub-Freetype-uninstall_subtargets-ordered  FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) uninstall
sub-Xpdf-uninstall_subtargets: Xpdf//$(MAKEFILE) FORCE
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) uninstall
Viewer//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) Viewer/ || $(MKDIR) Viewer/ 
	cd Viewer/ && $(QMAKE) /home/mrsoul/Documents/source/Viewer/Viewer.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Viewer-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) Viewer/ || $(MKDIR) Viewer/ 
	cd Viewer/ && $(QMAKE) /home/mrsoul/Documents/source/Viewer/Viewer.pro -spec /usr/share/qt4/mkspecs/linux-g++ -o $(MAKEFILE)
sub-Viewer: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE)
sub-Viewer-make_default-ordered: Viewer//$(MAKEFILE) sub-Xpdf-make_default-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) 
sub-Viewer-make_default: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) 
sub-Viewer-make_first-ordered: Viewer//$(MAKEFILE) sub-Xpdf-make_first-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) first
sub-Viewer-make_first: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) first
sub-Viewer-all-ordered: Viewer//$(MAKEFILE) sub-Xpdf-all-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) all
sub-Viewer-all: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) all
sub-Viewer-clean-ordered: Viewer//$(MAKEFILE) sub-Xpdf-clean-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) clean
sub-Viewer-clean: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) clean
sub-Viewer-distclean-ordered: Viewer//$(MAKEFILE) sub-Xpdf-distclean-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Viewer-distclean: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) distclean
sub-Viewer-install_subtargets-ordered: Viewer//$(MAKEFILE) sub-Xpdf-install_subtargets-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) install
sub-Viewer-install_subtargets: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) install
sub-Viewer-uninstall_subtargets-ordered: Viewer//$(MAKEFILE) sub-Xpdf-uninstall_subtargets-ordered  FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) uninstall
sub-Viewer-uninstall_subtargets: Viewer//$(MAKEFILE) FORCE
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) uninstall

Makefile: MyXPDF.pro  /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf
	$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++ -o Makefile MyXPDF.pro
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/common/gcc-base.conf:
/usr/share/qt4/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt4/mkspecs/common/g++-base.conf:
/usr/share/qt4/mkspecs/common/g++-unix.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_phonon.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
qmake: qmake_all FORCE
	@$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++ -o Makefile MyXPDF.pro

qmake_all: sub-Freetype-qmake_all sub-Xpdf-qmake_all sub-Viewer-qmake_all FORCE

make_default: sub-Freetype-make_default-ordered sub-Xpdf-make_default-ordered sub-Viewer-make_default-ordered FORCE
make_first: sub-Freetype-make_first-ordered sub-Xpdf-make_first-ordered sub-Viewer-make_first-ordered FORCE
all: sub-Freetype-all-ordered sub-Xpdf-all-ordered sub-Viewer-all-ordered FORCE
clean: sub-Freetype-clean-ordered sub-Xpdf-clean-ordered sub-Viewer-clean-ordered FORCE
distclean: sub-Freetype-distclean-ordered sub-Xpdf-distclean-ordered sub-Viewer-distclean-ordered FORCE
	-$(DEL_FILE) Makefile
install_subtargets: sub-Freetype-install_subtargets-ordered sub-Xpdf-install_subtargets-ordered sub-Viewer-install_subtargets-ordered FORCE
uninstall_subtargets: sub-Freetype-uninstall_subtargets-ordered sub-Xpdf-uninstall_subtargets-ordered sub-Viewer-uninstall_subtargets-ordered FORCE

sub-Freetype-check_ordered: Freetype/$(MAKEFILE)
	cd Freetype/ && $(MAKE) -f $(MAKEFILE) check
sub-Xpdf-check_ordered: Xpdf/$(MAKEFILE) sub-Freetype-check_ordered 
	cd Xpdf/ && $(MAKE) -f $(MAKEFILE) check
sub-Viewer-check_ordered: Viewer/$(MAKEFILE) sub-Xpdf-check_ordered 
	cd Viewer/ && $(MAKE) -f $(MAKEFILE) check
check: sub-Freetype-check_ordered sub-Xpdf-check_ordered sub-Viewer-check_ordered

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all
install: install_subtargets  FORCE

uninstall:  uninstall_subtargets FORCE

FORCE:

