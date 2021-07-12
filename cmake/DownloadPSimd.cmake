CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR)

PROJECT(psimd-download NONE)

execute_process(COMMAND which git)
execute_process(COMMAND git --version)

INCLUDE(ExternalProject)
ExternalProject_Add(psimd
	GIT_REPOSITORY https://github.com/Maratyszcza/psimd.git
	GIT_TAG origin/master
	SOURCE_DIR "${CMAKE_BINARY_DIR}/psimd-source"
	BINARY_DIR "${CMAKE_BINARY_DIR}/psimd"
	CONFIGURE_COMMAND "which" "git"
	BUILD_COMMAND "bash" "-c" "$(which git) --version"
	INSTALL_COMMAND ""
	TEST_COMMAND ""
)

execute_process(COMMAND cat "${CMAKE_BINARY_DIR}/psimd-download/psimd-prefix/tmp/psimd-gitclone.cmake")