package utils;
  typedef enum int unsigned { READY, CALCULATING  } core_state_t;
  typedef logic [7:0] byte_t;
  typedef byte_t[31:0] sha_t;
  typedef byte_t[32:0] ecdsa_t;
endpackage
