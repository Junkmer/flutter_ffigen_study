cmake_minimum_required(VERSION 3.10)

project(flutter_ffigen_study_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_ffigen_study SHARED
        duktape.c                     # Modify
)

set_target_properties(flutter_ffigen_study PROPERTIES
        PUBLIC_HEADER duktape.h       # Modify
        PRIVATE_HEADER duk_config.h   # Add
        OUTPUT_NAME "flutter_ffigen_study"      # Add
)

# Add from here...
if (WIN32)
    set_target_properties(flutter_ffigen_study PROPERTIES
            WINDOWS_EXPORT_ALL_SYMBOLS ON
    )
endif (WIN32)
# ... to here.

target_compile_definitions(flutter_ffigen_study PUBLIC DART_SHARED_LIB)

#            # The Flutter tooling requires that developers have CMake 3.10 or later
#            # installed. You should not increase this version, as doing so will cause
#            # the plugin to fail to compile for some customers of the plugin.
#            cmake_minimum_required(VERSION 3.10)
#
#            project(flutter_ffigen_study_library VERSION 0.0.1 LANGUAGES C)
#
#            add_library(flutter_ffigen_study SHARED
#              "flutter_ffigen_study.c"
#            )
#
#            set_target_properties(flutter_ffigen_study PROPERTIES
#              PUBLIC_HEADER flutter_ffigen_study.h
#              OUTPUT_NAME "flutter_ffigen_study"
#            )
#
#            target_compile_definitions(flutter_ffigen_study PUBLIC DART_SHARED_LIB)
