/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/extensions/filters/http/fault/v3/fault.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "envoy/extensions/filters/http/fault/v3/fault.upb.h"
#include "envoy/config/route/v3/route_components.upb.h"
#include "envoy/extensions/filters/common/fault/v3/fault.upb.h"
#include "envoy/type/v3/percent.upb.h"
#include "google/protobuf/wrappers.upb.h"
#include "udpa/annotations/status.upb.h"
#include "udpa/annotations/versioning.upb.h"
#include "validate/validate.upb.h"

#include "upb/port_def.inc"

static const upb_MiniTable_Sub envoy_extensions_filters_http_fault_v3_FaultAbort_submsgs[2] = {
  {.submsg = &envoy_type_v3_FractionalPercent_msginit},
  {.submsg = &envoy_extensions_filters_http_fault_v3_FaultAbort_HeaderAbort_msginit},
};

static const upb_MiniTable_Field envoy_extensions_filters_http_fault_v3_FaultAbort__fields[4] = {
  {2, UPB_SIZE(8, 16), UPB_SIZE(-5, -5), kUpb_NoSub, 13, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(12, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(8, 16), UPB_SIZE(-5, -5), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(8, 16), UPB_SIZE(-5, -5), kUpb_NoSub, 13, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_extensions_filters_http_fault_v3_FaultAbort_msginit = {
  &envoy_extensions_filters_http_fault_v3_FaultAbort_submsgs[0],
  &envoy_extensions_filters_http_fault_v3_FaultAbort__fields[0],
  UPB_SIZE(16, 24), 4, kUpb_ExtMode_NonExtendable, 0, 255, 0,
};

const upb_MiniTable envoy_extensions_filters_http_fault_v3_FaultAbort_HeaderAbort_msginit = {
  NULL,
  NULL,
  UPB_SIZE(0, 0), 0, kUpb_ExtMode_NonExtendable, 0, 255, 0,
};

static const upb_MiniTable_Sub envoy_extensions_filters_http_fault_v3_HTTPFault_submsgs[5] = {
  {.submsg = &envoy_extensions_filters_common_fault_v3_FaultDelay_msginit},
  {.submsg = &envoy_extensions_filters_http_fault_v3_FaultAbort_msginit},
  {.submsg = &envoy_config_route_v3_HeaderMatcher_msginit},
  {.submsg = &google_protobuf_UInt32Value_msginit},
  {.submsg = &envoy_extensions_filters_common_fault_v3_FaultRateLimit_msginit},
};

static const upb_MiniTable_Field envoy_extensions_filters_http_fault_v3_HTTPFault__fields[15] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(2, 2), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(12, 24), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 40), UPB_SIZE(0, 0), 2, 11, kUpb_FieldMode_Array | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(24, 48), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Array | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(28, 56), UPB_SIZE(3, 3), 3, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(32, 64), UPB_SIZE(4, 4), 4, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(36, 72), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(44, 88), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {10, UPB_SIZE(52, 104), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {11, UPB_SIZE(60, 120), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {12, UPB_SIZE(68, 136), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {13, UPB_SIZE(76, 152), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {14, UPB_SIZE(84, 168), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {15, UPB_SIZE(1, 1), UPB_SIZE(0, 0), kUpb_NoSub, 8, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_extensions_filters_http_fault_v3_HTTPFault_msginit = {
  &envoy_extensions_filters_http_fault_v3_HTTPFault_submsgs[0],
  &envoy_extensions_filters_http_fault_v3_HTTPFault__fields[0],
  UPB_SIZE(96, 184), 15, kUpb_ExtMode_NonExtendable, 15, 255, 0,
};

static const upb_MiniTable *messages_layout[3] = {
  &envoy_extensions_filters_http_fault_v3_FaultAbort_msginit,
  &envoy_extensions_filters_http_fault_v3_FaultAbort_HeaderAbort_msginit,
  &envoy_extensions_filters_http_fault_v3_HTTPFault_msginit,
};

const upb_MiniTable_File envoy_extensions_filters_http_fault_v3_fault_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  3,
  0,
  0,
};

#include "upb/port_undef.inc"

