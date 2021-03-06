set(_opencc_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})

find_path(Opencc_INCLUDE_PATH opencc/opencc.h)

if (Opencc_STATIC)
  if (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  endif (WIN32)
endif (Opencc_STATIC)
find_library(Opencc_LIBRARY NAMES opencc)
if(Opencc_INCLUDE_PATH AND Opencc_LIBRARY)
  set(Opencc_FOUND TRUE)
endif(Opencc_INCLUDE_PATH AND Opencc_LIBRARY)
if(Opencc_FOUND)
  if(NOT Opencc_FIND_QUIETLY)
    message(STATUS "Found opencc: ${Opencc_LIBRARY}")
  endif(NOT Opencc_FIND_QUIETLY)
else(Opencc_FOUND)
  if(Opencc_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find opencc library.")
  endif(Opencc_FIND_REQUIRED)
endif(Opencc_FOUND)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${_opencc_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
