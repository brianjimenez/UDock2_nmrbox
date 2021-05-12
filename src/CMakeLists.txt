# Specify the minimum version for CMake
cmake_minimum_required(VERSION 2.10)

# Project's name
project(udock)

# enable C++11 standard
set(CMAKE_CXX_STANDARD 11)

# Linux & Windows OK for static compilation
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall -static-libgcc -static-libstdc++ -g")
#set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")
# For macOS, disable static compilation
#set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall -g")

# Bring the headers,into the project
include_directories(include glm imgui)

LINK_LIBRARIES(
 BulletDynamics BulletCollision LinearMath
)

# Include the project source
set (IMGUI_SOURCE_FILES imgui/imgui.cpp imgui/imgui_demo.cpp imgui/imgui_draw.cpp imgui/imgui_impl_sdl_gl3.cpp)
set (SOURCE_FILES  udock/main.cpp  udock/gl3w.c udock/marching_cubes.cpp udock/Atom.cpp ${IMGUI_SOURCE_FILES})

# Include Boost library
FIND_PACKAGE( Boost 1.40 COMPONENTS  atomic thread system  REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

# Bullet library
find_package( Bullet REQUIRED )
include_directories(${BULLET_INCLUDE_DIR})

include(CPack)

#get the source
set (SOURCE_FILES  udock/main.cpp  udock/gl3w.c udock/marching_cubes.cpp udock/Atom.cpp ${IMGUI_SOURCE_FILES})

#create an executable
set (PROJECT_NAME udock)
set (WIN_RESSOURCE_FILE ressources/toto.rc)
add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${WIN_RESOURCE_FILE})

IF(UNIX)
    INCLUDE(FindPkgConfig)
    PKG_SEARCH_MODULE(SDL2 REQUIRED sdl2)
ELSEIF(APPLE)
    INCLUDE(FindPkgConfig)
    PKG_SEARCH_MODULE(SDL2 REQUIRED sdl2)
    target_compile_options(${PROJECT_NAME} BEFORE PUBLIC -DBT_USE_DOUBLE_PRECISION)
    target_link_libraries(${PROJECT_NAME} -demangle -dynamic -arch x86_64 -framework GLUT) 
ELSE()
  message(SEND_ERROR "Platform not supported")
ENDIF()

find_package(OpenGL REQUIRED)
INCLUDE_DIRECTORIES( ${OPENGL_INCLUDE_DIRS} ${SDL2_INCLUDE_DIRS})

find_package(X11 REQUIRED)
include_directories(${X11_INCLUDE_DIR})
link_directories(${X11_LIBRARIES})

TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${OPENGL_LIBRARIES} ${CMAKE_DL_LIBS} ${SDL2_LIBRARIES} ${Boost_LIBRARIES} ${X11_LIBRARIES})

# General CPACK options
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "UDOCK - CNAM")
set(CPACK_PACKAGE_VERSION_MAJOR "2")
set(CPACK_PACKAGE_VERSION_MINOR "0")

set(CPACK_NSIS_EXECUTABLES_DIRECTORY .)
# set (CPACK_NSIS_MUI_FINISHPAGE_RUN ON)
set (CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL)
set (CPACK_PACKAGE_EXECUTABLES "udock" "Udock")

# The icon to start the application.
set(CPACK_NSIS_MUI_ICON ${CMAKE_SOURCE_DIR}/resources/udock.ico)
# Set the icon for the application in the Add/Remove programs section.
set(CPACK_NSIS_INSTALLED_ICON_NAME ${CMAKE_SOURCE_DIR}/resources/udock.ico)

# Windows Runtime libraries
set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP TRUE)
include(InstallRequiredSystemLibraries)
install(PROGRAMS ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS}
        DESTINATION bin)
# Necessary data
install(DIRECTORY ${CMAKE_SOURCE_DIR}/resources/
        DESTINATION resources)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/shaders/
        DESTINATION shaders)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/textures/
        DESTINATION textures)
install(TARGETS ${PROJECT_NAME}
        RUNTIME
        DESTINATION bin)
