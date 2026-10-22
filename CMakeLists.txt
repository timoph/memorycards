cmake_minimum_required(VERSION 3.16)

project(memorycards LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC OFF)

find_package(Qt6 QUIET COMPONENTS Core Gui Qml Quick QuickControls2)

if(Qt6_FOUND)
    set(QT_LIBS Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::QuickControls2)
else()
    find_package(Qt5 5.12 REQUIRED COMPONENTS Core Gui Qml Quick)
    set(QT_LIBS Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick)
endif()

add_executable(memorycards
    main.cpp
    imageprovider.cpp
    imageprovider.h
    gameengine.cpp
    gameengine.h
    resources.qrc
)

target_include_directories(memorycards PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(memorycards PRIVATE ${QT_LIBS})
