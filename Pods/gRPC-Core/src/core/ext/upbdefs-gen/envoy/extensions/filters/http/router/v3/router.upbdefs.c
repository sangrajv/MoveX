/* This file was generated by upb_generator from the input file:
 *
 *     envoy/extensions/filters/http/router/v3/router.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated.
 * NO CHECKED-IN PROTOBUF GENCODE */

#include "upb/reflection/def.h"
#include "envoy/extensions/filters/http/router/v3/router.upbdefs.h"
#include "envoy/extensions/filters/http/router/v3/router.upb_minitable.h"

extern _upb_DefPool_Init envoy_config_accesslog_v3_accesslog_proto_upbdefinit;
extern _upb_DefPool_Init envoy_extensions_filters_network_http_connection_manager_v3_http_connection_manager_proto_upbdefinit;
extern _upb_DefPool_Init google_protobuf_duration_proto_upbdefinit;
extern _upb_DefPool_Init google_protobuf_wrappers_proto_upbdefinit;
extern _upb_DefPool_Init envoy_annotations_deprecation_proto_upbdefinit;
extern _upb_DefPool_Init udpa_annotations_status_proto_upbdefinit;
extern _upb_DefPool_Init udpa_annotations_versioning_proto_upbdefinit;
extern _upb_DefPool_Init validate_validate_proto_upbdefinit;
static const char descriptor[1722] = {'\n', '4', 'e', 'n', 'v', 'o', 'y', '/', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '/', 'f', 'i', 'l', 't', 'e', 'r', 
's', '/', 'h', 't', 't', 'p', '/', 'r', 'o', 'u', 't', 'e', 'r', '/', 'v', '3', '/', 'r', 'o', 'u', 't', 'e', 'r', '.', 'p', 
'r', 'o', 't', 'o', '\022', '\'', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 
'l', 't', 'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'r', 'o', 'u', 't', 'e', 'r', '.', 'v', '3', '\032', ')', 'e', 'n', 'v', 
'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'a', 'c', 'c', 'e', 's', 's', 'l', 'o', 'g', '/', 'v', '3', '/', 'a', 'c', 
'c', 'e', 's', 's', 'l', 'o', 'g', '.', 'p', 'r', 'o', 't', 'o', '\032', 'Y', 'e', 'n', 'v', 'o', 'y', '/', 'e', 'x', 't', 'e', 
'n', 's', 'i', 'o', 'n', 's', '/', 'f', 'i', 'l', 't', 'e', 'r', 's', '/', 'n', 'e', 't', 'w', 'o', 'r', 'k', '/', 'h', 't', 
't', 'p', '_', 'c', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', '_', 'm', 'a', 'n', 'a', 'g', 'e', 'r', '/', 'v', '3', '/', 
'h', 't', 't', 'p', '_', 'c', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', '_', 'm', 'a', 'n', 'a', 'g', 'e', 'r', '.', 'p', 
'r', 'o', 't', 'o', '\032', '\036', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 'd', 'u', 'r', 
'a', 't', 'i', 'o', 'n', '.', 'p', 'r', 'o', 't', 'o', '\032', '\036', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 
'b', 'u', 'f', '/', 'w', 'r', 'a', 'p', 'p', 'e', 'r', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '#', 'e', 'n', 'v', 'o', 'y', 
'/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 'd', 'e', 'p', 'r', 'e', 'c', 'a', 't', 'i', 'o', 'n', '.', 
'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 
't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '!', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 
'i', 'o', 'n', 's', '/', 'v', 'e', 'r', 's', 'i', 'o', 'n', 'i', 'n', 'g', '.', 'p', 'r', 'o', 't', 'o', '\032', '\027', 'v', 'a', 
'l', 'i', 'd', 'a', 't', 'e', '/', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '.', 'p', 'r', 'o', 't', 'o', '\"', '\340', '\010', '\n', 
'\006', 'R', 'o', 'u', 't', 'e', 'r', '\022', '?', '\n', '\r', 'd', 'y', 'n', 'a', 'm', 'i', 'c', '_', 's', 't', 'a', 't', 's', '\030', 
'\001', ' ', '\001', '(', '\013', '2', '\032', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'B', 
'o', 'o', 'l', 'V', 'a', 'l', 'u', 'e', 'R', '\014', 'd', 'y', 'n', 'a', 'm', 'i', 'c', 'S', 't', 'a', 't', 's', '\022', '5', '\n', 
'\020', 's', 't', 'a', 'r', 't', '_', 'c', 'h', 'i', 'l', 'd', '_', 's', 'p', 'a', 'n', '\030', '\002', ' ', '\001', '(', '\010', 'B', '\013', 
'\030', '\001', '\222', '\307', '\206', '\330', '\004', '\003', '3', '.', '0', 'R', '\016', 's', 't', 'a', 'r', 't', 'C', 'h', 'i', 'l', 'd', 'S', 'p', 
'a', 'n', '\022', 'G', '\n', '\014', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '_', 'l', 'o', 'g', '\030', '\003', ' ', '\003', '(', '\013', '2', 
'$', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'a', 'c', 'c', 'e', 's', 's', 'l', 'o', 'g', '.', 
'v', '3', '.', 'A', 'c', 'c', 'e', 's', 's', 'L', 'o', 'g', 'R', '\013', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', 'L', 'o', 'g', 
'\022', 'z', '\n', '\024', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '_', 'l', 'o', 'g', '_', 'o', 'p', 't', 'i', 'o', 'n', 's', '\030', 
'\t', ' ', '\001', '(', '\013', '2', 'H', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 
'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'r', 'o', 'u', 't', 'e', 'r', '.', 'v', '3', '.', 'R', 'o', 
'u', 't', 'e', 'r', '.', 'U', 'p', 's', 't', 'r', 'e', 'a', 'm', 'A', 'c', 'c', 'e', 's', 's', 'L', 'o', 'g', 'O', 'p', 't', 
'i', 'o', 'n', 's', 'R', '\022', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', 'L', 'o', 'g', 'O', 'p', 't', 'i', 'o', 'n', 's', '\022', 
'4', '\n', '\026', 's', 'u', 'p', 'p', 'r', 'e', 's', 's', '_', 'e', 'n', 'v', 'o', 'y', '_', 'h', 'e', 'a', 'd', 'e', 'r', 's', 
'\030', '\004', ' ', '\001', '(', '\010', 'R', '\024', 's', 'u', 'p', 'p', 'r', 'e', 's', 's', 'E', 'n', 'v', 'o', 'y', 'H', 'e', 'a', 'd', 
'e', 'r', 's', '\022', '\307', '\001', '\n', '\024', 's', 't', 'r', 'i', 'c', 't', '_', 'c', 'h', 'e', 'c', 'k', '_', 'h', 'e', 'a', 'd', 
'e', 'r', 's', '\030', '\005', ' ', '\003', '(', '\t', 'B', '\224', '\001', '\372', 'B', '\220', '\001', '\222', '\001', '\214', '\001', '\"', '\211', '\001', 'r', '\206', 
'\001', 'R', '\036', 'x', '-', 'e', 'n', 'v', 'o', 'y', '-', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '-', 'r', 'q', '-', 't', 'i', 
'm', 'e', 'o', 'u', 't', '-', 'm', 's', 'R', '&', 'x', '-', 'e', 'n', 'v', 'o', 'y', '-', 'u', 'p', 's', 't', 'r', 'e', 'a', 
'm', '-', 'r', 'q', '-', 'p', 'e', 'r', '-', 't', 'r', 'y', '-', 't', 'i', 'm', 'e', 'o', 'u', 't', '-', 'm', 's', 'R', '\023', 
'x', '-', 'e', 'n', 'v', 'o', 'y', '-', 'm', 'a', 'x', '-', 'r', 'e', 't', 'r', 'i', 'e', 's', 'R', '\025', 'x', '-', 'e', 'n', 
'v', 'o', 'y', '-', 'r', 'e', 't', 'r', 'y', '-', 'g', 'r', 'p', 'c', '-', 'o', 'n', 'R', '\020', 'x', '-', 'e', 'n', 'v', 'o', 
'y', '-', 'r', 'e', 't', 'r', 'y', '-', 'o', 'n', 'R', '\022', 's', 't', 'r', 'i', 'c', 't', 'C', 'h', 'e', 'c', 'k', 'H', 'e', 
'a', 'd', 'e', 'r', 's', '\022', '=', '\n', '\033', 'r', 'e', 's', 'p', 'e', 'c', 't', '_', 'e', 'x', 'p', 'e', 'c', 't', 'e', 'd', 
'_', 'r', 'q', '_', 't', 'i', 'm', 'e', 'o', 'u', 't', '\030', '\006', ' ', '\001', '(', '\010', 'R', '\030', 'r', 'e', 's', 'p', 'e', 'c', 
't', 'E', 'x', 'p', 'e', 'c', 't', 'e', 'd', 'R', 'q', 'T', 'i', 'm', 'e', 'o', 'u', 't', '\022', 'U', '\n', '(', 's', 'u', 'p', 
'p', 'r', 'e', 's', 's', '_', 'g', 'r', 'p', 'c', '_', 'r', 'e', 'q', 'u', 'e', 's', 't', '_', 'f', 'a', 'i', 'l', 'u', 'r', 
'e', '_', 'c', 'o', 'd', 'e', '_', 's', 't', 'a', 't', 's', '\030', '\007', ' ', '\001', '(', '\010', 'R', '#', 's', 'u', 'p', 'p', 'r', 
'e', 's', 's', 'G', 'r', 'p', 'c', 'R', 'e', 'q', 'u', 'e', 's', 't', 'F', 'a', 'i', 'l', 'u', 'r', 'e', 'C', 'o', 'd', 'e', 
'S', 't', 'a', 't', 's', '\022', '{', '\n', '\025', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '_', 'h', 't', 't', 'p', '_', 'f', 'i', 
'l', 't', 'e', 'r', 's', '\030', '\010', ' ', '\003', '(', '\013', '2', 'G', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 
's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'n', 'e', 't', 'w', 'o', 'r', 'k', '.', 'h', 't', 't', 
'p', '_', 'c', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', '_', 'm', 'a', 'n', 'a', 'g', 'e', 'r', '.', 'v', '3', '.', 'H', 
't', 't', 'p', 'F', 'i', 'l', 't', 'e', 'r', 'R', '\023', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', 'H', 't', 't', 'p', 'F', 'i', 
'l', 't', 'e', 'r', 's', '\032', '\323', '\001', '\n', '\030', 'U', 'p', 's', 't', 'r', 'e', 'a', 'm', 'A', 'c', 'c', 'e', 's', 's', 'L', 
'o', 'g', 'O', 'p', 't', 'i', 'o', 'n', 's', '\022', 'O', '\n', '%', 'f', 'l', 'u', 's', 'h', '_', 'u', 'p', 's', 't', 'r', 'e', 
'a', 'm', '_', 'l', 'o', 'g', '_', 'o', 'n', '_', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '_', 's', 't', 'r', 'e', 'a', 'm', 
'\030', '\001', ' ', '\001', '(', '\010', 'R', ' ', 'f', 'l', 'u', 's', 'h', 'U', 'p', 's', 't', 'r', 'e', 'a', 'm', 'L', 'o', 'g', 'O', 
'n', 'U', 'p', 's', 't', 'r', 'e', 'a', 'm', 'S', 't', 'r', 'e', 'a', 'm', '\022', 'f', '\n', '\033', 'u', 'p', 's', 't', 'r', 'e', 
'a', 'm', '_', 'l', 'o', 'g', '_', 'f', 'l', 'u', 's', 'h', '_', 'i', 'n', 't', 'e', 'r', 'v', 'a', 'l', '\030', '\002', ' ', '\001', 
'(', '\013', '2', '\031', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'D', 'u', 'r', 'a', 
't', 'i', 'o', 'n', 'B', '\014', '\372', 'B', '\t', '\252', '\001', '\006', '2', '\004', '\020', '\300', '\204', '=', 'R', '\030', 'u', 'p', 's', 't', 'r', 
'e', 'a', 'm', 'L', 'o', 'g', 'F', 'l', 'u', 's', 'h', 'I', 'n', 't', 'e', 'r', 'v', 'a', 'l', ':', '0', '\232', '\305', '\210', '\036', 
'+', '\n', ')', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'f', 'i', 'l', 't', 'e', 'r', '.', 'h', 't', 
't', 'p', '.', 'r', 'o', 'u', 't', 'e', 'r', '.', 'v', '2', '.', 'R', 'o', 'u', 't', 'e', 'r', 'B', '\247', '\001', '\n', '5', 'i', 
'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 
'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'r', 'o', 'u', 't', 'e', 'r', '.', 
'v', '3', 'B', '\013', 'R', 'o', 'u', 't', 'e', 'r', 'P', 'r', 'o', 't', 'o', 'P', '\001', 'Z', 'W', 'g', 'i', 't', 'h', 'u', 'b', 
'.', 'c', 'o', 'm', '/', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '/', 'g', 'o', '-', 'c', 'o', 'n', 't', 'r', 'o', 
'l', '-', 'p', 'l', 'a', 'n', 'e', '/', 'e', 'n', 'v', 'o', 'y', '/', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '/', 
'f', 'i', 'l', 't', 'e', 'r', 's', '/', 'h', 't', 't', 'p', '/', 'r', 'o', 'u', 't', 'e', 'r', '/', 'v', '3', ';', 'r', 'o', 
'u', 't', 'e', 'r', 'v', '3', '\272', '\200', '\310', '\321', '\006', '\002', '\020', '\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static _upb_DefPool_Init *deps[9] = {
  &envoy_config_accesslog_v3_accesslog_proto_upbdefinit,
  &envoy_extensions_filters_network_http_connection_manager_v3_http_connection_manager_proto_upbdefinit,
  &google_protobuf_duration_proto_upbdefinit,
  &google_protobuf_wrappers_proto_upbdefinit,
  &envoy_annotations_deprecation_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &udpa_annotations_versioning_proto_upbdefinit,
  &validate_validate_proto_upbdefinit,
  NULL
};

_upb_DefPool_Init envoy_extensions_filters_http_router_v3_router_proto_upbdefinit = {
  deps,
  &envoy_extensions_filters_http_router_v3_router_proto_upb_file_layout,
  "envoy/extensions/filters/http/router/v3/router.proto",
  UPB_STRINGVIEW_INIT(descriptor, 1722)
};
