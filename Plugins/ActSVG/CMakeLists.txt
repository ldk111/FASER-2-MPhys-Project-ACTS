add_library(
  ActsPluginActSVG SHARED
  src/EventDataSvgConverter.cpp
  src/LayerSvgConverter.cpp
  src/SurfaceArraySvgConverter.cpp
  src/SurfaceSvgConverter.cpp
  src/TrackingGeometrySvgConverter.cpp)
target_include_directories(
  ActsPluginActSVG
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
    $<INSTALL_INTERFACE:include>)
target_link_libraries(
  ActsPluginActSVG PUBLIC ActsCore actsvg::core actsvg::meta)

install(
  TARGETS ActsPluginActSVG
  EXPORT ActsPluginActSVGTargets
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(
  DIRECTORY include/Acts
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
